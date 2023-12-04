using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebsiteMVC.Models
{
    public class LoginHelper
    {
        public static string LOGIN = "LOGIN";

        public static bool CheckLogin(string Username, string Password)
        {
            var acc = new HOUSEEntities().TaiKhoans.FirstOrDefault(q => q.Username == Username && q.Password == Password && q.State != MState.DELETE);
            HttpContext.Current.Session[LOGIN] = acc;
            return acc != null;
        }

        public static TaiKhoan GetAccount()
        {
            return HttpContext.Current.Session[LOGIN] as TaiKhoan;
        }

        public static void Logout()
        {
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session[LOGIN] = null;
        }


        public static bool CheckRole(params eRole[] roles)
        {
            var acc = GetAccount();
            return acc != null && (acc.POSITION == "ADMIN" || roles.Any(q => q.ToString() == acc.POSITION));
        }
    }
}