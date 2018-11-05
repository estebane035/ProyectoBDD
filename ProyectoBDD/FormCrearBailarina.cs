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
        Form1 f;
        public FormCrearBailarina(Form1 f)
        {
            InitializeComponent();
            this.f = f;
        }

        private void FormCrearBailarina_Load(object sender, EventArgs e)
        {
            MySqlDataReader resultados;
            if (bd.conectar())
            {
                resultados = bd.query("select * from talentos");
                while (resultados.Read())
                {
                    MessageBox.Show(resultados[0] + " -- " + resultados[1]);
                    Console.WriteLine(resultados[0] + " -- " + resultados[1]);
                }
                bd.desconectar();
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            f.Show();
            this.Close();
        }
    }
}
