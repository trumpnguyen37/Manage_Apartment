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
    public class KeyController : AdminController
    {
        // GET: AdminCP/Keys
        public ActionResult Index()
        {
            var keys = db.Keys.Include(k => k.Category);
            return View(keys.ToList());
        }

        // GET: AdminCP/Keys/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Key key = db.Keys.Find(id);
            if (key == null)
            {
                return HttpNotFound();
            }
            return View(key);
        }

        // GET: AdminCP/Keys/Create
        public ActionResult Create()
        {
            ViewBag.IDCategory = new SelectList(db.Categories, "IDCategory", "Name");
            return View();
        }

        // POST: AdminCP/Keys/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDKey,Name,Rank,Active,Required,Type,IDCategory")] Key key)
        {
            if (ModelState.IsValid)
            {
                db.Keys.Add(key);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IDCategory = new SelectList(db.Categories, "IDCategory", "Name", key.IDCategory);
            return View(key);
        }

        // GET: AdminCP/Keys/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Key key = db.Keys.Find(id);
            if (key == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDCategory = new SelectList(db.Categories, "IDCategory", "Name", key.IDCategory);
            return View(key);
        }

        // POST: AdminCP/Keys/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDKey,Name,Rank,Active,Required,Type,IDCategory")] Key key)
        {
            if (ModelState.IsValid)
            {
                db.Entry(key).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDCategory = new SelectList(db.Categories, "IDCategory", "Name", key.IDCategory);
            return View(key);
        }

        // GET: AdminCP/Keys/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Key key = db.Keys.Find(id);
            if (key == null)
            {
                return HttpNotFound();
            }
            return View(key);
        }

        // POST: AdminCP/Keys/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Key key = db.Keys.Find(id);
            db.Keys.Remove(key);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}
