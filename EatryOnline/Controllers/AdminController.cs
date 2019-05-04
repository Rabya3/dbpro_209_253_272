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
    public class AdminController : Controller
    {
        public ActionResult AdminLogin(AdminViewModel objadmin)
        {
            if (ModelState.IsValid)
            {
                using (DB25dd db = new DB25dd())
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
                string cmd2 = string.Format("INSERT INTO Category(Name) VALUES('{0}')", model.Name);

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

     

        public ActionResult AllCategories()
        {
          DB25dd db = new DB25dd();
            return View(db.Categories.ToList());
        }


        

        DB25dd dd = new DB25dd();


        public ActionResult AllFood()
        {
            DB25dd db = new DB25dd();
            return View(db.FoodItems.ToList());
        }

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
               new string[] { "Name" }))
            {
                try
                {
                    dd.SaveChanges();

                    return View();
                }
                catch (RetryLimitExceededException /* dex */)
                {
                    
                    ModelState.AddModelError("", "Unable to save changes. Try again, and if the problem persists, see your system administrator.");
                }
            }
           
            return View(ToUpdate);
        }

       
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
           Category cat = dd.Categories.Find(id);
            dd.Categories.Remove(cat);
            dd.SaveChanges();
            return RedirectToAction("AllCategories");
        }

       



        [HttpGet]
        public ActionResult AddFoodItem()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddFoodItem(int? id, FoodItem f)
        {

            FoodItem cat = dd.FoodItems.Find(id);
            if (id != null)
            {

                string filename = Path.GetFileNameWithoutExtension(f.ImageFile.FileName);
                string extension = Path.GetExtension(f.ImageFile.FileName);
                filename = filename + DateTime.Now.ToString("yymmssfff") + extension;
                f.imagepath = "~/Content/images/Uploads" + filename;
                filename = Path.Combine(Server.MapPath("~/Content/images//Uploads"), filename);
                f.ImageFile.SaveAs(filename);
                SqlConnection connection = new SqlConnection(Constr);
                connection.Open();
             
                    if (ModelState.IsValid)
                    {
                        string cmd2 = string.Format("INSERT INTO FoodItem(FoodName,CategoryId,Price, IsSpecial,imagepath) VALUES('{0}','{1}','{2}','{3}','{4}')", f.FoodName, id, f.Price, f.IsSpecial, f.imagepath);

                        SqlCommand cmd = new SqlCommand(cmd2, connection);
                        cmd.ExecuteNonQuery();
                        connection.Close();
                        ModelState.Clear();
                    TempData["Message"] = "New Food Item Added";

                    }

            }
            return View(f);
        }

        public ActionResult FoodDetails(int id)
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
