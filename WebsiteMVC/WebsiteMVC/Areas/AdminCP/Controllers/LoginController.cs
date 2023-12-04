using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebsiteMVC.Areas.AdminCP.Controllers
{
    public class LoginController : Controller
    {
        // GET: AdminCP/Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(string username, string password)
        {
            if (Models.LoginHelper.CheckLogin(username, password))
            {
                return RedirectToAction("Index", "House", new { Area = "AdminCP" });
            }
            ModelState.AddModelError("", "Đăng nhập thất bại");
            return View();
        }

        public ActionResult Logout()
        {
            Models.LoginHelper.Logout();
            return RedirectToAction("Index");
        }
    }
}