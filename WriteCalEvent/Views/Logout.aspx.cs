using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WriteCalEvent.Views
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserAccount"] = null;
            Session["IsLoggedIn"] = null;
            Session["Role"] = null;
            Session["Email"] = null;
            Session["FullName"] = null;
            Response.Redirect("~/OfficeHoursHome.aspx", true);
        }
    }
}