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
    public partial class FormBailarinas : Form
    {
        private Form f;
        private BD bd = new BD("localhost", "teibol", "root", "");
        public FormBailarinas(Form f)
        {
            InitializeComponent();
            this.f = f;
        }

        public void Bailarinas_Load(object sender, EventArgs e)
        {
            
        }

        public void Bailarinas_Shown(object sender, EventArgs e)
        {
            cargarBailarinas();
            btnEditar.Enabled = false;
            btnEliminar.Enabled = false;
        }

        private void cargarBailarinas()
        {
            listView1.Items.Clear();
            MySqlDataReader resultados;
            if (bd.conectar())
            {
                resultados = bd.query("select * from talentos");
                while (resultados.Read())
                {
                    string[] row = {resultados[0].ToString(), resultados[1].ToString(), resultados[2].ToString(), resultados[3].ToString()};
                    var item = new ListViewItem(row);
                    
                    listView1.Items.Add(item);
                }
                bd.desconectar();
            }

        }
        private void btnSalir_Click(object sender, EventArgs e)
        {
            this.Hide();
            f.Show();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            FormCrearBailarina f = new FormCrearBailarina(this);
            this.Hide();
            f.Show();
        }

        private void listView1_MouseClick(object sender, MouseEventArgs e)
        {
            btnEditar.Enabled = true;
            btnEliminar.Enabled = true;
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt16(listView1.SelectedItems[0].SubItems[0].Text);
            string nombre = listView1.SelectedItems[0].SubItems[1].Text;
            string alias = listView1.SelectedItems[0].SubItems[2].Text;
            double sueldo = Convert.ToDouble(listView1.SelectedItems[0].SubItems[3].Text);

            FormCrearBailarina f = new FormCrearBailarina(this, id, nombre, alias, sueldo);
            f.Show();
            this.Hide();
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt16(listView1.SelectedItems[0].SubItems[0].Text);
            string qry = "delete from talentos where id = " + id;
            if (bd.conectar())
            {
                if (bd.insert(qry))
                {
                    bd.desconectar();
                    MessageBox.Show("Bailarina creada con exito");
                    cargarBailarinas();
                    btnEditar.Enabled = false;
                    btnEliminar.Enabled = false;
                }
                
            }
        }
    }
}
