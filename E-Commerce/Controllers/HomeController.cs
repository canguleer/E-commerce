using E_Commerce.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Commerce.Controllers
{
    public class HomeController : Controller
    {
        Entities1 db = new Entities1();
        public ActionResult Index()
        {
            var products = db.Product.OrderByDescending(p => p.product_id).Take(6);
            return View(products);
        }

        public ActionResult HomeListProduct(int? page)
        {
            var model = db.Product.ToList().ToPagedList(page ?? 1, 3);
            return View(model);

        }

        public ActionResult ProductDetail(int id)
        {

            var product = db.Product.Where(p => p.product_id == id).SingleOrDefault();
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);

        }

        public ActionResult ProductSearch(string search = null)
        {

            var aranan = db.Product.Where(w => w.productName.Contains(search)).ToList();

            return View(aranan.OrderByDescending(w => w.product_id));
        }

        public ActionResult ProductViewedAdding(int Productid)
        {
            if (Request.IsAuthenticated)
            {
                var product = db.Product.Where(w => w.product_id == Productid).SingleOrDefault();             
                product.productViewed += 1;
                db.SaveChanges();
            }

            return View();

        }




        public ActionResult Products()
        {
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }

        public ActionResult ProductCart()
        {
            return View();
        }

        public ActionResult CategoryPartial()
        {
            return View(db.Category.ToList());
        }


        public ActionResult BrandPartial()
        {
            return View(db.Brand.ToList());
        }
        public ActionResult MostViewProductPartial()
        {
            return View(db.Product.ToList());
        }










    }
}