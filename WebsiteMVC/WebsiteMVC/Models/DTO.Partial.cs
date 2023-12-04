using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebsiteMVC.Models
{
    public class BaseInfo
    {
        public Address xAddress1 { get; set; }
        public Address xAddress2 { get; set; }
        public Address xAddress3 { get; set; }
    }

    public partial class DuAn : BaseInfo
    {
        public ImageDuAn xImage { get; set; }
    }

    public partial class House : BaseInfo
    {
        public ImageHouse xImage { get; set; }
    }
}