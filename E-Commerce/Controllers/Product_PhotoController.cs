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
using HomeBi.Libraries.PagedList;

namespace E_Commerce.Controllers
{
    public class Product_PhotoController : Controller
    {
        private Entities1 db = new Entities1();

        // GET: Product_Photo
        public ActionResult Index()
        {
            return View(db.Product_Photo.ToList());
        }

        // GET: Product_Photo/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product_Photo product_Photo = db.Product_Photo.Find(id);
            if (product_Photo == null)
            {
                return HttpNotFound();
            }
            return View(product_Photo);
        }

        // GET: Product_Photo/Create
        public ActionResult Create()
        {
            ViewBag.product_id = new SelectList(db.Product, "product_id", "productName");
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(HttpPostedFileBase[] photo, Product_Photo product_Photo)
        {
            if (ModelState.IsValid)
            {
                if (photo != null)
                {
                    Product_Photo prd = null;//yeni bir nesne oluşturup onun içine attım!!
                    foreach (var item in photo)
                    {
                        prd = new Product_Photo();
                        WebImage img = new WebImage(item.InputStream);
                        FileInfo fotoinfo = new FileInfo(item.FileName);

                        string newfoto = Guid.NewGuid().ToString() + fotoinfo.Extension;
                        img.Resize(800, 350);
                        img.Save("~/Uploads/Foto/" + newfoto);
                        prd.product_id = product_Photo.product_id;
                        prd.photo = "/Uploads/Foto/" + newfoto;
                        db.Product_Photo.Add(prd);
                    }
                }

                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(product_Photo);
        }

        // GET: Product_Photo/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product_Photo product_Photo = db.Product_Photo.Find(id);
            if (product_Photo == null)
            {
                return HttpNotFound();
            }
            ViewBag.product_id = new SelectList(db.Product, "product_id", "productName", product_Photo.product_id);
            return View(product_Photo);
        }

        // POST: Product_Photo/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, HttpPostedFileBase[] photo, Product_Photo product_Photo)
        {
            try
            {
                var product_Photos = db.Product_Photo.Where(m => m.productPhoto_id == id).SingleOrDefault();


                if (photo != null)
                {
                    foreach (var item in photo)
                    {
                        if (System.IO.File.Exists(Server.MapPath(product_Photos.photo)))
                        {
                            System.IO.File.Delete(Server.MapPath(product_Photos.photo));
                        }
                        WebImage img = new WebImage(item.InputStream);
                        FileInfo fotoinfo = new FileInfo(item.FileName);

                        string newfoto = Guid.NewGuid().ToString() + fotoinfo.Extension;
                        img.Resize(800, 350);
                        img.Save("~/Uploads/Foto/" + newfoto);
                        product_Photos.photo = "/Uploads/Foto/" + newfoto;
                    }
                }


                product_Photos.productPhoto_id = product_Photo.productPhoto_id;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {

                return View();

            }
        }

        // GET: Product_Photo/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product_Photo product_Photo = db.Product_Photo.Find(id);
            if (product_Photo == null)
            {
                return HttpNotFound();
            }
            return View(product_Photo);
        }


        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id)
        {
            try
            {
                var product_Photos = db.Product_Photo.Where(m => m.productPhoto_id == id).SingleOrDefault();
                if (product_Photos == null)
                {
                    return HttpNotFound();
                }
                if (System.IO.File.Exists(Server.MapPath(product_Photos.photo)))
                {
                    System.IO.File.Delete(Server.MapPath(product_Photos.photo));
                }



                db.Product_Photo.Remove(product_Photos);
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
