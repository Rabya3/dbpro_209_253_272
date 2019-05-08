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


    }
}