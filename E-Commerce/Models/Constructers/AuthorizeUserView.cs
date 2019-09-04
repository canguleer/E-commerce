using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Commerce.Models.Constructers
{
    public class AuthorizeUserView
    {
        public int userid { get; set; }
        public string name { get; set; }
        public string surname { get; set; }
        public string phone { get; set; }
        public string email { get; set; }
        public string address { get; set; }     
        public string role { get; set; }
    }
}