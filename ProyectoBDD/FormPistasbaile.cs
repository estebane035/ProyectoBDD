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
    public partial class FormPistasBaile : Form
    {
        private Form f;
        private BD bd = new BD("localhost", "teibol", "root", "");
        public FormPistasBaile(Form f)
        {
            InitializeComponent();
            this.f = f;
        }

        private void cargarPistasdeBaile()
        {
            listView1.Items.Clear();
            MySqlDataReader resultados;
            if (bd.conectar())
            {
                resultados = bd.query("select * from pistabaile");
                while (resultados.Read())
                {
                    string[] row = { resultados[0].ToString(), resultados[1].ToString(), resultados[2].ToString(), resultados[3].ToString() };
                    var item = new ListViewItem(row);

                    listView1.Items.Add(item);
                }
                bd.desconectar();
            }

        }

        private void FormPistasBaile_VisibleChanged(object sender, EventArgs e)
        {
            btnEditar.Enabled = false;
            btnEliminar.Enabled = false;
            cargarPistasdeBaile();
        }


    }
}
