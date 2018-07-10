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
    public partial class StudentAddMessage : System.Web.UI.Page
    {
        StudentMessageBLL studentMessage = new StudentMessageBLL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void createEvent_Click(object sender, EventArgs e)
        {
            StudentMessageDTO messageDTO = new StudentMessageDTO();
            messageDTO.facultyMail = Session["Email"].ToString();
            messageDTO.studentId = txtStudId.Text;
            messageDTO.studentName = txtStudName.Text;
            messageDTO.message = txtAppointmentDescription.Text;
            studentMessage.CreateStudentMessage(messageDTO);
            Response.Redirect("~/Views/StudentHome.aspx");
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Write(Request.RawUrl.ToString());
        }
    }
}