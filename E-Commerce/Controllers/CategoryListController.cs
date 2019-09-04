using E_Commerce.Models;
using HomeBi.Libraries.PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Commerce.Controllers
{
    public class CategoryListController : Controller
    {
        Entities1 db = new Entities1();
        // GET: CategoryList
        public ActionResult Index(int id)
        {
            var product = db.Product.Where(k => k.Category.categori_id == id).ToList();
            return View(product);
        }
    }
}