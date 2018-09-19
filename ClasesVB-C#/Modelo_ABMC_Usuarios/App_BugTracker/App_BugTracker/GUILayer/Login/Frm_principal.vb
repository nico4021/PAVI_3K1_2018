﻿Public Class Frm_Principal

    Private Sub Frm_Principal_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        If MsgBox("Seguro que desea salir de la aplicación?", MsgBoxStyle.Question + MsgBoxStyle.OkCancel, "Aviso") = 1 Then
            End
        Else
            'La propiedad e.Cancel permite cancelar el evento recibido.
            e.Cancel = True
        End If
    End Sub
    Private Sub Frm_Principal_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Al cargar el formulario principal cargamos y mostramos el formulario: Frm_login en forma MODAL.
        pnl_info_user.Width = Me.Width
        Mnu_principal.Visible = False
        Frm_login.ShowDialog()
    End Sub

    Public Sub actualizarUsuarioLogueado(ByVal userLogin As String)
        lbl_user.Text = userLogin
        Mnu_principal.Visible = True
    End Sub

    Private Sub ConsultaDeBugsToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ConsultaDeBugsToolStripMenuItem.Click
        Frm_Bugs.ShowDialog()
    End Sub

    Private Sub SalirToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SalirToolStripMenuItem.Click
        Me.Close()
    End Sub

    Private Sub UsuariosToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles UsuariosToolStripMenuItem.Click
        Frm_Users.ShowDialog()
    End Sub
End Class