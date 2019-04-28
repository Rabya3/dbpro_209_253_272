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
    public class PersonController : Controller
    {
        public ActionResult RegisterPerson()
        {
            return View();
        }


        string Constr = "Data Source=MAXIMUS\\SQLEXPRESS;Initial Catalog=DB25;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";
        [HttpPost]
        public ActionResult RegisterPerson(PersonViewModel model)
        {
            SqlConnection connection = new SqlConnection(Constr);
            connection.Open();

            if (ModelState.IsValid)
            {
                string cmd2 = string.Format("INSERT INTO Person(FirstName,LastName,Email,Password,Contact,SQuestion,Answer) VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}')", model.FirstName, model.LastName, model.Email, model.Password, model.Contact, model.SQuestion, model.Answer);

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
    }
}
