using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebsiteMVC.Models;

namespace WebsiteMVC.Areas.AdminCP.Controllers
{
    public class DuAnController : AdminController
    {
        public ActionResult Index()
        {
            return View(db.DuAns.Where(q => q.State != MState.DELETE).ToList());
        }

        public JsonResult Delete(int id)
        {
            var ob = db.DuAns.Find(id);
            ob.State = MState.DELETE;
            return Json(db.SaveChanges());
        }

        public ActionResult Edit(int? id)
        {
            DuAn obj = new DuAn();
            if (id > 0)
            {
                obj = db.DuAns.Find(id);
            }
            ViewBag.IDTaiKhoans = db.TaiKhoans.Where(q => q.State != MState.DELETE).CreateSelectList(q => q.IDTaiKhoan, q => q.FullName, obj?.IDTaiKhoan);
            ViewBag.IDDuAns = db.DuAns.Where(q => q.State != MState.DELETE).CreateSelectList(q => q.IDDuAn, q => q.Name, obj?.IDDuAn);

            _fillInfo(db.DuAns.Find(id));
            ViewBag.xAddress1s = db.Addresses.Where(q => q.Rank == 1).CreateSelectList(q => q.IDAddress, q => q.Name, obj?.xAddress1?.IDAddress);
            ViewBag.xAddress2s = db.Addresses.Where(q => q.Rank == 2).CreateSelectList(q => q.IDAddress, q => q.Name, obj?.xAddress2?.IDAddress);
            ViewBag.xAddress3s = db.Addresses.Where(q => q.Rank == 3).CreateSelectList(q => q.IDAddress, q => q.Name, obj?.xAddress3?.IDAddress);

            return View(obj);
        }

        public ActionResult InfoDuAn(int? id)
        {
            var lst = new List<InfoDuAn>();
            var ob = db.DuAns.Find(id);
            var allKeys = db.Keys.Where(q => q.Category.State.Contains("DuAn") && q.Active != false).ToList();
            if (id > 0)
            {
                allKeys.ForEach(item =>
                {
                    var obj = ob.InfoDuAns.FirstOrDefault(q => q.IDKey == item.IDKey);
                    if (obj == null)
                    {
                        lst.Add(new Models.InfoDuAn
                        {
                            DuAn = new DuAn { },
                            IDDuAn = 0,
                            IDInfoDuAn = 0,
                            IDKey = item.IDKey,
                            Key = item,
                            Value = ""
                        });
                    }
                    else
                    {
                        lst.Add(obj);
                    }
                });
            }
            else
            {
                allKeys.ForEach(a =>
                {
                    lst.Add(new Models.InfoDuAn
                    {
                        DuAn = new DuAn { },
                        IDDuAn = 0,
                        IDInfoDuAn = 0,
                        IDKey = a.IDKey,
                        Key = a,
                        Value = ""
                    });
                });
            }
            return View(lst);
        }

        [HttpPost]
        public ActionResult Edit(DuAn obj, InfoDuAn[] InfoDuAn, int IDAddress1, int IDAddress2, int IDAddress3, HttpPostedFileBase[] Image)
        {
            if (obj.IDDuAn == 0)
            {
                db.DuAns.Add(obj);
                db.SaveChanges();

                InfoDuAn.ToList().ForEach(q =>
                {
                    q.IDDuAn = obj.IDDuAn;
                    db.InfoDuAns.Add(q);
                });
                db.AddressDuAns.Add(new AddressDuAn
                {
                    IDDuAn = obj.IDDuAn,
                    IDAddress = IDAddress1,
                });
                db.AddressDuAns.Add(new AddressDuAn
                {
                    IDDuAn = obj.IDDuAn,
                    IDAddress = IDAddress2,
                });
                db.AddressDuAns.Add(new AddressDuAn
                {
                    IDDuAn = obj.IDDuAn,
                    IDAddress = IDAddress3,
                });
            }
            else
            {
                db.Entry(obj).State = System.Data.Entity.EntityState.Modified;
                InfoDuAn.ToList().ForEach(q =>
                {
                    if (q.IDInfoDuAn > 0)
                    {
                        if (db.InfoDuAns.FirstOrDefault(a => a.IDInfoDuAn == q.IDInfoDuAn) is InfoDuAn ob)
                        {
                            if (q.Value == null)
                                db.InfoDuAns.Remove(ob);
                            else
                            {
                                ob.Value = q.Value;
                            }
                        }
                    }
                    else if (q.Value != null && q.IDInfoDuAn == 0)
                    {
                        db.InfoDuAns.Add(q);
                    }
                });
            }

            foreach (var item in this.RequestAndSaveImage(true))
            {
                db.ImageDuAns.Add(new ImageDuAn
                {
                    IDDuAn = obj.IDDuAn,
                    Link = item,
                    IDImageDuAn = 0,
                    Rank = 0
                });
            }

            db.SaveChanges();
            return RedirectToAction("Index");
        }

        private DuAn _fillInfo(DuAn item)
        {
            if (item != null)
            {
                item.xImage = item.ImageDuAns.FirstOrDefault(q => q.IDDuAn == item.IDDuAn && q.Rank == 0);
                item.xAddress1 = @item.AddressDuAns.FirstOrDefault(q => q.Address.Rank == 1)?.Address;
                item.xAddress2 = @item.AddressDuAns.FirstOrDefault(q => q.Address.Rank == 2)?.Address;
                item.xAddress3 = @item.AddressDuAns.FirstOrDefault(q => q.Address.Rank == 3)?.Address;
            }
            return item;
        }
    }
}
