using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EatryOnline.Models
{
    public class Orderlist

    {
        public static List<Ordering> Od = new List<Ordering>();
    }
    public class Ordering
    {
        public int CustId  { get; set; }
    public int FooId { get; set; }
        public DateTime Datee { get; set; }
     
    }
}