﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
public class BDHelper
{
    
    private string string_conexion = "Data Source=LAPTOP-US2QF1H8\\SQLEXPRESS;Initial Catalog=BugsClase05;User ID=sa;Password=sole$1404";

    private static BDHelper instance; //Unica instancia de la clase
    public static BDHelper getBDHelper()
    {
        if (instance == null)
            instance = new BDHelper();
        return instance;
    }

    public DataTable ConsultaSQL(string strSql)
    {
        //  Se utiliza para sentencias SQL del tipo Select
        //  La función recibe por valor una sentencia sql como string, devuelve un objeto de tipo DataTable
        SqlConnection conexion = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        DataTable tabla = new DataTable();
        try
        {
            conexion.ConnectionString = string_conexion;
            conexion.Open();
            cmd.Connection = conexion;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSql;
            //  El datatable se carga con el resultado de ejecutar la sentencia en el motor de base de datos

            tabla.Load(cmd.ExecuteReader());
            //  La función retorna el objeto datatable con 0, 1 o mas registros
            return tabla;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if ((conexion.State == ConnectionState.Open))
            {
                conexion.Close();
            }

            // Dispose() libera los recursos asociados a la conexón
            conexion.Dispose();
        }

    }

    public DataTable ConsultaSqlConParametros(string strSql, List<string> sqlParam)
    {
        //  Se utiliza para sentencias SQL del tipo Select
        //  La función recibe por valor una sentencia sql como string, devuelve un objeto de tipo DataTable
        SqlConnection conexion = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        DataTable tabla = new DataTable();
        try
        {
            conexion.ConnectionString = string_conexion;
            conexion.Open();
            cmd.Connection = conexion;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSql;
            //  El datatable se carga con el resultado de ejecutar la sentencia en el motor de base de datos

            var indice = 0;
            foreach (var param in sqlParam)
            {
                if (param != null)
                {
                    var n_param = "param" + Convert.ToString(indice + 1);
                    cmd.Parameters.AddWithValue(n_param, param);
                }
                indice++;
            }

            tabla.Load(cmd.ExecuteReader());
            //  La función retorna el objeto datatable con 0, 1 o mas registros
            return tabla;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if ((conexion.State == ConnectionState.Open))
            {
                conexion.Close();
            }

            // Dispose() libera los recursos asociados a la conexón
            conexion.Dispose();
        }

    }
}