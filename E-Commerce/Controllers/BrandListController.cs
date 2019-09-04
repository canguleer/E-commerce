using E_Commerce.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Commerce.Controllers
{
  
    public class BrandListController : Controller
    {
        Entities1 db = new Entities1();
        // GET: BrandList
        public ActionResult Index(int id)
        {
            var products = db.Product.Where(w => w.Brand.brand_id == id).ToList();
            return View(products);
        }
    }
}