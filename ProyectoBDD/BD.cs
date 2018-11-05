using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace ProyectoBDD
{
    class BD
    {
        private MySqlConnection conexion = new MySqlConnection();
        private string server;
        private string database;
        private string user;
        private string pass;

        public BD(string server, string database, string user, string pass)
        {
            this.server = server;
            this.database = database;
            this.user = user;
            this.pass = pass;
        }

        public bool conectar()
        {
            conexion.ConnectionString = "server = " + server + "; database = " + database + "; uid = " + user + "; pwd = " + pass;
            try
            {
                conexion.Open();
                return true;
            }
            catch(Exception)
            {
                return false;
            }
        }

        public void desconectar()
        {
            try
            {
                if (conexion.State == System.Data.ConnectionState.Open)
                {
                    conexion.Close();
                }
            }
            catch (Exception)
            {
            }
        }

        public MySqlDataReader query(string query)
        {
            MySqlCommand consulta = new MySqlCommand(query, conexion);
            MySqlDataReader resultado = consulta.ExecuteReader();
            return resultado;
        }

        public bool insert(string query)
        {
            try
            {
                MySqlCommand insert = new MySqlCommand(query, conexion);
                MySqlDataReader resultado = insert.ExecuteReader();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
}
