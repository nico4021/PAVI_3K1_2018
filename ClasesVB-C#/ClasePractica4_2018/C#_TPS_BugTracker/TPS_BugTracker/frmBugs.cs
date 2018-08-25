﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TPS_BugTracker
{
    public partial class frmBugs : Form
    {
        public frmBugs()
        {
            InitializeComponent();
        }
    
        private void llenarCombo(ComboBox cbo, Object source, string display, String value)
        {
            cbo.DataSource = source;
            cbo.DisplayMember = display;
            cbo.ValueMember = value;
            cbo.SelectedIndex = -1;
        }

        private void frmBugs_Load(object sender, EventArgs e)
        {
            BDHelper helper = new BDHelper();
            //LLenar combos y limpiar grid
            llenarCombo(cboEstados, helper.ConsultaSQL("Select * from Estados"), "n_estado", "id_estado");
            llenarCombo(cboPrioridades, helper.ConsultaSQL("Select * from Prioridades"), "n_prioridad", "id_prioridad");
            llenarCombo(cboCriticidades, helper.ConsultaSQL("Select * from Criticidades"), "n_criticidad", "id_criticidad");
            llenarCombo(cboAsignadoA, helper.ConsultaSQL("Select * from users"), "n_usuario", "id_usuario");
            llenarCombo(cboProductos, helper.ConsultaSQL("Select * from Productos"), "nombre", "id_producto");

        }

        private void btnConsultar_Click(object sender, EventArgs e)
        {

        }
    }
}
