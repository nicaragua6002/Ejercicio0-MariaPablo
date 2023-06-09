using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Ejercicio0_MariaPablo.Datos;
using Ejercicio0_MariaPablo.Negocio;

namespace Ejercicio0_MariaPablo.Presentacion
{
    public partial class CrearTutor : Form
    {
        public CrearTutor()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //Opcion 1
            //Crear el objeto Tutor
            Tutor T = new Tutor();

            //Completamos los parametros
            T.NombreCompleto = txtnombre.Text;
            T.Telf = txttelf.Text;
            T.Direccion = txtdir.Text;
            T.Email = txtemail.Text;

            //Procedemos a agregar el nuevo tutor

            if(CrudTutor.Crear(T)>0)
            {
                MessageBox.Show("Se alamceno con exito");
            }
            else
            {
                MessageBox.Show("No de guardo");
            }

        }
    }
}
