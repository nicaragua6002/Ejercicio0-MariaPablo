using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Ejercicio0_MariaPablo.Negocio;
using Ejercicio0_MariaPablo.Datos;

namespace Ejercicio0_MariaPablo.Presentacion
{
    public partial class ListaTutores : Form
    {
        public ListaTutores()
        {
            InitializeComponent();
        }

        private void ListaTutores_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = CrudTutor.Listar();
            dataGridView2.DataSource = CrudTutor.ListarPorCantidad();
            dataGridView4.DataSource = CrudTutor.ListarPorCorreo();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            dataGridView3.DataSource = CrudTutor.ListarPorNombre(textBox1.Text);
        }
    }
}
