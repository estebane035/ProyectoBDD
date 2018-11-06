using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ProyectoBDD
{
    public partial class FormCrearBailarina : Form
    {
        private BD bd = new BD("localhost", "teibol", "root", "");
        FormBailarinas f;

        private int id = 0;
        private string nombre;
        private string alias;
        private double sueldo; 

        public FormCrearBailarina(FormBailarinas f)
        {
            InitializeComponent();
            this.f = f;
        }

        public FormCrearBailarina(FormBailarinas f, int id, string nombre, string alias, double sueldo)
        {
            InitializeComponent();
            this.f = f;
            this.id = id;
            this.nombre = nombre;
            this.alias = alias;
            this.sueldo = sueldo;
            btnGuardar.Text = "Editar Bailarina " + this.nombre;
            this.Text = "Editando bailarina";
        }

        private void FormCrearBailarina_Load(object sender, EventArgs e)
        {
            if (id != 0)
            {
                txtNombre.Text = nombre;
                txtAlias.Text = alias;
                txtSueldo.Text = sueldo.ToString();
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            f.Show();
            this.Dispose();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            String nombre, alias, qry;
            double sueldo;
            nombre = txtNombre.Text.ToString();
            alias = txtAlias.Text.ToString();
            sueldo = Convert.ToDouble(txtSueldo.Text.ToString());
            if (id == 0)
            {
                qry = "Insert into talentos (nombre, alias, sueldo) values ('" + nombre + "', '" + alias + "', " + sueldo + ")";
                if (bd.conectar())
                {
                    if (bd.insert(qry))
                        MessageBox.Show("Bailarina creada con exito");
                    bd.desconectar();
                    f.Show();
                    this.Dispose();
                }
            }
            else
            {
                qry = "update talentos set nombre = '" + nombre + "', alias = '" + alias + "', sueldo = " + sueldo + " where id = " + id;
                if (bd.conectar())
                {
                    if (bd.insert(qry))
                        MessageBox.Show("Bailarina editada con exito");
                    bd.desconectar();
                    f.Show();
                    this.Dispose();
                }
            }
        }

    }
}
