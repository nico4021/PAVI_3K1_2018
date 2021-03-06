﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TPS_BugTracker.BusinessLayer.Entities;

namespace TPS_BugTracker
{
    public partial class frmDetalleBug : Form
    {
        public frmDetalleBug()
        {
            InitializeComponent();
        }

        internal void mostrarBug(Bug oBugSelected)
        {
            txtNroBug.Text = oBugSelected.id_bug.ToString();
            txtTitulo.Text = oBugSelected.titulo;
            txtProducto.Text = oBugSelected.n_producto;
            txtFechaAlta.Text = oBugSelected.fecha_alta.ToString();
            txtDescripcion.Text = oBugSelected.descripcion;
            txtEstado.Text = oBugSelected.estado;
            txtPrioridad.Text = oBugSelected.n_prioridad;
            txtCriticidad.Text = oBugSelected.n_criticidad;

            dgv_historiales.Rows.Clear();
          //  foreach (ElementoBug oBug in oBugSelected.historial)
            //    dgv_historiales.Rows.Add(new string[] { oBug.fecha.ToString("dd/MM/yyyy"), oBug.n_responsable, oBug.n_estado, oBug.n_asignado_a });
        }
    }
}
