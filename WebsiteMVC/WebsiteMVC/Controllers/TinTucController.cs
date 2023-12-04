using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebsiteMVC.Controllers
{
    public class TinTucController : BaseController
    {
        // GET: TinTuc
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult TopTinTuc()
        {
            var lst = db.TinTucs.OrderBy(q => q.CreateTime).Take(5).ToList();
            return View(lst);
        }

        public ActionResult Detail(int id)
        {
            return View(db.TinTucs.Find(id));
        }
    }
}