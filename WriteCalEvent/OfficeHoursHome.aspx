<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="OfficeHoursHome.aspx.cs" Inherits="WriteCalEvent.OfficeHoursHome" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <div class="container" style="max-width: 80% !important; min-width: 750px !important;">
        <div class="panel panel-primary" id="createEventsForm">
            <div class="panel-heading">
                <strong runat="server" id="panelHeader" class="h1">Select a View</strong>
            </div>
                <div class="row" style="padding-left: 15px">
                    <div class="form-group col-md-5 col-sm-5">
                        <asp:ImageButton ID="viewAttendeeButton" runat="server"
                                    ImageUrl="~/images/student.png" OnClick="studentView_Click" ToolTip="Go to Student View"
                                    CommandArgument='student' />
                    </div>
                    <div class="form-group col-md-5 col-sm-5 pull-right">
                       <asp:ImageButton ID="ImageButton1" runat="server"
                                    ImageUrl="~/images/faculty.png" OnClick="facultyView_Click" ToolTip="Go to Faculty View"
                                    CommandArgument='faculty' />
                    </div>                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>
