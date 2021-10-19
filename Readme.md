<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/134574114/18.2.11%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E3999)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->

# Scheduler for ASP.NET Web Forms - How to implement a client-side confirmation on deleting an appointmen

This example demonstrates how to display a confirmation message before an appointment is deleted.

<!--IMAGE (will be added later) -->

Users can delete an appointment in two following ways:

* Select the **Delete** context menu item.

    To override the context menu behavior, handle the [ASPxClientScheduler.MenuItemClicked](https://docs.devexpress.com/AspNet/js-ASPxClientScheduler.MenuItemClicked) event as shown below:

    ```javascript
    function onMenuItemClicked(s, e) {
        if (e.itemName == "DeleteAppointment") {
            e.handled = !confirm('Are you sure that you want to delete this appointment?');
        }
    }
    ```

* Click the **Delete** button in an appointment form.

    To override behavior of the Delete button in the appointment form, replace the build-in **Delete** button with your custom button and handle its [Click](https://docs.devexpress.com/AspNet/js-ASPxClientButton.Click) event.

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
        if (confirm('Are you sure that you want to delete this appointment?')) {
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