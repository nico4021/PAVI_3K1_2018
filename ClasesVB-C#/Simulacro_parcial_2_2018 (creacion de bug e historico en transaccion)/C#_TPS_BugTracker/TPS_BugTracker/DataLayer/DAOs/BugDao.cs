

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Security;
using System.Text;
using System.Threading.Tasks;
using Microsoft.VisualBasic;
using TPS_BugTracker.BusinessLayer.Entities;
using System.Data;
using System.Data.SqlClient;
// para usar el msgbox como depurador
using System.Windows.Forms;

namespace TPS_BugTracker.DataLayer.DAOs
{
    public class BugDao
    {
        public Bug getBugById(int id)
        {
            DataManager dm = new DataManager();
            Bug bug = null;
            try
            {
                dm.Open();

                string sql = "   SELECT TOP 20 bug.id_bug, bug.titulo, bug.descripcion, pro.nombre, bug.fecha_alta, n_estado as estado, usr.n_usuario as asignado_a, n_prioridad, cri.n_criticidad, pro.id_producto, pri.id_prioridad, cri.id_criticidad" +
                    "   FROM  bugs bug" +
                    "   INNER JOIN Historiales_Bug his ON bug.id_bug = his.id_bug" +
                    "   INNER JOIN Estados est ON his.id_estado = est.id_estado" +
                    "   LEFT JOIN Users usr ON his.asignado_a = usr.id_usuario" +
                    "   INNER JOIN Productos pro ON bug.id_producto = pro.id_producto" +
                    "   INNER JOIN Prioridades pri ON bug.id_prioridad = pri.id_prioridad" +
                    "   INNER JOIN Criticidades cri ON bug.id_criticidad = cri.id_criticidad" +
                    "   WHERE his.id_detalle = (SELECT MAX(id_detalle) FROM Historiales_Bug his2 WHERE bug.id_bug = his2.id_bug)" +
                    "         AND bug.id_bug = " + id.ToString();


                bug = mapBug(dm.ConsultaSQL(sql).Rows[0]);

                
            }
            catch (Exception ex)
            {
                dm.Rollback();
            }
            finally
            {
                // Cierra la conexión 
                dm.Close();
            }


            return bug;
        }

        public IList<Bug> getBugByFilters(List<object> parametros)
        {
            DataManager dm = new DataManager();
            List<Bug> lst = new List<Bug>();
            try
            {
                dm.Open();
                 string sql = "SELECT " +
                " b.id_bug," +
                " b.titulo," +
                " b.descripcion," +
                " b.id_producto," +
                " b.id_prioridad," +
                " b.fecha_alta," +
                " b.id_criticidad," +
                " pro.nombre," +
                " pri.n_prioridad," +
                " cri.n_criticidad," +
                " e.n_estado FROM bugs b, Productos pro, Prioridades pri, Criticidades cri, Estados e " +
                " WHERE b.id_producto = pro.id_producto" +
                " AND b.id_prioridad = pri.id_prioridad" +
                " AND b.id_criticidad = cri.id_criticidad"+
                " AND b.id_estado = e.id_estado";
                 MessageBox.Show(sql, "muestro la sentencia", MessageBoxButtons.OK, MessageBoxIcon.Information);
                 // Validamos filtro de fechas
                 if (parametros[0] != null && parametros[1] != null)
                     sql += " AND (b.fecha_alta>=@param1 AND b.fecha_alta<=@param2) ";
                 // Validamos filtro prioridad
                 if (parametros[2] != null)
                     sql += " AND b.id_prioridad=@param3 ";
                 // Validamos filtro criticidad
                 if (parametros[3] != null)
                     sql += " AND b.id_criticidad=@param4 ";
                 // Validamos filtro producto
                 if (parametros[4] != null)
                     sql += " AND b.id_producto=@param5 ";

                 if (parametros[5] != null)
                     sql += " AND b.id_estado=@param6 ";
                 // Con el mismo criterio validamos filtro asignado_a
                 if (parametros[6] != null)
                     sql += " AND b.id_asignado_a=@param7 ";
                 sql += " ORDER BY b.fecha_alta DESC ";
                 
                 foreach (DataRow row in dm.ConsultaSQLConParametros(sql, parametros).Rows)
                     lst.Add(mapSmallBug(row));
                 return lst;
                 dm.Commit();

            }
            catch (Exception ex)
            {
                dm.Rollback();
            }
            finally
            {
                // Cierra la conexión 
                dm.Close();
            }

            return lst;
        }

        private Bug mapSmallBug(DataRow row)
        {
            Bug oBug = new Bug();
            oBug.id_bug = Convert.ToInt32(row["id_bug"].ToString());
            oBug.titulo = row["titulo"].ToString();
            oBug.descripcion = row["descripcion"].ToString();
            oBug.fecha_alta = Convert.ToDateTime(row["fecha_alta"].ToString());
            oBug.n_producto = row["nombre"].ToString();
            oBug.n_estado = row["n_estado"].ToString();
            oBug.n_asignadoa = row["asignado_a"].ToString();
            oBug.n_prioridad = row["n_prioridad"].ToString();
            oBug.n_criticidad = row["n_criticidad"].ToString();
            return oBug;
        }

        private Bug mapBug(DataRow row)
        {
            Bug oBug = new Bug();

            oBug.id_bug = Convert.ToInt32(row["id_bug"].ToString());
            oBug.titulo = row["titulo"].ToString();
            oBug.descripcion = row["descripcion"].ToString();
            oBug.fecha_alta = Convert.ToDateTime(row["fecha_alta"].ToString());
            oBug.id_producto = Convert.ToInt32(row["id_producto"].ToString());
            oBug.id_prioridad = Convert.ToInt32(row["id_prioridad"].ToString());
            oBug.id_criticidad = Convert.ToInt32(row["id_criticidad"].ToString());
            oBug.n_producto = row["nombre"].ToString();
            oBug.n_criticidad = row["n_criticidad"].ToString();
            oBug.n_prioridad = row["n_prioridad"].ToString();
            oBug.n_estado = row["estado"].ToString();

            return oBug;
        }

        public bool update(Bug oBugSelected)
        {
            DataManager dm = new DataManager();
            try
            {
                dm.Open();
                dm.BeginTransaction();

                string sql = " UPDATE bugs" +
                            "     SET titulo = @titulo," +
                            "         descripcion = @descripcion, " +
                            "         id_producto = @id_producto," +
                            "         id_prioridad = @id_prioridad," +
                            "         id_criticidad = @id_criticidad" +
                            "   WHERE id_bug = @id_bug;";

                List<SqlParameter> parametros = new List<SqlParameter>();
                parametros.Add(new SqlParameter("id_bug", oBugSelected.id_bug));
                parametros.Add(new SqlParameter("titulo", oBugSelected.titulo));
                parametros.Add(new SqlParameter("descripcion", oBugSelected.descripcion));
                parametros.Add(new SqlParameter("id_producto", oBugSelected.id_producto));
                parametros.Add(new SqlParameter("id_prioridad", oBugSelected.id_prioridad));
                parametros.Add(new SqlParameter("id_criticidad", oBugSelected.id_criticidad));


                dm.EjecutarSQL(sql, parametros);

                dm.Commit();

            }
            catch (Exception ex)
            {
                dm.Rollback();

            }
            finally
            {
                // Cierra la conexión 
                dm.Close();
            }
            return true;
        }

        public bool createBugConHistorial(Bug oBug)
        {
            DataManager dm = new DataManager();
            try
            {
                string sql_con_parametros = "INSERT INTO Bugs(titulo,descripcion,id_producto,id_prioridad,id_criticidad,fecha_alta, id_estado) " +
                            "   VALUES(@titulo,@descripcion,@id_producto,@id_prioridad,@id_criticidad,GetDate(),@id_estado);" +
                            "   select SCOPE_IDENTITY();";

                List<SqlParameter> parametros = new List<SqlParameter>();
                parametros.Add(new SqlParameter("titulo", oBug.titulo));
                parametros.Add(new SqlParameter("descripcion", oBug.descripcion));
                parametros.Add(new SqlParameter("id_producto", oBug.id_producto));
                parametros.Add(new SqlParameter("id_prioridad", oBug.id_prioridad));
                parametros.Add(new SqlParameter("id_criticidad", oBug.id_criticidad));
                parametros.Add(new SqlParameter("id_estado", oBug.id_estado));
               // parametros.Add(new SqlParameter("id_asignado_a", null));

                dm.Open();
                dm.BeginTransaction();
                string sql_sin_parametros = "INSERT INTO Bugs(titulo,descripcion,id_producto,id_prioridad,id_criticidad,fecha_alta, id_estado, id_asignado_a)" + "   VALUES(" + "'" + oBug.titulo + "'" + "," + "'" + oBug.descripcion + "'" + "," + oBug.id_producto + "," + oBug.id_prioridad + "," + oBug.id_criticidad + "," + "GETDATE()" + "," + oBug.id_estado + "," + "null" + ");" + "   select SCOPE_IDENTITY();";
                MessageBox.Show(sql_sin_parametros, "muestro la sentencia", MessageBoxButtons.OK, MessageBoxIcon.Information);
                List<SqlParameter> parametrosvacio = new List<SqlParameter>();
                //dm.EjecutarSQL(sql_sin_parametros, parametrosvacio);
                //oBug.id_bug = dm.EjecutarSQL(sql_sin_parametros, parametros);
               oBug.id_bug = dm.EjecutarSQL(sql_con_parametros, parametros);

                string sqlDetalle = " INSERT INTO BugsHistorico(id_bug, titulo, descripcion, id_producto, id_prioridad, id_criticidad, id_estado, fecha_historico) " +
                            "    VALUES(@id_bug, @titulo ,@descripcion,@id_producto,@id_prioridad, @id_criticidad, @id_estado, getdate())";

                List<SqlParameter> paramDetalle = new List<SqlParameter>();
                parametros.Add(new SqlParameter("id_bug", oBug.id_bug));
                parametros.Add(new SqlParameter("titulo", oBug.titulo));
                parametros.Add(new SqlParameter("descripcion", oBug.descripcion));
                parametros.Add(new SqlParameter("id_producto", oBug.id_producto));
                parametros.Add(new SqlParameter("id_prioridad", oBug.id_prioridad));
                parametros.Add(new SqlParameter("id_criticidad", oBug.id_criticidad));
              //parametros.Add(new SqlParameter("id_responsable", oBug.id_asignado_a));
                parametros.Add(new SqlParameter("id_estado", oBug.id_estado));
               // dm.EjecutarSQL(sqlDetalle, paramDetalle);


                string sqlDetalle_sin_parametros = "INSERT INTO BugsHistorico(id_bug,titulo,descripcion,id_producto,id_prioridad,id_criticidad, id_estado, id_responsable, fecha_historico)" + "   VALUES(" + oBug.id_bug + "," + "'" + oBug.titulo + "'" + "," + "'" + oBug.descripcion + "'" + "," + oBug.id_producto + "," + oBug.id_prioridad + "," + oBug.id_criticidad + "," + oBug.id_estado + "," + "null" + "," + "GETDATE()" + ")";
                MessageBox.Show(sqlDetalle_sin_parametros, "muestro la sentencia", MessageBoxButtons.OK, MessageBoxIcon.Information);
                List<SqlParameter> paramdetalle = new List<SqlParameter>();
            
                dm.EjecutarSQL(sqlDetalle_sin_parametros, paramDetalle);

              dm.Commit();
                return true;
            }
            catch (Exception ex)
            {
                dm.Rollback();
                return false;
            }
            finally
            {
                // Cierra la conexión 
                dm.Close();
            }

        }
    }
}



