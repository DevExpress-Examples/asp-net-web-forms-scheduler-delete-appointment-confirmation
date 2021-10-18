using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.ASPxScheduler;
using DevExpress.Web.ASPxScheduler.Dialogs;
using DevExpress.Web.ASPxScheduler.Internal;
using DevExpress.XtraScheduler;
using DevExpress.XtraScheduler.iCalendar;
using WebApplication1.Helpers;

namespace WebApplication1 {
    public partial class Default : System.Web.UI.Page {
        protected void Page_Init(object sender, EventArgs e) {
            if(!IsPostBack) Session.Clear();

            var dialog = ASPxScheduler1.OptionsForms.DialogLayoutSettings.AppointmentDialog;
            dialog.GenerateDefaultLayoutElements();

            DialogButton customDeleteButton = dialog.LayoutElements.CreateButton("btnDelete");
            customDeleteButton.Text = "Delete";            
            dialog.InsertAfter(customDeleteButton, dialog.FindLayoutElement("Cancel"));
            dialog.RemoveLayoutElement("Delete");

            ASPxScheduler1.OptionsForms.DialogLayoutSettings.AppointmentDialog.ViewModel.PrepareControl("btnDelete", (ASPxButton button) => {
                button.ClientSideEvents.Click = "onCustomDeleteButtonClick";
            });
        }

        protected void Page_Load(object sender, EventArgs e) {

        }
    }
}