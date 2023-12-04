using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMVC.Controllers;
using WebsiteMVC.Models;

namespace WebsiteMVC.Areas.AdminCP.Controllers
{
    public class AdminController : BaseController
    {
        public TaiKhoan Account { get; protected set; }

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            Account = Models.LoginHelper.GetAccount();
            if (Account == null)
            {
                filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(new
                {
                    Controller = "Login",
                    Action = "Index",
                    Area = "AdminCP"
                }));
            }
            base.OnActionExecuting(filterContext);
        }

        public ActionResult NotPermistion()
        {
            return View();
        }
    }


    public class RoleAcceptAttribute : ActionFilterAttribute
    {
        public RoleAcceptAttribute(params eRole[] roles)
        {
            this.Roles = roles;
        }

        public eRole[] Roles { get; protected set; }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (Roles.Length > 0 && filterContext.Controller is AdminController controlerBase)
            {
                if (controlerBase.Account.POSITION != "ADMIN" && Roles.Any(q => q.ToString() == controlerBase.Account.POSITION) == false)
                {
                    filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(new
                    {
                        Controller = "Base",
                        Action = "NotPermistion",
                        Area = ""
                    }));
                }
            }
            base.OnActionExecuting(filterContext);
        }
    }

}