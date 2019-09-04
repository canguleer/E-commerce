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
    [Authorize(Roles ="Admin")]
    public class User_RolesController : Controller
    {
        private Entities1 db = new Entities1();

        // GET: User_Roles
        public ActionResult Index()
        {
            var user_Roles = db.User_Roles.Include(u => u.Role).Include(u => u.User);
            return View(user_Roles.ToList());
        }


        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User_Roles user_Roles = db.User_Roles.Find(id);
            if (user_Roles == null)
            {
                return HttpNotFound();
            }
            return View(user_Roles);
        }

        // GET: User_Roles/Create
        public ActionResult Create()
        {
            ViewBag.role_id = new SelectList(db.Role, "role_id", "role1");
            ViewBag.user_id = new SelectList(db.User, "user_id", "userName");
            return View();
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,user_id,role_id")] User_Roles user_Roles)
        {
            if (ModelState.IsValid)
            {
                db.User_Roles.Add(user_Roles);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.role_id = new SelectList(db.Role, "role_id", "role1", user_Roles.role_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "userName", user_Roles.user_id);
            return View(user_Roles);
        }

        // GET: User_Roles/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User_Roles user_Roles = db.User_Roles.Find(id);
            if (user_Roles == null)
            {
                return HttpNotFound();
            }
            ViewBag.role_id = new SelectList(db.Role, "role_id", "role1", user_Roles.role_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "userName", user_Roles.user_id);
            return View(user_Roles);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,user_id,role_id")] User_Roles user_Roles)
        {
            if (ModelState.IsValid)
            {
                db.Entry(user_Roles).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.role_id = new SelectList(db.Role, "role_id", "role1", user_Roles.role_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "userName", user_Roles.user_id);
            return View(user_Roles);
        }

        // GET: User_Roles/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User_Roles user_Roles = db.User_Roles.Find(id);
            if (user_Roles == null)
            {
                return HttpNotFound();
            }
            return View(user_Roles);
        }

        // POST: User_Roles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            User_Roles user_Roles = db.User_Roles.Find(id);
            db.User_Roles.Remove(user_Roles);
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
