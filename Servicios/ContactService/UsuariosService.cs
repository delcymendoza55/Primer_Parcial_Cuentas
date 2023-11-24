using Infraestructura.Conexiones;
using Infraestructura.Datos;
using Infraestructura.Modelos;

namespace Servicios.ContactService
{
    public class UsuariosService
    {
        UsuariosDatos usuariosDatos;
        public UsuariosService(string cadenaConexion)
        {
            usuariosDatos = new UsuariosDatos(cadenaConexion);
        }
        public void insertarUsuario(UsuariosModel usuarios)
        {
            usuariosDatos.insertarUsuario(usuarios);
        }
        public UsuariosModel obtenerUsuario(int id)
        {
            return usuariosDatos.obtenerUsuarioPorId(id);
        }
        public void modificarUsuario(UsuariosModel usuarios)
        {
            validarDatos(usuarios);
            usuariosDatos.modificarUsuario(usuarios);
        }
        public void eliminarPersonas(UsuariosModel usuarios)
        {
            validarDatos(usuarios);
            usuariosDatos.eliminarUsuario(usuarios);
        }
        private void validarDatos(UsuariosModel usuarios)
        {
            if (usuarios.Nombre_Usuario.Trim().Length < 2)
            {
                throw new Exception("La descripción no debe estar nulo");
            }
        }

        public void eliminarUsuario(int id_usuario)
        {
            throw new NotImplementedException();
        }
    }
}
