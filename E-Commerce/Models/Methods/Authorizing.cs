using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;


namespace E_Commerce.Models.Methods
{
    public class Authorizing
    {

        private Entities1 db = new Entities1();

        public Authorizing(Entities1 db)
        {
            this.db = db;
        }

        public List<Claim> GetClaims(User data)
        {
            var claims = new List<Claim>();
            claims.Add(new Claim(ClaimTypes.NameIdentifier, data.userName));
            claims.Add(new Claim(ClaimTypes.Sid, data.user_id.ToString()));
            List<string> roller = db.User_Roles.Where(e => e.user_id == data.user_id).Select(t => t.Role.role1).ToList();
            if (roller.Contains("Admin"))
            {
                claims.Add(new Claim(ClaimTypes.Name, data.name));
                claims.Add(new Claim(ClaimTypes.Surname, data.surName));

            }

            else
            {
                claims.Add(new Claim(ClaimTypes.Name, data.name));
                claims.Add(new Claim(ClaimTypes.Surname, data.surName));
                claims.Add(new Claim(ClaimTypes.MobilePhone, data.phone));
                claims.Add(new Claim(ClaimTypes.Email, data.email));               
            }
             foreach (var rol in roller)
            {
                claims.Add(new Claim(ClaimTypes.Role, rol));
            }

            return claims;
        }

        public void SignIn(List<Claim> claims)
        {
            var claimsIdentity = new ClaimsIdentity(claims,
            DefaultAuthenticationTypes.ApplicationCookie);
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ExternalCookie);
            AuthenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = false }, claimsIdentity);
            HttpContext.Current.User = new ClaimsPrincipal(AuthenticationManager.AuthenticationResponseGrant.Principal);
        }

        public IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.Current.GetOwinContext().Authentication;
            }
        }






    }

}
