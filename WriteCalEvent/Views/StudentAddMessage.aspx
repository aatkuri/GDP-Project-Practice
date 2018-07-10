<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="StudentAddMessage.aspx.cs" Inherits="WriteCalEvent.Views.StudentAddMessage" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="max-width: 80% !important; min-width: 750px !important;">
        <div class="panel panel-primary" id="createEventsForm">
            <div class="panel-heading">
                <strong runat="server" id="panelHeader" class="h1">Send Message</strong>
            </div>
            <div class="panel-body">
                <div class="row" style="padding-left: 15px">
                    <div class="form-group col-md-6">
                        <div id="nameFormGroup" class="form-group">
                            <asp:RequiredFieldValidator ID="eventNameValidator" runat="server"
                                ControlToValidate="txtStudId"
                                ErrorMessage="Event name is required." ForeColor="Red"> *
                            </asp:RequiredFieldValidator>
                            <label for="txtStudId">Student ID:</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtStudId" ClientIDMode="Static"></asp:TextBox>
                        </div>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="form-group col-md-6 pull-left">
                                <div id="locationFormGroup" class="form-group">
                                    <asp:RequiredFieldValidator ID="eventLocationValidator" runat="server"
                                        ControlToValidate="txtStudName"
                                        ErrorMessage="Location is required." ForeColor="Red"> *
                                    </asp:RequiredFieldValidator>
                                    <label for="txtStudName">Student Name:</label>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtStudName" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div class="row" style="padding-left: 15px">
                    <div class="form-group col-md-12">
                        <div id="descriptionFormGroup" class="form-group">
                            <label for="txtAppointmentDescription">Description:</label>
                            <asp:TextBox runat="server" CssClass="form-control description" ClientIDMode="Static" TextMode="MultiLine" ID="txtAppointmentDescription"></asp:TextBox>
                        </div>
                    </div>
                </div>              
                <div class="row-fluid">
                    <div class="col-md-12 btn-toolbar">
                        <asp:Button ID="cancel" Text="Cancel" runat="server" OnClick="cancel_Click" CssClass="btn btn-defualt pull-left" CausesValidation="false" />
                        <asp:Button ID="createEvent" OnClick="createEvent_Click" Text="Create" runat="server" CssClass="btn btn-success pull-right" />
                    </div>
                </div>
                <br />
                <br />                
            </div>
        </div>
    </div>
</asp:Content>