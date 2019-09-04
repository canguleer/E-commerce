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
    public class Product_OrderController : Controller
    {
        private Entities1 db = new Entities1();

        // GET: Product_Order
        public ActionResult Index()
        {
            var product_Order = db.Product_Order.Include(p => p.Order).Include(p => p.Product);
            return View(product_Order.ToList());
        }

        // GET: Product_Order/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product_Order product_Order = db.Product_Order.Find(id);
            if (product_Order == null)
            {
                return HttpNotFound();
            }
            return View(product_Order);
        }

        // GET: Product_Order/Create
        public ActionResult Create()
        {
            ViewBag.order_id = new SelectList(db.Order, "order_id", "orderName");
            ViewBag.product_id = new SelectList(db.Product, "product_id", "productName");
            return View();
        }

        // POST: Product_Order/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "productOrder_id,product_id,order_id")] Product_Order product_Order)
        {
            if (ModelState.IsValid)
            {
                db.Product_Order.Add(product_Order);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.order_id = new SelectList(db.Order, "order_id", "orderName", product_Order.order_id);
            ViewBag.product_id = new SelectList(db.Product, "product_id", "productName", product_Order.product_id);
            return View(product_Order);
        }

        // GET: Product_Order/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product_Order product_Order = db.Product_Order.Find(id);
            if (product_Order == null)
            {
                return HttpNotFound();
            }
            ViewBag.order_id = new SelectList(db.Order, "order_id", "orderName", product_Order.order_id);
            ViewBag.product_id = new SelectList(db.Product, "product_id", "productName", product_Order.product_id);
            return View(product_Order);
        }

        // POST: Product_Order/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "productOrder_id,product_id,order_id")] Product_Order product_Order)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product_Order).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.order_id = new SelectList(db.Order, "order_id", "orderName", product_Order.order_id);
            ViewBag.product_id = new SelectList(db.Product, "product_id", "productName", product_Order.product_id);
            return View(product_Order);
        }

        // GET: Product_Order/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product_Order product_Order = db.Product_Order.Find(id);
            if (product_Order == null)
            {
                return HttpNotFound();
            }
            return View(product_Order);
        }

        // POST: Product_Order/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product_Order product_Order = db.Product_Order.Find(id);
            db.Product_Order.Remove(product_Order);
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
