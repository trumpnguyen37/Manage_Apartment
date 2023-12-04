using System.Web.Mvc;

namespace WebsiteMVC.Areas.AdminCP
{
    public class AdminCPAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "AdminCP";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "AdminCP_default",
                "AdminCP/{controller}/{action}/{id}",
                new { controller = "ThongKe", action = "Index", id = UrlParameter.Optional, Area = AreaName },
                namespaces: new string[] { "WebsiteMVC.Areas.AdminCP.Controllers" }
            );
        }
    }
}