<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/134574114/18.2.11%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E3999)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebApplication1/Default.aspx) (VB: [Default.aspx](./VB/WebApplication1/Default.aspx))
* [Default.aspx.cs](./CS/WebApplication1/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebApplication1/Default.aspx.vb))
<!-- default file list end -->
# End-User Restrictions - How to implement a client-side confirmation on deleting an appointment
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/134574114/)**
<!-- run online end -->


<p>This example demonstrates how a delete appointment action can be confirmed using a client-side scripting technique. Note that the delete appointment action can be initiated from two places: a context menu and appointment form of ASPxScheduler.</p><p>To override context menu behavior, utilize the technique from the <a href="https://www.devexpress.com/Support/Center/p/E291">How to change default menu items and actions in the popup menu</a> example. I.e., handle the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxSchedulerASPxScheduler_PopupMenuShowingtopic"><u>ASPxScheduler.PopupMenuShowing Event</u></a> and specify a custom client-side handler for the menu items via the <strong>e.Menu.ClientSideEvents.ItemClick</strong> parameter (see the code behind and markup of the "Default" webpage).</p><p>To override the "Delete" button behavior of the appointment form, you need to create a custom appointment form (see <a href="http://documentation.devexpress.com/#AspNet/CustomDocument5464"><u>How to: Modify the Appointment Editing Form for Working with Custom Fields</u></a>) and assign an appropriate client-side handler to the <strong>btnDelete.ClientSideEvents.Click</strong> property in the overridden <strong>DataBind</strong><strong>()</strong> method of the form (see CustomAppointmentForm.ascx.cs code-behind file).</p><p><strong>See </strong><strong>A</strong><strong>lso:</strong><br />
<a href="https://www.devexpress.com/Support/Center/p/E1534">How to implement a client-side confirmation on the user action modifying the appointment</a></p><br />


<br/>


