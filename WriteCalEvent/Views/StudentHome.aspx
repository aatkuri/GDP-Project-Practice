<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="StudentHome.aspx.cs" Inherits="WriteCalEvent.Views.StudentHome" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <div class="container" style="max-width: 80% !important; min-width: 750px !important;">
        <div id="AudiencePanel" runat="server">
            <div runat="server" id="messageDiv">
                <asp:GridView ID="facultyGrid" runat="server" CssClass="table table-hover" AutoGenerateColumns="false" AutoGenerateSelectButton="True" 
                    OnSelectedIndexChanged="facultyGrid_SelectedIndexChanged">
                    <Columns>                        
                        <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="day" />
                        <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="date" />
                        <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="time" />                        
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
