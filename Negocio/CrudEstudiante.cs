using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Ejercicio0_MariaPablo.Datos;

namespace Ejercicio0_MariaPablo.Negocio
{
    class CrudEstudiante
    {
        //Instanciar un variable para el acceso a los datos
        public static ColegioModelContainer db = new ColegioModelContainer();

        //Create
        public static int Crear(Estudiante E)
        {
            db.Estudiantes.Add(E);
            return db.SaveChanges();
        }

        public static List<Estudiante> BuscarPorNombreTutor(string Valor)
        {
            return db.Estudiantes.Where(x => x.Tutor.NombreCompleto.StartsWith(Valor)).ToList();
        }
        public static List<Estudiante> PorNombreEstudiante(string Valor)
        {
            return db.Estudiantes.Where(x => x.Nombre.StartsWith(Valor)).ToList();
        }
        public static Estudiante PorCarnet(string Carnet)
        {
            return db.Estudiantes.Where(x => x.Carnet== Carnet).FirstOrDefault();
        }

        public static List<Estudiante> OrdenApellido()
        {
            return db.Estudiantes.OrderBy(x => x.Apellido).ToList();
        }
        public static List<Estudiante> OrdenApellidoDescendente()
        {
            return db.Estudiantes.OrderByDescending(x => x.Apellido).ToList();
        }

    }
}
