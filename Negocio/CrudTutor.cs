using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Ejercicio0_MariaPablo.Datos;

namespace Ejercicio0_MariaPablo.Negocio
{
    class CrudTutor
    {
        //Instanciar un variable para el acceso a los datos
        public static ColegioModelContainer db = new ColegioModelContainer();

        //Los metodos de acceso a datos
        //CRUD

        //Create
        public static int Crear(Tutor T)
        {
            //Agrgamos el nuevo objeton tutor 
            //a la lista de Tutores
            db.Tutores.Add(T);
            //Procedemos a guardar los cambios en la base de datos
            return db.SaveChanges();
        }

        //Read
        public static List<Tutor> Listar()
        {
            return db.Tutores.ToList();
        }

        //Listar por nombre
        public static List<Tutor> ListarPorNombre(string Valor)
        {
            //FIltramos en la lista tutore
            return db.Tutores.Where(x=>x.NombreCompleto.StartsWith(Valor)).ToList();
        }
        //Listar tutores que tengan 2 estudiantes
        public static List<Tutor> ListarPorCantidad()
        {
            //FIltramos en la lista tutore
            return db.Tutores.Where(x => x.Estudiantes.Count >1).ToList();
        }

        //Listar tutores usan Gmail
        public static List<Tutor> ListarPorCorreo()
        {
            //FIltramos en la lista tutore
            return db.Tutores.Where(x => x.Email.Contains("@gmail.com")).ToList();
        }

    }
}
