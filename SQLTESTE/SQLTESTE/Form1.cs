using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.Sql;
using System.Data.SqlClient;

namespace SQLTESTE
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private DataTable GetDados(SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            //String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conexaoNorthwind"].ConnectionString;
            string strConnString = "Data Source=" + textBox1.Text + ";Initial Catalog=" + 
                textBox2.Text + ";User Id=" + textBox3.Text + ";Password=" + textBox4.Text + 
                ";Connection Timeout=1";


            SqlConnection con = new SqlConnection(strConnString);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                con.Open();
                sda.SelectCommand = cmd;
                sda.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Erro na Conexão");
                return dt;
            }
            finally
            {
                con.Close();
                sda.Dispose();
                con.Dispose();
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
                string connectionString = "Data Source=" + textBox1.Text + ";Initial Catalog=" + textBox2.Text + ";User Id=" + textBox3.Text + ";Password=" + textBox4.Text;
                SqlConnection sqlConn = new SqlConnection(connectionString);

                string consulta = "select * from Leitura";

                SqlCommand cmd = new SqlCommand(consulta);
                cmd.CommandType = CommandType.Text;

                DataTable dt = GetDados(cmd);

                dataGridView1.DataSource = dt;
                dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }
    }
}
