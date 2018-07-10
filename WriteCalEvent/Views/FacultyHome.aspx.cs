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
    public partial class FacultyHome : System.Web.UI.Page
    {
        FacultyScheduleBLL facultySchedule = new FacultyScheduleBLL();
        StudentMessageBLL studentMessage = new StudentMessageBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] == null || (bool)Session["IsLoggedIn"] != true)
                Response.Redirect("~/OfficeHoursHome.aspx");
        }

        private void BindScheduleGridView()
        {
            DayOfWeek day = DateTime.Now.DayOfWeek;
            int days = day - DayOfWeek.Monday;
            DateTime start = DateTime.Now.AddDays(-days);
            DateTime end = start.AddDays(4);

            gridScheduleEvent.DataSource = facultySchedule.BuildScheduleDataTablePrototype(facultySchedule.GetFacultyScheduleByMailandDate(
                                        Session["Email"].ToString(),start,end));
            gridScheduleEvent.DataBind();
        }

        protected void addScheule_Click(object sender, EventArgs e)
        {
            var sTime = Convert.ToDateTime(starttimepickerTB.Text);
            string startTime = sTime.ToString("HH:mm:ss", CultureInfo.CurrentCulture);
            var eTime = Convert.ToDateTime(endTimepickerTB.Text);
            string endTime = eTime.ToString("HH:mm:ss", CultureInfo.CurrentCulture);
            DateTime startDateTime = Convert.ToDateTime(startdatepickerTB.Text + " " + startTime);
            DateTime endDateTime = Convert.ToDateTime(startdatepickerTB.Text + " " + endTime);

            FacultyScheduleDTO scheduleDTO = new FacultyScheduleDTO();
            scheduleDTO.facultyEmail = Session["Email"].ToString();
            scheduleDTO.scheduleStart = startDateTime;
            scheduleDTO.scheduleEnd = endDateTime;
            facultySchedule.CreateFacultySchedule(scheduleDTO);
            btnAddScheule.Text = "Add Again";
            BindScheduleGridView();
        }

        protected void btnPullEvents_Click(object sender, EventArgs e)
        {
            gridScheduleEvent.DataSource = facultySchedule.BuildDTFromGoogleCalendar();
            gridScheduleEvent.DataBind();
        }
    }
}