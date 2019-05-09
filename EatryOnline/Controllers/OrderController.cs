using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using EatryOnline.Models;
using System.Data.Entity.Infrastructure;

using System.IO;
using System.Net;
using System.Web.Security;

using CrystalDecisions.CrystalReports.Engine;
using System.Data.Entity.Validation;

namespace EatryOnline.Controllers
{
    public class OrderController : Controller
    {

        [HttpGet]
        public ActionResult ShowProducts()
        {
            DB25E Gro = new DB25E();
            List<FoodItem> data = Gro.FoodItems.ToList();
            return View(data);
        }

        DB25E dd = new DB25E();
        public ActionResult FoodDetails(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FoodItem food = dd.FoodItems.Find(id);
            if (food == null)
            {
                return HttpNotFound();
            }
            return View(food);
        }

        public ActionResult cart()
        {
            
            ViewBag.c = Ok.c;
            return View();
        }


        [HttpPost]
        public ActionResult cart(string pid, string pqty)
        {
            foreach(var item in Ok.c)
            {
                if(item.iid== int.Parse(pid))
                {
                    item.iqty += int.Parse(pqty);
                    ViewBag.c = Ok.c;
                    return View();
                }
               
            }
            cartitem i = new cartitem() { iid = int.Parse( pid), iqty = int.Parse( pqty) };
            Ok.c.Add(i);
            ViewBag.c = Ok.c;
            
       

            return View();
        }

        [HttpPost]
        public ActionResult HomeDel(HomeDelivery home)
        {
            try
            {
               HomeDelivery  ff = new HomeDelivery();
                ff.Address = home.Address;
                ff.CustomerId = Convert.ToInt32(Session["UserId"]);
                ff.Contact = home.Contact;
                dd.HomeDeliveries.Add(ff);
                dd.SaveChanges();
                TempData["Message"] = "Dear Customer, Ride will be at your place shortly";
               
                return View();
            }
            catch (DbEntityValidationException ex)
            {
                foreach (var entityValidationErrors in ex.EntityValidationErrors)
                {
                    foreach (var validationError in entityValidationErrors.ValidationErrors)
                    {
                        Response.Write("Property: " + validationError.PropertyName + " Error: " + validationError.ErrorMessage);
                    }
                }
            }
            return View();

        }





        public ActionResult FoodItem(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FoodItem food = dd.FoodItems.Find(id);
            if (food == null)
            {
                return HttpNotFound();
            }
            return View(food);
        }

        public ActionResult View(CustomerPort p)
        {
            return View();
        }

        public ActionResult DoneOrder(string fid,string qty)
        {
            try
            {
                Order oo = new Order();
                oo.customerId = Convert.ToInt32(Session["UserId"]);
                oo.foodId = int.Parse(fid);
                oo.orderDate = DateTime.Now;
                oo.quantity = int.Parse(qty);
                dd.Orders.Add(oo);
                dd.SaveChanges();
                TempData["Message"] = "yyyyyyyy";
             
                return View();
            }
            catch (DbEntityValidationException ex)
            {
                foreach (var entityValidationErrors in ex.EntityValidationErrors)
                {
                    foreach (var validationError in entityValidationErrors.ValidationErrors)
                    {
                        Response.Write("Property: " + validationError.PropertyName + " Error: " + validationError.ErrorMessage);
                    }
                }
            }
            return View();

        }
    }
    }
