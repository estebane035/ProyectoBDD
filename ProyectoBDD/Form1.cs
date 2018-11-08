using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProyectoBDD
{
    public partial class Form1 : Form
    {
        private BD bd = new BD("localhost", "teibol", "root", "");
        public Form1()
        {
            InitializeComponent();
        }

        private void btnCrearBailarina_Click(object sender, EventArgs e)
        {
            FormBailarinas f = new FormBailarinas(this);
            this.Hide();
            f.Show();

        }

        private void Form1_Load(object sender, EventArgs e)
        {
        }

        private void btnPistaBaile_Click(object sender, EventArgs e)
        {
            FormPistasBaile f = new FormPistasBaile(this);
            this.Hide();
            f.Show();
        }
    }
}
