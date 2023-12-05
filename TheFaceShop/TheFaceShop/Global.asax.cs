using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Http;
using System.Security.Principal;

namespace TheFaceShop
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
        }
        protected void Application_AuthenticateRequest(Object sender, EventArgs e)
        {
            var cookie = Context.Request.Cookies[FormsAuthentication.FormsCookieName];
            var ck = Context.Request.Url.ToString();
            if (cookie != null)
            {
                if (cookie.Value == "")
                {
                    return;
                }
                var ticket = FormsAuthentication.Decrypt(cookie.Value);
                var roles = ticket.UserData.Split(',');
                Context.User = new System.Security.Principal.GenericPrincipal(new GenericIdentity(ticket.Name), roles);
                //if unauthorized redirect to unauthorized page
                //check if user is unauthorized for the requested page
                if(!User.Identity.IsAuthenticated)
                {
                    if (ck.Contains("/Admin/"))
                    {
                        if (User.IsInRole("QuanTri"))
                        {
                            Context.Response.Redirect("/Admin/Account/DangNhap");
                        }
                    }
                    else
                    {
                        Context.Response.Redirect("/Home/Index");
                    }
                }
            }    
        }
    }
}