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
    
    public partial class HomeDelivery
    {
        public int Id { get; set; }
        public string Address { get; set; }
        public string Contact { get; set; }
        public int CustomerId { get; set; }
        public int OrderId { get; set; }
        public Nullable<System.TimeSpan> DispatchedTime { get; set; }
    }
}
