using OfficeHoursBussinessLogic;
using OfficeHoursEntities;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WriteCalEvent.Views
{
    public partial class FacultyViewMessage : System.Web.UI.Page
    {
        FacultyScheduleBLL facultySchedule = new FacultyScheduleBLL();
        StudentMessageBLL studentMessage = new StudentMessageBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] == null || (bool)Session["IsLoggedIn"] != true)
                Response.Redirect("~/OfficeHoursHome.aspx");

            if(!IsPostBack)
{
                LoadMessageGV();

            }
            
        }

        private void LoadMessageGV()
        {
            messagesGridView.DataSource = studentMessage.BuildMessageDataTable(studentMessage.GetStudentMessagesByFaculty(
                                        Session["Email"].ToString()));
            messagesGridView.DataBind();
        }

        protected void deleteAttendeeButton_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton button = sender as ImageButton;
            GridViewRow row = (GridViewRow)button.NamingContainer;
            var list = studentMessage.DeleteMessageById(Convert.ToInt32(button.CommandArgument));
            LoadMessageGV();
        }

        protected void viewAttendeeButton_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton button = sender as ImageButton;
            lblMessageBody.Text = studentMessage.GetStudentMessagesById(Convert.ToInt32(button.CommandArgument))[0].message;
            popup.Show();
        }
    }
}