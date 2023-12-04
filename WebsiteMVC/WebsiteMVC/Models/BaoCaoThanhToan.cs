using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebsiteMVC.Models
{
    public class BaoCaoThanhToan
    {
        public DateTime Time { get; set; }
        public decimal SoBai { get; set; }
        public int SoDuAn { get; set; }
        public string LinkDetalt { get; set; }
    }
}