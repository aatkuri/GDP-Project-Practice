using OfficeHoursBussinessLogic;
using System;

namespace WriteCalEvent.Views
{
    public partial class StudentViewSchedule : System.Web.UI.Page
    {
        FacultyScheduleBLL facultySchedule = new FacultyScheduleBLL();
        StudentMessageBLL studentMessage = new StudentMessageBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] == null || (bool)Session["IsLoggedIn"] != true)
                Response.Redirect("~/OfficeHoursHome.aspx");
            if (!IsPostBack)
                BindScheduleGridView();
        }

        private void BindScheduleGridView()
        {
            DayOfWeek day = DateTime.Now.DayOfWeek;
            int days = day - DayOfWeek.Monday;
            DateTime start = DateTime.Now.AddDays(-days);
            DateTime end = start.AddDays(4);

            gridScheduleEvent.DataSource = facultySchedule.BuildScheduleDataTablePrototype(facultySchedule.GetFacultyScheduleByMailandDate(
                                        Session["Email"].ToString(), start, end));
            gridScheduleEvent.DataBind();
        }

        protected void btnPullEvents_Click(object sender, EventArgs e)
        {
            gridScheduleEvent.DataSource = facultySchedule.BuildDTFromGoogleCalendar();
            gridScheduleEvent.DataBind();
        }
    }
}