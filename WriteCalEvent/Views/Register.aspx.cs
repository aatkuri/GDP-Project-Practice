using OfficeHoursBussinessLogic;
using OfficeHoursEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WriteCalEvent.Views
{
    public partial class Registration : System.Web.UI.Page
    {
        FacultyBLL facultyBLL = new FacultyBLL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            var faculty = new FacultyDTO();
            faculty.Email = txtEmail.Text;
            faculty.Password = txtPassword.Text;
            faculty.phoneNumber = txtPhoneNumber.Text;
            faculty.firstName = txtFirstName.Text;
            faculty.lastName = txtLastName.Text;
            var email = facultyBLL.CreateFaculty(faculty);            
            if (email != null && email == txtEmail.Text)
            {
                var userDetails = facultyBLL.GetFacultyByMail(email);
                Session["UserAccount"] = userDetails[0];
                Session["IsLoggedIn"] = true;
                Session["Role"] = "Faculty";
                Session["Email"] = userDetails[0].Email;
                Session["FullName"] = userDetails[0].firstName + " " + userDetails[0].lastName;
                Response.Redirect("~/Views/FacultyHome.aspx", true);
            }
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/OfficeHoursHome.aspx");
        }
    }
}