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
    
    public partial class PurchasedItem
    {
        public int OrderId { get; set; }
        public int FoodId { get; set; }
        public int CustomerId { get; set; }
        public int BillingId { get; set; }
        public System.DateTime Date { get; set; }
        public string TotalAmount { get; set; }
    
        public virtual Billing Billing { get; set; }
        public virtual FoodItem FoodItem { get; set; }
        public virtual Order Order { get; set; }
    }
}
