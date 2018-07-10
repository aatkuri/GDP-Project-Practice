using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WriteCalEvent
{
    public partial class OfficeHoursHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] != null && Session["IsLoggedIn"].ToString() == "True" && Session["FullName"] != null)
            {
                var role = Session["Role"].ToString();
                if (Session["Role"] != null && Session["Role"].ToString() == "Student")
                {
                    Master.DivStudentBar.Visible = true;
                }
                if (Session["Role"] != null && (Session["Role"].ToString() == "Faculty"))
                {
                    Master.DivPostLoginNav.Visible = true;
                    Master.LinkWelcomeItem.InnerText = "Welcome " + Session["FullName"].ToString();
                }
            }
            else
            {
                Master.DivPreLoginNav.Visible = true;
            }
        }

        protected void studentView_Click(object sender, ImageClickEventArgs e)
        {           
            Master.DivStudentBar.Visible = true;
            Master.DivPostLoginNav.Visible = false;
            Master.DivPreLoginNav.Visible = false;
            Session["Role"] = "Student";
            Response.Redirect("~/Views/StudentHome.aspx");
        }

        protected void facultyView_Click(object sender, ImageClickEventArgs e)
        {           
            Master.DivStudentBar.Visible = false;
            Master.DivPostLoginNav.Visible = true;
            Master.DivPreLoginNav.Visible = true;
            Session["Role"] = "Faculty";
            Response.Redirect("~/Views/Login.aspx");
        }
    }
}