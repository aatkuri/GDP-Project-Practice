<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master"  CodeBehind="FacultyViewMessage.aspx.cs" Inherits="WriteCalEvent.Views.FacultyViewMessage" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .hiddencol {
            display: none;
        }
        /*Modal Popup*/
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=50);
            opacity: 0.5;
        }
    </style>
    <br />
    <br />
    <br />
    <div class="container" style="max-width: 80% !important; min-width: 750px !important;">
        <div id="AudiencePanel" runat="server">
        <div runat="server" id="messageDiv">
            <asp:GridView ID="messagesGridView" CssClass="table table-hover" runat="server" ClientIDMode="Static"
                AutoGenerateColumns="False" GridLines="None">
                <Columns>
                    <asp:BoundField HeaderText="StudentId" DataField="studentId" ReadOnly="true">
                        <ItemStyle Font-Bold="true" />
                        <HeaderStyle CssClass="bg-primary" BorderWidth="0" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Student Name" DataField="studentName" ReadOnly="true">
                        <ItemStyle Font-Bold="true" />
                        <HeaderStyle CssClass="bg-primary" BorderWidth="0" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderStyle-Width="40">
                        <ItemTemplate>
                            <asp:ImageButton ID="viewAttendeeButton" runat="server"
                                ImageUrl="~/images/view.png" OnClick="viewAttendeeButton_Click" CommandName="view" ToolTip="view attendee Record"
                                CommandArgument='<%#Bind("messageId")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Width="40">
                        <ItemTemplate>
                            <asp:ImageButton ID="deleteAttendeeButton" runat="server"
                                ImageUrl="~/images/delete.png" OnClick="deleteAttendeeButton_Click" CommandName="delete" OnClientClick="return confirm('Do you want to delete this message?');" ToolTip="Delete Record"
                                CommandArgument='<%#Bind("messageId")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:Panel ID="pnlAddEdit" runat="server" CssClass="modalPopup" Style="display: none">
                <div class="container" style="max-width: 80% !important; min-width: 750px !important;">
                    <div class="panel panel-primary" id="messageView">
                        <div class="panel-heading">
                            <strong runat="server" id="panelHeader" class="h1">Message Body</strong>
                        </div>
                        <div class="panel-body">
                            <div class="row" style="padding-left: 15px">
                                <div class="form-group col-md-6">
                                    <div id="nameFormGroup" class="form-group">
                                        <asp:Label runat="server" ID="lblMessageBody" ClientIDMode="Static"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="row-fluid">
                                <div class="col-md-12 btn-toolbar">
                                    <asp:Button ID="btnClose" Text="Close" runat="server" OnClientClick="return Hidepopup()" CssClass="btn btn-defualt" CausesValidation="false" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:LinkButton ID="lnkFake" runat="server"></asp:LinkButton>
            <cc1:ModalPopupExtender ID="popup" runat="server" DropShadow="false"
                PopupControlID="pnlAddEdit" TargetControlID="lnkFake"
                BackgroundCssClass="modalBackground" PopupDragHandleControlID="PopupHeader">
            </cc1:ModalPopupExtender>
        </div>
    </div>
    </div>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
    <script src="../Scripts/moment.js"></script>
    <script src="../Scripts/bootstrap-datetimepicker.min.js"></script>
    <script src="../Scripts/bootstrap-datepicker.js"></script>
    <script src="../Scripts/jquery.timepicker.js"></script>
    <script src="../Scripts/jquery.timepicker.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.4.1.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
    <script src="../Scripts/jquery.blockUI.js"></script>

    <script type="text/javascript">
    $(function () {
        $('#startdatepicker,#enddatepicker').datetimepicker({
            format: "MM-DD-YYYY",
            useCurrent: false,
            minDate: moment()
        });
        $('#startdatepicker').datetimepicker().on('dp.change', function (e) {
            var incrementDay = moment(new Date(e.date));
            incrementDay.add(7, 'days');
            $('#startdatepicker').data('DateTimePicker').maxDate(incrementDay);
            $(this).data("DateTimePicker").hide();
        });

        $('#starttimepicker,#endtimepicker').datetimepicker({
            format: "LT",
            stepping: 15
        });
    });

    function Hidepopup() {
        $find("popup").hide();
        return false;
    }
    </script>
</asp:Content>