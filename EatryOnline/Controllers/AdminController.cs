using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using EatryOnline.Models;
using System.Data.Entity.Infrastructure;
using System.Net;

namespace EatryOnline.Controllers
{
    public class AdminController : Controller
    {
        public ActionResult AdminLogin(AdminViewModel objadmin)
        {
            if (ModelState.IsValid)
            {
                using (DB25 db = new DB25())
                {
                    var obj = db.Admins.Where(a => a.Email.Equals(objadmin.Email) && a.Password.Equals(objadmin.Password)).FirstOrDefault();
                    if (obj != null)
                    {

                        return View("Index", "Home");
                    }

                }
                ModelState.Clear();
            }
            return View(objadmin);
        }



        public ActionResult AddCategory()
        {
            return View();
        }


        string Constr = "Data Source=MAXIMUS\\SQLEXPRESS;Initial Catalog=DB25;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";
        [HttpPost]
        public ActionResult AddCategory(CategoryViewModel model)
        {
            SqlConnection connection = new SqlConnection(Constr);
            connection.Open();

            if (ModelState.IsValid)
            {
                string cmd2 = string.Format("INSERT INTO Category(Name,Description) VALUES('{0}','{1}')", model.Name, model.Description);

                SqlCommand cmd = new SqlCommand(cmd2, connection);
                cmd.ExecuteNonQuery();
                connection.Close();
                ModelState.Clear();
                return RedirectToAction("yayyyy", "Admin");


            }
            else
            {
                ModelState.Clear();

                return View(model);

            }
        }

        //[HttpPost]
        //public ActionResult DisplayCategory()
        //{
        //    DB25 db = new DB25();
        //    return View(db.Categories.ToList());

        //}


        public ActionResult AllCategories()
        {
            DB25 db = new DB25();
            return View(db.Categories.ToList());
        }

        DB25 dd = new DB25();

        //public ActionResult DeleteCategory(int id)
        //{
        //    SqlConnection connection = new SqlConnection(Constr);
        //    connection.Open();

        //    string cmd2 = string.Format("DELETE FROM Category WHERE CategoryId=id");

        //        SqlCommand cmd = new SqlCommand(cmd2, connection);
        //        cmd.ExecuteNonQuery();
        //        connection.Close();
                
        //    return View();
        //}

        //public ActionResult Details(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Category movie = dd.Categories.Find(id);
        //    if (movie == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(movie);
        //}

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category cat = dd.Categories.Find(id);
            if (cat == null)
            {
                return HttpNotFound();
            }
            return View(cat);
        }


        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category cat = dd.Categories.Find(id);
            if (cat == null)
            {
                return HttpNotFound();
            }
           
            return View(cat);
        }

        [HttpPost, ActionName("Edit")]
        [ValidateAntiForgeryToken]
        public ActionResult EditPost(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var ToUpdate = dd.Categories.Find(id);
            if (TryUpdateModel(ToUpdate, "",
               new string[] { "Description" }))
            {
                try
                {
                    dd.SaveChanges();

                    return View();
                }
                catch (RetryLimitExceededException /* dex */)
                {
                    //Log the error (uncomment dex variable name and add a line here to write a log.
                    ModelState.AddModelError("", "Unable to save changes. Try again, and if the problem persists, see your system administrator.");
                }
            }
           
            return View(ToUpdate);
        }

        // POST: /Movies/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
           Category cat = dd.Categories.Find(id);
            dd.Categories.Remove(cat);
            dd.SaveChanges();
            return RedirectToAction("AllCategories");
        }

        public ActionResult AddFoodItem(int? id, FoodViewModel food)
        {
            SqlConnection connection = new SqlConnection(Constr);
            connection.Open();
            Category cat = dd.Categories.Find(id);
            if (id != null)
            {

                if (ModelState.IsValid)
                {
                    string cmd2 = string.Format("INSERT INTO FoodItem(Name,CategoryId,Price) VALUES('{0}','{1}','{2}')", food.Name,id, food.Price);

                    SqlCommand cmd = new SqlCommand(cmd2, connection);
                    cmd.ExecuteNonQuery();
                    connection.Close();
                    ModelState.Clear();

                }
              
            }
            return View(food);
        }


    }
}
