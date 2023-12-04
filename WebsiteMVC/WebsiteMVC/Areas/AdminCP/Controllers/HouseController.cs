using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMVC.Models;

namespace WebsiteMVC.Areas.AdminCP.Controllers
{
    public class HouseController : AdminController
    {
        public ActionResult Index()
        {
            return View(db.Houses.Where(q => q.State != MState.DELETE));
        }

        public JsonResult Delete(int id)
        {
            var ob = db.Houses.Find(id);
            ob.State = MState.DELETE;
            return Json(db.SaveChanges());
        }

        public ActionResult Edit(int? id)
        {
            House obj = new House();
            if (id > 0)
            {
                obj = db.Houses.Find(id);
            }
            ViewBag.IDTaiKhoans = db.TaiKhoans.Where(q => q.State != MState.DELETE).CreateSelectList(q => q.IDTaiKhoan, q => q.FullName, obj?.IDTaiKhoan);
            ViewBag.IDDuAns = db.DuAns.Where(q => q.State != MState.DELETE).CreateSelectList(q => q.IDDuAn, q => q.Name, obj?.IDDuAn);

            _fillInfo(db.Houses.Find(id));
            ViewBag.xAddress1s = db.Addresses.Where(q => q.Rank == 1).CreateSelectList(q => q.IDAddress, q => q.Name, obj?.xAddress1?.IDAddress);
            ViewBag.xAddress2s = db.Addresses.Where(q => q.Rank == 2).CreateSelectList(q => q.IDAddress, q => q.Name, obj?.xAddress2?.IDAddress);
            ViewBag.xAddress3s = db.Addresses.Where(q => q.Rank == 3).CreateSelectList(q => q.IDAddress, q => q.Name, obj?.xAddress3?.IDAddress);

            return View(obj);
        }

        public ActionResult InfoHouse(int? id)
        {
            var lst = new List<InfoHouse>();
            var ob = db.Houses.Find(id);
            var allKeys = db.Keys.Where(q => q.Category.State.Contains("house") && q.Active != false).ToList();
            if (id > 0)
            {
                allKeys.ForEach(item =>
                {
                    var obj = ob.InfoHouses.FirstOrDefault(q => q.IDKey == item.IDKey);
                    if (obj == null)
                    {
                        lst.Add(new Models.InfoHouse
                        {
                            House = new House { },
                            IDHouse = 0,
                            IDInfoHouse = 0,
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
                    lst.Add(new Models.InfoHouse
                    {
                        House = new House { },
                        IDHouse = 0,
                        IDInfoHouse = 0,
                        IDKey = a.IDKey,
                        Key = a,
                        Value = ""
                    });
                });
            }
            return View(lst);
        }

        [HttpPost]
        public ActionResult Edit(House obj, InfoHouse[] InfoHouse, int IDAddress1, int IDAddress2, int IDAddress3, HttpPostedFileBase[] Image)
        {
            if (obj.IDHouse == 0)
            {
                db.Houses.Add(obj);
                db.SaveChanges();

                InfoHouse.ToList().ForEach(q =>
                {
                    q.IDHouse = obj.IDHouse;
                    db.InfoHouses.Add(q);
                });
                db.AddressHouses.Add(new AddressHouse
                {
                    IDHouse = obj.IDHouse,
                    IDAddress = IDAddress1,
                });
                db.AddressHouses.Add(new AddressHouse
                {
                    IDHouse = obj.IDHouse,
                    IDAddress = IDAddress2,
                });
                db.AddressHouses.Add(new AddressHouse
                {
                    IDHouse = obj.IDHouse,
                    IDAddress = IDAddress3,
                });
            }
            else
            {
                db.Entry(obj).State = System.Data.Entity.EntityState.Modified;
                InfoHouse.ToList().ForEach(q =>
                {
                    if (q.IDInfoHouse > 0)
                    {
                        if (db.InfoHouses.FirstOrDefault(a => a.IDInfoHouse == q.IDInfoHouse) is InfoHouse ob)
                        {
                            if (q.Value == null)
                                db.InfoHouses.Remove(ob);
                            else
                            {
                                ob.Value = q.Value;
                            }
                        }
                    }
                    else if (q.Value != null && q.IDInfoHouse == 0)
                    {
                        db.InfoHouses.Add(q);
                    }
                });
            }

            foreach (var item in this.RequestAndSaveImage(true))
            {
                db.ImageHouses.Add(new ImageHouse
                {
                    IDHouse = obj.IDHouse,
                    Link = item,
                    IDImageHouse = 0,
                    Name = "View",
                    Rank = 0
                });
            }

            db.SaveChanges();
            return RedirectToAction("Index");
        }

        private House _fillInfo(House item)
        {
            if (item != null)
            {
                item.xImage = item.ImageHouses.FirstOrDefault(q => q.IDHouse == item.IDHouse && q.Rank == 0);
                item.xAddress1 = @item.AddressHouses.FirstOrDefault(q => q.Address.Rank == 1)?.Address;
                item.xAddress2 = @item.AddressHouses.FirstOrDefault(q => q.Address.Rank == 2)?.Address;
                item.xAddress3 = @item.AddressHouses.FirstOrDefault(q => q.Address.Rank == 3)?.Address;
            }
            return item;
        }

        public JsonResult State(int IDHouse, byte newState)
        {
            db.Houses.Find(IDHouse).State = newState;
            return Json(db.SaveChanges());
        }
    }
}