//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace E_Commerce.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order_Status
    {
        public int orderStatus_id { get; set; }
        public int status { get; set; }
        public int order_id { get; set; }
    
        public virtual Order Order { get; set; }
    }
}
