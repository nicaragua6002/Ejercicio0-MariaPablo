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
    public partial class FrmCrearEstudiante : Form
    {
        public FrmCrearEstudiante()
        {
            InitializeComponent();
        }

        private void FrmCrearEstudiante_Load(object sender, EventArgs e)
        {
            //Mostramos la lista de tutores
            cbtutores.DataSource = CrudTutor.Listar();
            cbtutores.DisplayMember = "NombreCompleto";

        }

        private void button2_Click(object sender, EventArgs e)
        {
            //Crear un objeto de tipo Estudiante
            Estudiante E = new Estudiante();
            E.Nombre = txtnombre.Text;
            E.TutorId = ((Tutor)cbtutores.SelectedItem).Id;
            E.Apellido = txtapellido.Text;
            E.FechaNac = txtfecha.Value.ToString();
            E.Carnet = txtcarnet.Text;

            //Procedemos a agregar el nuevo tutor

            if (CrudEstudiante.Crear(E) > 0)
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
