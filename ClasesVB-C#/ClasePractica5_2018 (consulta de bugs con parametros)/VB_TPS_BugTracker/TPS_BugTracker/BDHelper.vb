﻿
Imports System.Data.SqlClient

Public Class BDHelper
    private string string_conexion = "Data Source=LAPTOP-US2QF1H8\\SQLEXPRESS;Initial Catalog=BugsClase05;User ID=sa;Password=sole$1404";

    Private Shared instance As BDHelper 'Unica instancia de la clase

    Public Shared Function getBDHelper() As BDHelper
        If IsNothing(instance) Then
            instance = New BDHelper()
        End If
        Return instance
    End Function

    Public Function ConsultaSQL(ByVal strSql As String) As Data.DataTable
        ' Se utiliza para sentencias SQL del tipo “Select”
        ' La función recibe por valor una sentencia sql como string, devuelve un objeto de tipo DataTable
        Dim conexion As New SqlConnection
        Dim cmd As New SqlCommand
        Dim tabla As New DataTable
        Try
            conexion.ConnectionString = string_conexion
            conexion.Open()
            cmd.Connection = conexion
            cmd.CommandType = CommandType.Text
            cmd.CommandText = strSql
            ' El datatable se carga con el resultado de ejecutar la sentencia en el motor de base de datos
            tabla.Load(cmd.ExecuteReader)
            ' La función retorna el objeto datatable con 0, 1 o mas registros
            Return tabla
        Catch ex As Exception
            Throw ex
        Finally
            If conexion.State = ConnectionState.Open Then conexion.Close()
            'Dispose() libera los recursos asociados a la conexón
            conexion.Dispose()
        End Try
    End Function


    Public Function ConsultarSQLConParametros(ByVal sqlStr As String, ByVal params As Object()) As Data.DataTable
        ' Se utiliza para sentencias SQL del tipo “Select” con parámetros recibidos desde la interfaz
        ' La función recibe por valor una sentencia sql como string y un arreglo de parámetros, devuelve un objeto de tipo DataTable

        Dim conexion As New SqlConnection
        Dim cmd As New SqlCommand
        Dim tabla As New DataTable
        Dim n_param As String
        Try
            conexion.ConnectionString = string_conexion
            conexion.Open()
            cmd.Connection = conexion
            cmd.CommandType = CommandType.Text
            cmd.CommandText = sqlStr

            'Agregamos a la colección de parámetros del comando los filtros recibidos
            'IMPORTANTE: cada parametro deberá llamarse: param1, param2,.., paramN
            For i = 0 To params.Length - 1
                If Not IsNothing(params(i)) Then
                    n_param = "param" + Convert.ToString(i + 1)
                    cmd.Parameters.AddWithValue(n_param, params(i))
                End If
            Next

            ' El datatable se carga con el resultado de ejecutar la sentencia en el motor de base de datos
            tabla.Load(cmd.ExecuteReader)
            ' La función retorna el objeto datatable con 0, 1 o mas registros
            Return tabla
        Catch ex As Exception
            Throw ex
        Finally
            If conexion.State = ConnectionState.Open Then conexion.Close()
            'Dispose() libera los recursos asociados a la conexón
            conexion.Dispose()
        End Try
    End Function
End Class
