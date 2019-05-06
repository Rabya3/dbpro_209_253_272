using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using EatryOnline.Models;
using System.Data.Entity.Infrastructure;
using System.Net;
using System.IO;

namespace EatryOnline.Controllers
{
    public class OrderController : Controller
    {

        [HttpGet]
        public ActionResult ShowProducts()
        {
            DB25dd Gro = new DB25dd();
            List<FoodItem> data = Gro.FoodItems.ToList();
            return View(data);
        }

        DB25dd dd = new DB25dd();
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

        [HttpPost]
        public ActionResult AddOrder(int C,int F)
        {
            Ordering i = new Ordering();
            i.CustId = C;
            i.FooId = F;
        
            Orderlist.Od.Add(i);
            ViewBag.Od = Orderlist.Od;
            return View();
        }

    }
}