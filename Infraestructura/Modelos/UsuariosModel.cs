using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infraestructura.Modelos
{
    public class UsuariosModel
    {
        public int Id_Usuario { get; set; }
        public int Id_Persona { get; set; }
        public string Nombre_Usuario { get; set; }
        public string Contraseña { get; set; }
        public string Nivel { get; set; }
        public string Estado { get; set; }



    }
}