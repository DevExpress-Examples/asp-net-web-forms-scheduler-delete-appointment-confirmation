<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v18.2, Version=18.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register Assembly="DevExpress.XtraScheduler.v18.2.Core, Version=18.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraScheduler" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <script>
        function onMenuItemClicked(s, e) {
            if (e.itemName == "DeleteAppointment") {
                e.handled = !confirm('Are you sure you want to delete this appointment?');
            }
        }

        function onSchedulerInit(s, e) {
            s.SetHeight(800);
        }

        function onCustomDeleteButtonClick() {
            if (confirm('Are you sure you want to delete this appointment?')) {
                clientScheduler.AppointmentFormDelete();
            }
        }
    </script>
    <form id="form1" runat="server">
        <div>
            <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" AppointmentDataSourceID="ObjectDataSourceAppointment"
                ResourceDataSourceID="ObjectDataSourceResources" ClientIDMode="AutoID" GroupType="Date" ClientInstanceName="clientScheduler">
                <ClientSideEvents Init="onSchedulerInit" MenuItemClicked="onMenuItemClicked" />
                <Storage>
                    <Appointments AutoRetrieveId="true">
                        <Mappings AppointmentId="Id" Start="StartTime" End="EndTime" Subject="Subject" AllDay="AllDay"
                            Description="Description" Label="Label" Location="Location" RecurrenceInfo="RecurrenceInfo"
                            ReminderInfo="ReminderInfo" Status="Status" Type="EventType" ResourceId="ResourceId" />
                    </Appointments>
                    <Resources>
                        <Mappings ResourceId="ResourceId" Caption="Caption" />
                    </Resources>
                </Storage>
            </dxwschs:ASPxScheduler>
            <asp:ObjectDataSource ID="ObjectDataSourceResources" runat="server" SelectMethod="GetCustomResources" TypeName="WebApplication1.Helpers.ResourceDataSourceHelper"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSourceAppointment" runat="server" DataObjectTypeName="WebApplication1.Helpers.CustomAppointment" DeleteMethod="DeleteCustomAppointment" InsertMethod="InsertCustomAppointment" SelectMethod="GetCustomAppointmentsList" TypeName="WebApplication1.Helpers.AppointmentDataSourceHelper" UpdateMethod="UpdateCustomAppointment"></asp:ObjectDataSource>
        </div>
    </form>
</body>
</html>
