Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.IO
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web
Imports DevExpress.Web.ASPxScheduler
Imports DevExpress.Web.ASPxScheduler.Dialogs
Imports DevExpress.Web.ASPxScheduler.Internal
Imports DevExpress.XtraScheduler
Imports DevExpress.XtraScheduler.iCalendar
Imports WebApplication1.Helpers

Namespace WebApplication1
	Partial Public Class [Default]
		Inherits System.Web.UI.Page
		Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
			If (Not IsPostBack) Then
				Session.Clear()
			End If

			Dim dialog = ASPxScheduler1.OptionsForms.DialogLayoutSettings.AppointmentDialog
			dialog.GenerateDefaultLayoutElements()

			Dim customDeleteButton As DialogButton = dialog.LayoutElements.CreateButton("btnDelete")
            customDeleteButton.Text = "Delete"
            dialog.InsertAfter(customDeleteButton, dialog.FindLayoutElement("Cancel"))
			dialog.RemoveLayoutElement("Delete")

			ASPxScheduler1.OptionsForms.DialogLayoutSettings.AppointmentDialog.ViewModel.PrepareControl("btnDelete", Function(button) AnonymousMethod1(button))
		End Sub
		
		Private Function AnonymousMethod1(ByVal button As ASPxButton) As Boolean
			button.ClientSideEvents.Click = "onCustomDeleteButtonClick"
			Return True
		End Function

		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

		End Sub
	End Class
End Namespace