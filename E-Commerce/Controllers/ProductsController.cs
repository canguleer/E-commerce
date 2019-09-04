using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using E_Commerce.Models;
using PagedList;

namespace E_Commerce.Controllers
{

    public class ProductsController : Controller
    {
        private Entities1 db = new Entities1();

        // GET: Products
        public ActionResult Index(int? page)
        {
            var product = db.Product.ToList().ToPagedList(page ?? 1, 4);
            return View(product);
        }

        // GET: Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Product.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Products/Create
        public ActionResult Create()
        {
            ViewBag.brand_id = new SelectList(db.Brand, "brand_id", "brandName");
            ViewBag.categori_id = new SelectList(db.Category, "categori_id", "categoryName");
            ViewBag.supplier_id = new SelectList(db.Supplier, "supplier_id", "companyName");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(HttpPostedFileBase photo, Product product)
        {
            if (ModelState.IsValid)
            {
                if (photo != null)
                {
                    WebImage img = new WebImage(photo.InputStream);
                    FileInfo fotoinfo = new FileInfo(photo.FileName);

                    string newfoto = Guid.NewGuid().ToString() + fotoinfo.Extension;
                    img.Resize(800, 350);
                    img.Save("~/Uploads/Foto/" + newfoto);
                    product.photo = "/Uploads/Foto/" + newfoto;
                }




                db.Product.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(product);
        }

        // GET: Products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Product.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.brand_id = new SelectList(db.Brand, "brand_id", "brandName", product.brand_id);
            ViewBag.categori_id = new SelectList(db.Category, "categori_id", "categoryName", product.categori_id);
            ViewBag.supplier_id = new SelectList(db.Supplier, "supplier_id", "companyName", product.supplier_id);
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, HttpPostedFileBase photo, Product product)
        {
            try
            {
                var products = db.Product.Where(m => m.product_id == id).SingleOrDefault();


                if (photo != null)
                {
                    if (System.IO.File.Exists(Server.MapPath(products.photo)))
                    {
                        System.IO.File.Delete(Server.MapPath(products.photo));
                    }
                    WebImage img = new WebImage(photo.InputStream);
                    FileInfo fotoinfo = new FileInfo(photo.FileName);

                    string newfoto = Guid.NewGuid().ToString() + fotoinfo.Extension;
                    img.Resize(800, 350);
                    img.Save("~/Uploads/Foto/" + newfoto);
                    products.photo = "/Uploads/Foto/" + newfoto;

                }
                products.product_id = product.product_id;
                products.productName = product.productName;
                products.Product_Detail = product.Product_Detail;
                products.quantity = product.quantity;
                products.price = product.price;
                products.productIsProved = product.productIsProved;
                products.productViewed = product.productViewed;



                db.SaveChanges();
                return RedirectToAction("Index");

            }
            catch
            {

                return View();

            }
        }

        // GET: Products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Product.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id)
        {
            try
            {
                var products = db.Product.Where(m => m.product_id == id).SingleOrDefault();
                if (products == null)
                {
                    return HttpNotFound();
                }
                if (System.IO.File.Exists(Server.MapPath(products.photo)))
                {
                    System.IO.File.Delete(Server.MapPath(products.photo));
                }



                db.Product.Remove(products);
                db.SaveChanges();

                return RedirectToAction("Index");

            }
            catch
            {
                return View();
            }
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
