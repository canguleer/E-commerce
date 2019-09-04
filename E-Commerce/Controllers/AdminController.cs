using E_Commerce.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Commerce.Controllers
{
    [Authorize]
    public class AdminController : Controller
    {

   
        private Entities1 db = new Entities1();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
    }
}