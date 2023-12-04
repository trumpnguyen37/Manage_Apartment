using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebsiteMVC.Models;

namespace WebsiteMVC.Areas.AdminCP.Controllers
{
    public class InvestorController : AdminController
    {
        // GET: AdminCP/Investors
        public ActionResult Index()
        {
            return View(db.Investors.ToList());
        }

        // GET: AdminCP/Investors/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Investor investor = db.Investors.Find(id);
            if (investor == null)
            {
                return HttpNotFound();
            }
            return View(investor);
        }

        // GET: AdminCP/Investors/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: AdminCP/Investors/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDInvestor,Name,Logo,Sumary,Active")] Investor investor)
        {
            if (ModelState.IsValid)
            {
                db.Investors.Add(investor);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(investor);
        }

        // GET: AdminCP/Investors/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Investor investor = db.Investors.Find(id);
            if (investor == null)
            {
                return HttpNotFound();
            }
            return View(investor);
        }

        // POST: AdminCP/Investors/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDInvestor,Name,Logo,Sumary,Active")] Investor investor)
        {
            if (ModelState.IsValid)
            {
                db.Entry(investor).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(investor);
        }

        // GET: AdminCP/Investors/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Investor investor = db.Investors.Find(id);
            if (investor == null)
            {
                return HttpNotFound();
            }
            return View(investor);
        }

        // POST: AdminCP/Investors/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Investor investor = db.Investors.Find(id);
            db.Investors.Remove(investor);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}
