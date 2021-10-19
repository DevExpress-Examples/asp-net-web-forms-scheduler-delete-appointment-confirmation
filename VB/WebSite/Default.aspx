<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register Assembly="DevExpress.XtraScheduler.v15.1.Core, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.XtraScheduler" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Untitled Page</title>

	<script type="text/javascript">
		function DefaultAppointmentMenuHandler(sch, s, args) {
			if (args.item.GetItemCount() <= 0) {
				if (args.item.name == 'DeleteAppointment') {
					if (!confirm('Are you sure that you want to delete this appointment?'))
						return;
				}
				sch.RaiseCallback("MNUAPT|" + args.item.name);
			}
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<dxwschs:ASPxScheduler runat="server" ID="ASPxScheduler1" ClientInstanceName="scheduler" OnAppointmentInserting="ASPxScheduler1_AppointmentInserting" OnPopupMenuShowing="ASPxScheduler1_PopupMenuShowing">
			<OptionsForms AppointmentFormTemplateUrl="~/CustomForms/CustomAppointmentForm.ascx" />
		</dxwschs:ASPxScheduler>
	</div>
		<asp:ObjectDataSource ID="appointmentDataSource" runat="server" DataObjectTypeName="CustomEvent" TypeName="CustomEventDataSource"
							  DeleteMethod="DeleteMethodHandler" SelectMethod="SelectMethodHandler" InsertMethod="InsertMethodHandler" UpdateMethod="UpdateMethodHandler" 
							  OnObjectCreated="appointmentsDataSource_ObjectCreated">
		</asp:ObjectDataSource>
	</form>
</body>
</html>