using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WriteCalEvent
{
    public partial class SiteMaster : MasterPage
    {
        public PlaceHolder DivPostLoginNav
        {
            get { return PostLoginNav; }
            set { PostLoginNav = value; }
        }

        public PlaceHolder DivPreLoginNav
        {
            get { return PreLoginNav; }
            set { PreLoginNav = value; }
        }

        public HtmlAnchor LinkWelcomeItem
        {
            get { return welcomeItem; }
            set { welcomeItem = value; }
        }

        public HtmlAnchor LinkStudAppointment
        {
            get { return StudAppointment; }
            set { StudAppointment = value; }
        }

        public PlaceHolder DivStudentBar
        {
            get { return studentPostLogin; }
            set { studentPostLogin = value; }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] != null && Session["IsLoggedIn"].ToString() == "True" && Session["FullName"] != null)
            {   
                var role = Session["Role"].ToString();
                if (Session["Role"] != null && Session["Role"].ToString() == "Student")
                {
                    studentPostLogin.Visible = true;
                }
                if (Session["Role"] != null && (Session["Role"].ToString() == "Faculty"))
                {
                    PostLoginNav.Visible = true;
                    welcomeItem.InnerText = "Welcome " + Session["FullName"].ToString();
                }                
            }
            else
            {
                PreLoginNav.Visible = true;
            }
        }
    }
}