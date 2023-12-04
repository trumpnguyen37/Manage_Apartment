using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebsiteMVC.Models
{
    public class Search
    {
        public string NameOrCode { get; set; }

        public decimal? PriceTo { get; set; }
        public decimal? PriceFrom { get; set; }

        public bool CheckArea { get; set; }
        public int? AreaFrom { get; set; }
        public int? AreaTo { get; set; }

        public int? BedRoom { get; set; }

        public string Type { get; set; }

        public int? Page { get; set; }
    }
}