using Bootstrap.Pagination;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMVC.Models;

namespace WebsiteMVC.Controllers
{
    public class HouseController : BaseController
    {

        #region Index
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// Load top 6 nhà Hot
        /// </summary>
        /// <returns></returns>
        public ActionResult TopHouse(bool? IsBan)
        {
            var lst = db.Houses.Where(q => q.State != MState.DELETE).Take(3 * 1).ToList();
            foreach (var item in lst)
            {
                item.xImage = item.ImageHouses.FirstOrDefault(q => q.IDHouse == item.IDHouse && q.Rank == 0);
                item.xAddress1 = @item.AddressHouses.FirstOrDefault(q => q.Address.Rank == 1)?.Address;
                item.xAddress2 = @item.AddressHouses.FirstOrDefault(q => q.Address.Rank == 2)?.Address;
                item.xAddress3 = @item.AddressHouses.FirstOrDefault(q => q.Address.Rank == 3)?.Address;
            }

            ViewBag.IsBan = IsBan;
            return View(lst);
        }
        #endregion

        #region Detail
        /// <summary>
        /// Chi tiết nhà
        /// </summary>
        /// <param name="IDHouse"></param>
        /// <returns></returns>
        public ActionResult Detail(int IDHouse)
        {
            var item = db.Houses.Find(IDHouse);
            if (item != null)
            {
                item.Views++;
                db.SaveChanges();
            }
            item.xImage = item.ImageHouses.FirstOrDefault(q => q.IDHouse == item.IDHouse && q.Rank == 0);
            item.xAddress1 = @item.AddressHouses.FirstOrDefault(q => q.Address.Rank == 1)?.Address;
            item.xAddress2 = @item.AddressHouses.FirstOrDefault(q => q.Address.Rank == 2)?.Address;
            item.xAddress3 = @item.AddressHouses.FirstOrDefault(q => q.Address.Rank == 3)?.Address;
            return View(item);
        }

        public ActionResult InfoHouse(int id)
        {
            var obj = db.Houses.Find(id);
            return View(obj.InfoHouses.ToList());
        }

        public ActionResult ImageHouse(int id)
        {
            return View(db.Houses.Find(id).ImageHouses.ToList());
        }

        public ActionResult More(int? IDHouse, bool? IsCungDuAn)
        {
            var house = _fillInfo(db.Houses.Find(IDHouse));

            var lst = new List<House>();
            if (IsCungDuAn.HasValue)
            {
                lst = db.Houses.Where(q => q.IDDuAn == house.IDDuAn && q.IDHouse != IDHouse).Take(10).ToList();
            }
            else
            {
                lst = db.Houses.Where(q => q.AddressHouses.Any(a => a.IDAddress == house.xAddress1.IDAddress) && q.AddressHouses.Any(a => a.IDAddress == house.xAddress2.IDAddress)).Take(3).ToList();
            }

            lst.ForEach((item) => { _fillInfo(item); });

            if (IsCungDuAn.HasValue)
            {
                return View("CungDuAn", lst);
            }
            return View(lst);
        }

        private House _fillInfo(House item)
        {
            item.xImage = item.ImageHouses.FirstOrDefault(q => q.IDHouse == item.IDHouse && q.Rank == 0);
            item.xAddress1 = @item.AddressHouses.FirstOrDefault(q => q.Address.Rank == 1)?.Address;
            item.xAddress2 = @item.AddressHouses.FirstOrDefault(q => q.Address.Rank == 2)?.Address;
            item.xAddress3 = @item.AddressHouses.FirstOrDefault(q => q.Address.Rank == 3)?.Address;
            return item;
        }

        #endregion

        #region Search

        const int LENGTH = 10;

        public ActionResult Search(Search search)
        {
            var lst = db.Houses.Where(q => q.State != MState.DELETE);

            if (search.PriceFrom.HasValue)
            {
                lst = lst.Where(q => q.Price >= search.PriceFrom);
            }

            if (search.PriceTo.HasValue)
            {
                lst = lst.Where(q => q.Price <= search.PriceTo);
            }

            if (string.IsNullOrWhiteSpace(search.NameOrCode) == false)
            {
                lst = lst.Where(q => q.Code.ToLower().Contains(search.NameOrCode.ToLower()) || q.Name.ToLower().Contains(search.NameOrCode.ToLower()));
            }
            if (search.BedRoom > 0)
            {
                if (search.BedRoom == 5)
                {
                    lst = lst.Where(q => q.BedRoom >= search.BedRoom);
                }
                else
                {
                    lst = lst.Where(q => q.BedRoom == search.BedRoom);
                }
            }

            if (search.CheckArea == true)
            {
                lst = lst.Where(q => q.Area >= search.AreaFrom && q.Area <= search.AreaTo);
            }

            if (string.IsNullOrWhiteSpace(search.Type) == false)
            {
                lst = lst.Where(q => q.Type == search.Type);
            }

            var data = lst.ToList();
            data.ForEach(item => _fillInfo(item));

            var pagination = new Pagination(data.Count, search.Page ?? 1, 10, LENGTH);
            ViewBag.pagination = pagination;

            ViewBag.AreaFrom = search.AreaFrom;
            ViewBag.AreaTo = search.AreaTo;
            ViewBag.BedRoom = search.BedRoom;
            ViewBag.CheckArea = search.CheckArea;
            ViewBag.NameOrCode = search.NameOrCode;
            ViewBag.Page = search.Page;
            ViewBag.PriceFrom = search.PriceFrom;
            ViewBag.PriceTo = search.PriceTo;
            ViewBag.Type = search.Type;
            ViewBag.search = search;

            return View(data.Skip(pagination.Skipped).Take(LENGTH));
        }

        public ActionResult ListPage(Search search)
        {
            var lst = db.Houses.Where(q => q.State != MState.DELETE);
            if (string.IsNullOrWhiteSpace(search.NameOrCode) == false)
            {
                lst = lst.Where(q => q.Code.ToLower().Contains(search.NameOrCode.ToLower()) || q.Name.ToLower().Contains(search.NameOrCode.ToLower()));
            }
            if (search.BedRoom > 0)
            {
                if (search.BedRoom == 5)
                {
                    lst = lst.Where(q => q.BedRoom >= search.BedRoom);
                }
                else
                {
                    lst = lst.Where(q => q.BedRoom == search.BedRoom);
                }
            }

            if (search.CheckArea == true)
            {
                lst = lst.Where(q => q.Area >= search.AreaFrom && q.Area <= search.AreaTo);
            }

            if (string.IsNullOrWhiteSpace(search.Type) == false)
            {
                lst = lst.Where(q => q.Type == search.Type);
            }

            var data = lst.ToList();
            data.ForEach(item => _fillInfo(item));

            var pagination = new Pagination(data.Count, search.Page ?? 1, 10, LENGTH);
            ViewBag.pagination = pagination;

            ViewBag.AreaFrom = search.AreaFrom;
            ViewBag.AreaTo = search.AreaTo;
            ViewBag.BedRoom = search.BedRoom;
            ViewBag.CheckArea = search.CheckArea;
            ViewBag.NameOrCode = search.NameOrCode;
            ViewBag.Page = search.Page;
            ViewBag.PriceFrom = search.PriceFrom;
            ViewBag.PriceTo = search.PriceTo;
            ViewBag.Type = search.Type;
            ViewBag.search = search;

            return View(data.Skip(pagination.Skipped).Take(LENGTH));
        }
        #endregion

        #region GT
        public ActionResult GT()
        {
            return View();
        }
        #endregion
    }

    public class BaseController : Controller
    {
        public HOUSEEntities db = new HOUSEEntities();
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}