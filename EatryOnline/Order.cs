//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EatryOnline
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order
    {
        public int Id { get; set; }
        public System.DateTime orderDate { get; set; }
        public int customerId { get; set; }
        public int foodId { get; set; }
        public int quantity { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual FoodItem FoodItem { get; set; }
    }
}
