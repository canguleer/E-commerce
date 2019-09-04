using System;
using System.Threading.Tasks;
using Microsoft.Owin;
using Owin;

using Microsoft.Owin.Security.Cookies;
[assembly: OwinStartup(typeof(E_Commerce.App_Start.Startup1))]

namespace E_Commerce.App_Start
{
    public class Startup1
    {
        public void Configuration(IAppBuilder app)
        {
            app.UseCookieAuthentication(new CookieAuthenticationOptions()
            {
                AuthenticationType="ApplicationCookie",
                LoginPath=new PathString("/Account/Login")
            });
          
        }
    }
}
