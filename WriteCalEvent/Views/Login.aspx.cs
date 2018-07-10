using OfficeHoursBussinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WriteCalEvent.Views
{
    public partial class Login : System.Web.UI.Page
    {
        FacultyBLL facultyBLL = new FacultyBLL(); 

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserAccount"] = null;
            Session["IsLoggedIn"] = null;
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            String username = Username.Text;
            String password = Password.Text;
            if (String.IsNullOrEmpty(username) || String.IsNullOrEmpty(password))
            {
                ErrorLabel.Text = "Username and password fields cannot be empty";
            }
            else
            {
                var userDetails = facultyBLL.isAuthunticated(username, password);
                if (userDetails != null)
                {
                    Session["UserAccount"] = userDetails;
                    Session["IsLoggedIn"] = true;
                    Session["Role"] = "Faculty";
                    Session["Email"] = userDetails.Email;
                    Session["FullName"] = userDetails.firstName + " " + userDetails.lastName;
                    Response.Redirect("~/Views/FacultyHome.aspx", true);
                }
                else
                {
                    ErrorLabel.Text = "Invalid Credentials";
                }
            }
        }
    }
}