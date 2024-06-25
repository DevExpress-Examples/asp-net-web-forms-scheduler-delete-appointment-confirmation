<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/134574114/18.2.11%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E3999)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
[![](https://img.shields.io/badge/💬_Leave_Feedback-feecdd?style=flat-square)](#does-this-example-address-your-development-requirementsobjectives)
<!-- default badges end -->

# Scheduler for ASP.NET Web Forms - How to display a client-side confirmation message when an appointment is deleted

This example demonstrates how to display a confirmation message before an appointment is deleted.

<!--IMAGE (will be added later) -->

Users can delete an appointment in the following two ways:

* Select the **Delete** context menu item.

    To override the context menu behavior, handle the [ASPxClientScheduler.MenuItemClicked](https://docs.devexpress.com/AspNet/js-ASPxClientScheduler.MenuItemClicked) event as shown below:

    ```javascript
    function onMenuItemClicked(s, e) {
        if (e.itemName == "DeleteAppointment") {
            e.handled = !confirm('Are you sure you want to delete this appointment?');
        }
    }
    ```

* Click the **Delete** button in an appointment form.

    To override the behavior of the Delete button in the appointment form, replace the built-in **Delete** button with a custom button and handle its [Click](https://docs.devexpress.com/AspNet/js-ASPxClientButton.Click) event.

    ```csharp
    DialogButton customDeleteButton = dialog.LayoutElements.CreateButton("btnDelete");
    customDeleteButton.Text = "Delete";            
    dialog.InsertAfter(customDeleteButton, dialog.FindLayoutElement("Cancel"));
    dialog.RemoveLayoutElement("Delete");

    ASPxScheduler1.OptionsForms.DialogLayoutSettings.AppointmentDialog.ViewModel.PrepareControl("btnDelete", (ASPxButton button) => {
        button.ClientSideEvents.Click = "onCustomDeleteButtonClick";
    });
    ```

    ```javascript
    function onCustomDeleteButtonClick() {
        if (confirm('Are you sure you want to delete this appointment?')) {
            clientScheduler.AppointmentFormDelete();
        }
    }
    ```


<!-- default file list -->
## Files to Look At

* [Default.aspx](./CS/WebApplication1/Default.aspx) (VB: [Default.aspx](./VB/WebApplication1/Default.aspx))
* [Default.aspx.cs](./CS/WebApplication1/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebApplication1/Default.aspx.vb))
<!-- default file list end -->

## Documentation

- <a href="https://docs.devexpress.com/AspNet/119729/components/scheduler/examples/customization/custom-form-and-custom-fields/how-to-customize-the-appointment-dialog-using-view-model-api-simple-customization">How to: Customize the Appointment Dialog using View Model API (simple customization)</a>
- <a href="https://docs.devexpress.com/AspNet/119731/components/scheduler/examples/customization/custom-form-and-custom-fields/how-to-customize-the-appointment-dialog-using-view-model-api-working-with-custom-fields">How to: Customize the Appointment Dialog using View Model API (working with custom fields)</a>
<!-- feedback -->
## Does this example address your development requirements/objectives?

[<img src="https://www.devexpress.com/support/examples/i/yes-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=asp-net-web-forms-scheduler-delete-appointment-confirmation&~~~was_helpful=yes) [<img src="https://www.devexpress.com/support/examples/i/no-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=asp-net-web-forms-scheduler-delete-appointment-confirmation&~~~was_helpful=no)

(you will be redirected to DevExpress.com to submit your response)
<!-- feedback end -->
