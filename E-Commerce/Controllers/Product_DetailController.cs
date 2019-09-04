using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using E_Commerce.Models;

namespace E_Commerce.Controllers
{
    public class Product_DetailController : Controller
    {
        private Entities1 db = new Entities1();

        // GET: Product_Detail
        public ActionResult Index(int ? page)
        {
            var product_Detail = db.Product_Detail.Include(p => p.Product);
            return View(product_Detail.ToList());
        }

        // GET: Product_Detail/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product_Detail product_Detail = db.Product_Detail.Find(id);
            if (product_Detail == null)
            {
                return HttpNotFound();
            }
            return View(product_Detail);
        }

        // GET: Product_Detail/Create
        public ActionResult Create()
        {
            ViewBag.product_id = new SelectList(db.Product, "product_id", "productName");
            return View();
        }

        // POST: Product_Detail/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "productDetail_id,properties,propertiesDetail,product_id")] Product_Detail product_Detail)
        {
            if (ModelState.IsValid)
            {
                db.Product_Detail.Add(product_Detail);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.product_id = new SelectList(db.Product, "product_id", "productName", product_Detail.product_id);
            return View(product_Detail);
        }

        // GET: Product_Detail/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product_Detail product_Detail = db.Product_Detail.Find(id);
            if (product_Detail == null)
            {
                return HttpNotFound();
            }
            ViewBag.product_id = new SelectList(db.Product, "product_id", "productName", product_Detail.product_id);
            return View(product_Detail);
        }

        // POST: Product_Detail/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "productDetail_id,properties,propertiesDetail,product_id")] Product_Detail product_Detail)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product_Detail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.product_id = new SelectList(db.Product, "product_id", "productName", product_Detail.product_id);
            return View(product_Detail);
        }

        // GET: Product_Detail/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product_Detail product_Detail = db.Product_Detail.Find(id);
            if (product_Detail == null)
            {
                return HttpNotFound();
            }
            return View(product_Detail);
        }

        // POST: Product_Detail/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product_Detail product_Detail = db.Product_Detail.Find(id);
            db.Product_Detail.Remove(product_Detail);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

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
