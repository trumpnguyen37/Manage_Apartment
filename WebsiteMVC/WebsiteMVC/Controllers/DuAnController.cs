using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMVC.Models;

namespace WebsiteMVC.Controllers
{
    public class DuAnController : BaseController
    {
        public ActionResult Index()
        {
            var lst = db.DuAns.Where(q => q.State != MState.DELETE).Take(5).ToList();
            lst.ForEach((item) => _fillDuAn(item));
            return View(lst);
        }

        public ActionResult TopDuAn()
        {
            var lst = db.DuAns.Where(q => q.State != MState.DELETE).Take(6).ToList();
            lst.ForEach((item) => _fillDuAn(item));
            return View(lst);
        }

        private DuAn _fillDuAn(DuAn item)
        {
            item.xImage = item.ImageDuAns.FirstOrDefault(q => q.Rank == 0);
            item.xAddress1 = item.AddressDuAns.FirstOrDefault(q => q.Address.Rank == 1)?.Address;
            item.xAddress2 = item.AddressDuAns.FirstOrDefault(q => q.Address.Rank == 2)?.Address;
            item.xAddress3 = item.AddressDuAns.FirstOrDefault(q => q.Address.Rank == 3)?.Address;
            return item;
        }

        public ActionResult Detail(int IDDuAn)
        {
            return View(_fillDuAn(db.DuAns.Find(IDDuAn)));
        }

        public ActionResult More(int IDDuAn)
        {
            var duan = db.DuAns.Find(IDDuAn);
            _fillDuAn(duan);
            var lst = db.DuAns.Where(q => q.AddressDuAns.Any(a => a.IDAddress == duan.xAddress1.IDAddress) && q.AddressDuAns.Any(a => a.IDAddress == duan.xAddress2.IDAddress)).ToList();
            lst.ForEach(a => _fillDuAn(a));
            return View(lst);
        }

    }
}