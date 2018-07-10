<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="StudentViewSchedule.aspx.cs" Inherits="WriteCalEvent.Views.StudentViewSchedule" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <div class="container" style="max-width: 80% !important; min-width: 750px !important;">
        <div id="AudiencePanel" runat="server">
            <div runat="server" id="messageDiv">
                <asp:GridView ID="gridScheduleEvent" CssClass="table table-hover" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="day" HeaderText="Day" ReadOnly="True" SortExpression="day" />
                        <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                        <asp:BoundField DataField="time" HeaderText="Time" SortExpression="time" />
                    </Columns>
                </asp:GridView>
            </div>
            <div class="form-group col-md-3 col-sm-5">
                <asp:Button ID="btnPullEvents" OnClick="btnPullEvents_Click" Text="Get from Google" runat="server" CssClass="btn btn-success" CausesValidation="false" />
            </div>
        </div>
    </div>
</asp:Content>
