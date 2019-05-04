using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EatryOnline.Models
{
    public class Image
    {
        public string imagepath { get; set; }


        public HttpPostedFileBase ImageFile { get; set; }
    }
}