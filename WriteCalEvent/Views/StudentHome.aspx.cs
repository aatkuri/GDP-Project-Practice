using OfficeHoursBussinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WriteCalEvent.Views
{
    public partial class StudentHome : System.Web.UI.Page
    {
        FacultyBLL facultyBLL = new FacultyBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadFacultyGridView();
        }

        private void LoadFacultyGridView()
        {
            facultyGrid.DataSource = facultyBLL.GetAllFaculties();
            facultyGrid.DataBind();
        }

        protected void facultyGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["UserAccount"] = facultyBLL.GetFacultyByMail(facultyGrid.SelectedRow.Cells[1].Text);
            Session["IsLoggedIn"] = true;
            Session["Role"] = "Student";
            Session["Email"] = facultyGrid.SelectedRow.Cells[1].Text;
            Session["FullName"] = facultyGrid.SelectedRow.Cells[2].Text + " " + facultyGrid.SelectedRow.Cells[3].Text;
            Response.Redirect("~/Views/StudentViewSchedule.aspx", true);
        }
    }
}