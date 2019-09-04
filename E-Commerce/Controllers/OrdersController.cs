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
    public class OrdersController : Controller
    {
        private Entities1 db = new Entities1();

        // GET: Orders
        public ActionResult Index()
        {
            var order = db.Order.Include(o => o.Bills).Include(o => o.Product).Include(o => o.Shipper).Include(o => o.User);
            return View(order.ToList());
        }

        // GET: Orders/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Order.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        // GET: Orders/Create
        public ActionResult Create()
        {
            ViewBag.bill_id = new SelectList(db.Bills, "bill_id", "billName");
            ViewBag.product_id = new SelectList(db.Product, "product_id", "productName");
            ViewBag.shipper_id = new SelectList(db.Shipper, "shipper_id", "shipperName");
            ViewBag.user_id = new SelectList(db.User, "user_id", "userName");
            return View();
        }

        // POST: Orders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "order_id,orderName,orderDate,deliveryDate,product_id,shipper_id,user_id,bill_id")] Order order)
        {
            if (ModelState.IsValid)
            {
                db.Order.Add(order);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.bill_id = new SelectList(db.Bills, "bill_id", "billName", order.bill_id);
            ViewBag.product_id = new SelectList(db.Product, "product_id", "productName", order.product_id);
            ViewBag.shipper_id = new SelectList(db.Shipper, "shipper_id", "shipperName", order.shipper_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "userName", order.user_id);
            return View(order);
        }

        // GET: Orders/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Order.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            ViewBag.bill_id = new SelectList(db.Bills, "bill_id", "billName", order.bill_id);
            ViewBag.product_id = new SelectList(db.Product, "product_id", "productName", order.product_id);
            ViewBag.shipper_id = new SelectList(db.Shipper, "shipper_id", "shipperName", order.shipper_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "userName", order.user_id);
            return View(order);
        }

        // POST: Orders/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "order_id,orderName,orderDate,deliveryDate,product_id,shipper_id,user_id,bill_id")] Order order)
        {
            if (ModelState.IsValid)
            {
                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.bill_id = new SelectList(db.Bills, "bill_id", "billName", order.bill_id);
            ViewBag.product_id = new SelectList(db.Product, "product_id", "productName", order.product_id);
            ViewBag.shipper_id = new SelectList(db.Shipper, "shipper_id", "shipperName", order.shipper_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "userName", order.user_id);
            return View(order);
        }

        // GET: Orders/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Order.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        // POST: Orders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Order order = db.Order.Find(id);
            db.Order.Remove(order);
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
