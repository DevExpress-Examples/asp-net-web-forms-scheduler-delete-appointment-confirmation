<!-- default file list -->
*Files to look at*:

* [CustomEvents.cs](./CS/WebSite/App_Code/CustomEvents.cs) (VB: [CustomEvents.vb](./VB/WebSite/App_Code/CustomEvents.vb))
* [Helpers.cs](./CS/WebSite/App_Code/Helpers.cs) (VB: [Helpers.vb](./VB/WebSite/App_Code/Helpers.vb))
* [CustomAppointmentForm.ascx](./CS/WebSite/CustomForms/CustomAppointmentForm.ascx) (VB: [CustomAppointmentForm.ascx](./VB/WebSite/CustomForms/CustomAppointmentForm.ascx))
* [CustomAppointmentForm.ascx.cs](./CS/WebSite/CustomForms/CustomAppointmentForm.ascx.cs) (VB: [CustomAppointmentForm.ascx.vb](./VB/WebSite/CustomForms/CustomAppointmentForm.ascx.vb))
* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# End-User Restrictions - How to implement a client-side confirmation on deleting an appointment


<p>This example demonstrates how a delete appointment action can be confirmed using a client-side scripting technique. Note that the delete appointment action can be initiated from two places: a context menu and appointment form of ASPxScheduler.</p><p>To override context menu behavior, utilize the technique from the <a href="https://www.devexpress.com/Support/Center/p/E291">How to change default menu items and actions in the popup menu</a> example. I.e., handle the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxSchedulerASPxScheduler_PopupMenuShowingtopic"><u>ASPxScheduler.PopupMenuShowing Event</u></a> and specify a custom client-side handler for the menu items via the <strong>e.Menu.ClientSideEvents.ItemClick</strong> parameter (see the code behind and markup of the "Default" webpage).</p><p>To override the "Delete" button behavior of the appointment form, you need to create a custom appointment form (see <a href="http://documentation.devexpress.com/#AspNet/CustomDocument5464"><u>How to: Modify the Appointment Editing Form for Working with Custom Fields</u></a>) and assign an appropriate client-side handler to the <strong>btnDelete.ClientSideEvents.Click</strong> property in the overridden <strong>DataBind</strong><strong>()</strong> method of the form (see CustomAppointmentForm.ascx.cs code-behind file).</p><p><strong>See </strong><strong>A</strong><strong>lso:</strong><br />
<a href="https://www.devexpress.com/Support/Center/p/E1534">How to implement a client-side confirmation on the user action modifying the appointment</a></p><br />


<br/>


