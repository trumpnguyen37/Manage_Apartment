using Bootstrap.Pagination;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebsiteMVC.Controllers
{
    public class PagetinationTestController : Controller
    {
        private readonly int[] _list;

        public PagetinationTestController()
        {
            _list = new int[123];
            for (var i = 0; i < 123; i++)
            {
                _list[i] = i + 1;
            }
        }

        public ActionResult Index(int page = 1)
        {
            ViewData["page"] = page;
            ViewData["data"] = _list.Take(10).ToArray();
            ViewData["pagination"] = new Pagination(_list.Length, page);
            return View();
        }

        public ActionResult List(int page = 1)
        {
            var skipped = new Pagination(123, page).Skipped;
            ViewData["pagination"] = new Pagination(_list.Length, page);
            ViewData["data"] = _list.Skip(skipped).Take(10).ToArray();
            return View();
        }
    }
}