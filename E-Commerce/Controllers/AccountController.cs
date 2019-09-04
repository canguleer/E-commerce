using E_Commerce.Models;
using E_Commerce.Models.Constructers;
using E_Commerce.Models.Methods;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Mvc;

namespace E_Commerce.Controllers
{
    public class AccountController : Controller
    {
        private Entities1 db = new Entities1();
        // GET: Account

        public ActionResult Login()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginViewModel model)
        {

            Result result = new Result();
            var kontrol = db.User.Where(w => w.email == model.Email && w.password == model.Password).FirstOrDefault();
            if (kontrol != null)
            {
                int userid = kontrol.user_id;
                List<Claim> claims = new Authorizing(db).GetClaims(kontrol);
                if (null != claims)
                {
                    new Authorizing(db).SignIn(claims);
                    var identity = (ClaimsIdentity)User.Identity;
                    List<string> rol = identity.Claims.Where(c => c.Type == ClaimTypes.Role).Select(c => c.Value).ToList();
                    if (rol.Contains("Admin"))
                    {
                        result.adres = "../Categories/Index";
                    }
                    else
                    {
                        result.adres = "../Home/Index";
                    }
                }
                result.sonuc = true;

            }

            else
            {
                result.sonuc = false;
                result.mesaj = "Hatalı kullanıcı adı ve/vaya şifre";
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [AllowAnonymous]
        public ActionResult LogOff()
        {
            AuthenticationManager.SignOut();
            return RedirectToAction("Index", "Home");
        }
        public IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }



        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(User detail)
        {
            string sonuc = "olumlu";
            try
            {

                User cst = db.User.Where(w => (w.name == detail.name && w.surName == detail.surName) || w.email == detail.email).FirstOrDefault();
                if (cst == null)
                {
                    cst = new User()
                    {
                        name = detail.name,
                        surName = detail.surName,
                        phone = detail.phone,
                        email = detail.email,
                        userName = detail.userName,
                        password = detail.password,
                        rePassword = detail.rePassword
                    };

                    cst.User_Roles.Add(new User_Roles { role_id = 5 }); //Kullanıcı
                    db.User.Add(cst);
                    db.SaveChanges();
                }
                List<Claim> claims = new Authorizing(db).GetClaims(cst);
                if (null != claims)
                {
                    Session["hata"] = null;
                    new Authorizing(db).SignIn(claims);
                    sonuc = "olumlu";
                }
            }
            catch
            {               
                sonuc = "olumsuz";
            }
            return Json(sonuc, JsonRequestBehavior.AllowGet);



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