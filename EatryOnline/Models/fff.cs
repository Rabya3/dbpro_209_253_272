using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace EatryOnline.Models
{
    public class fff
    {

        public string FoodName { get; set; }

        public string Price { get; set; }



        public string IsSpecial { get; set; }
        public string imagepath { get; set; }


        public HttpPostedFileBase ImageFile { get; set; }
    
}
}