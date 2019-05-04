using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EatryOnline;
using System.Data.SqlClient;
using EatryOnline.Models;
using System.Data.Entity.Infrastructure;
using System.Net;
using System.Web.Security;

namespace EatryOnline.Controllers
{
    public class CustomersController : Controller
    {
        private DB25dd db = new DB25dd();

        public ActionResult CreateCustomer()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateCustomer(CustomerViewModel model)
        {
            if (ModelState.IsValid)
            {
                if (!db.Customers.Any(x => x.Email == model.Email))
                {
                    Customer cust = new Customer();
                    cust.Email = model.Email;
                    cust.Password = model.Password;
                    cust.FirstName = model.FirstName;
                    cust.LastName = model.LastName;
                    cust.Address = model.Address;
                    cust.Contact = model.Contact;
                    cust.SQuestion = model.SQuestion;
                    cust.SAnswer = model.Address;
                    db.Customers.Add(cust);
                    db.SaveChanges();

                    TempData["Message"] = "Registered Sucessfully";
                    ModelState.Clear();
                    return View(model);
                }

                else
                {
                    
                    TempData["Message"] = "Email, already exists!";
                    ModelState.Clear();
                    return View(model);
                }
            }
            model.Email = "";
            model.FirstName = "";
            model.LastName = "";
            model.Password = "";
            model.Contact = "";
            model.Address = "";
            model.SQuestion = "";
            model.SAnswer = "";
            return View(model);

        }

        public ActionResult Login()
        {
            return View();
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(AdminViewModel user)
        {
            if (ModelState.IsValid)
            {
                using (db)
                {
                    var obj = db.Customers.Where(a => a.Email.Equals(user.Email) && a.Password.Equals(user.Password)).FirstOrDefault();
                    if (obj != null)
                    {
                        Session["UserName"] = obj.FirstName;
                        TempData["Message"] = "Signing In";
                        return RedirectToAction("View");

                        
                    }
                    else
                    {
                        TempData["Message"] = "Incorrect Email or Password";
                    }
                }
            }
            
            ModelState.Clear();
            user.Email = "";
            user.Password = "";
            return View(user);
        }

       
          public ActionResult LogOut()
        {
            FormsAuthentication.SignOut();
            Session["Username"] = null;
            Session.Abandon();
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }
    

        public ActionResult Exp()
        {
            if(Session["Username"]!=null)
            {
                
                    return View("WTF bro");
               

            }
            else
            {
                return View("YAaaaaaaaaar wtfffffffffffffff");
            }
            
        }


        public ActionResult Index()
        {
            return View(db.Customers.ToList());
        }

        // GET: Customers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

      

        // GET: Customers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        // POST: Customers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Email,Password,FirstName,LastName,Address,Contact,SQuestion,SAnswer")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(customer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(customer);
        }

        // GET: Customers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        // POST: Customers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Customer customer = db.Customers.Find(id);
            db.Customers.Remove(customer);
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
        public ActionResult View(CustomerPort p)
        {
            return View();
        }
    }
}
