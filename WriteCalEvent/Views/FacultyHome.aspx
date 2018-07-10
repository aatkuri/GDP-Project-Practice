<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="FacultyHome.aspx.cs" Inherits="WriteCalEvent.Views.FacultyHome" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

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
    <div class="container col-md-12 hidden" id="mainContainer">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h1>Faculty Home</h1>
            </div>
            <div class="panel-body">
                <div>
                    <ul class="nav nav-pills" role="tablist">
                        <li role="presentation" class="active"><a href="##create_schedule">Create Schedule</a></li>
                        <li role="presentation"><a href="##past_schedule">Past Schedules <span class="badge" id="pastSchedule" runat="server"></span></a></li>                        
                    </ul>
                </div>
            </div>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="create_schedule">
                    <div class="row form-group" style="padding-left: 1px">
                        <div class="form-group col-md-3 col-sm-5">
                            <asp:RequiredFieldValidator ID="startdatepickerTBValidator" runat="server"
                                ControlToValidate="startdatepickerTB"
                                ErrorMessage="Start Date is required." ForeColor="Red"> *
                            </asp:RequiredFieldValidator>
                            <label for="startdatepicker">Date:</label>
                            <div id="startdatepicker" class="input-group">
                                <asp:TextBox ID="startdatepickerTB" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>

                        <div class="form-group col-md-3 col-sm-5">
                            <asp:RequiredFieldValidator ID="starttimepickerTBValidator" runat="server"
                                ControlToValidate="starttimepickerTB"
                                ErrorMessage="Start Time is required." ForeColor="Red"> *
                            </asp:RequiredFieldValidator>
                            <label for="starttimepicker">Start Time:</label>
                            <div id="starttimepicker" class="input-group">
                                <asp:TextBox ID="starttimepickerTB" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-time"></span>
                                </span>
                            </div>
                        </div>

                        <div class="form-group col-md-3 col-sm-5">
                            <asp:RequiredFieldValidator ID="endTimepickerTBValidator" runat="server"
                                ControlToValidate="endTimepickerTB"
                                ErrorMessage="End Time is required." ForeColor="Red"> *
                            </asp:RequiredFieldValidator>
                            <label for="endtimepicker">End Time:</label>
                            <div id="endtimepicker" class="input-group">
                                <asp:TextBox ID="endTimepickerTB" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-time"></span>
                                </span>
                            </div>
                        </div>
                        <div class="form-group col-md-3 col-sm-5">
                            <asp:Button ID="btnAddScheule" OnClick="addScheule_Click" Text="Add" runat="server" CssClass="btn btn-success" />
                            <asp:Button ID="btnPullEvents" OnClick="btnPullEvents_Click" Text="Get from Google" runat="server" CssClass="btn btn-success" CausesValidation="false" />
                        </div>
                    </div>
                    <div runat="server" id="scheduleEventsDiv" role="tabpanel" class="tab-pane active">
                        <asp:GridView ID="gridScheduleEvent" CssClass="table table-hover" runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="day" HeaderText="Day" ReadOnly="True" SortExpression="day" />
                                <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                                <asp:BoundField DataField="time" HeaderText="Time" SortExpression="time" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

                <div role="tabpanel" class="tab-pane" id="past_schedule">
                </div>

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
<asp:Content runat="server" ContentPlaceHolderID="JavascriptFiles">
    <script>
        // Taken from http://stackoverflow.com/a/21494906 by user Xavi Martínez
        // Returns to the selecteed tab after a page reload
        $(document).ready(function () {
            if (location.hash) {
                var hash = location.hash;
                // If the url has parameters, exclude them from the hash
                if (location.hash.toString().indexOf("?") > 0) {
                    hash = hash.substring(0, hash.indexOf("?"));
                }
                $('a[href=' + hash + ']').tab('show');
            }
            $(document.body).on("click", "a[data-toggle]", function (event) {
                event.preventDefault();
                location.hash = this.getAttribute("href");
            });
            $("#SearchTxt").focus();
        });
        $(window).on('popstate', function () {
            var hash = location.hash;
            // If the url has parameters, exclude them from the hash
            if (location.hash.toString().indexOf("?") > 0) {
                hash = hash.substring(0, hash.indexOf("?"));
            }
            var anchor = location.hash || $("a[data-toggle=tab]").first().attr("href");
            console.log(anchor.indexOf("?"));
            $('a[href=' + anchor + ']').tab('show');
        });

        // Used to hide the main container while it loads and then selects the right tab, which is very jerky
        $("div#mainContainer").removeClass("hidden");
    </script>
</asp:Content>