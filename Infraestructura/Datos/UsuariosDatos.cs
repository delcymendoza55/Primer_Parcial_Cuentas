using Infraestructura.Conexiones;
using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infraestructura.Modelos;
using System.Data;

namespace Infraestructura.Datos
{
    public class UsuariosDatos
    {
        private ConexionDB conexion;
        public UsuariosDatos(string cadenaConexion)
        {
            conexion = new ConexionDB(cadenaConexion);
        }
        public void insertarUsuario(UsuariosModel usuarios)
        {
            var conn = conexion.GetConexion();
            var comando = new NpgsqlCommand("INSERT INTO usuarios(id_usuario,id_persona,nombre_usuario,contraseña,nivel,estado)" +
                "VALUES(@id_usuario,@id_persona,@nombre_usuario,@contraseña,@nivel,@estado)", conn);
            comando.Parameters.AddWithValue("id_usuario", usuarios.Id_Usuario);
            comando.Parameters.AddWithValue("id_persona", usuarios.Id_Persona);
            comando.Parameters.AddWithValue("nombre_usuario", usuarios.Nombre_Usuario);
            comando.Parameters.AddWithValue("contraseña", usuarios.Contraseña);
            comando.Parameters.AddWithValue("nivel", usuarios.Nivel);
            comando.Parameters.AddWithValue("estado", usuarios.Estado);
  
            comando.ExecuteNonQuery();
        }

        public UsuariosModel obtenerUsuarioPorId(int id)
        {
            var conn = conexion.GetConexion();
            var comando = new NpgsqlCommand($"Select * from usuarios where id_usuario = {id}", conn);
            using var reader = comando.ExecuteReader();
            if (reader.Read())
            {
                return new UsuariosModel
                {
                    Id_Persona = reader.GetInt32("id_usuario"),
                    Id_Usuario = reader.GetInt32("id_persona"),
                    Nombre_Usuario = reader.GetString("nombre_usuario"),
                    Contraseña = reader.GetString("contraseña"),
                    Nivel = reader.GetString("nivel"),
                    Estado = reader.GetString("estado"),
                    
                };
            }
            return null;
        }
        public void modificarUsuario(UsuariosModel usuarios)
        {
            var conn = conexion.GetConexion();
            var comando = new Npgsql.NpgsqlCommand($"UPDATE usuarios SET " +
                $"id_usuario = '{usuarios.Id_Usuario}', " +
                          $"id_persona = '{usuarios.Id_Persona}', " +
                          $"nombre_usuario = '{usuarios.Nombre_Usuario}', " +
                          $"contraseña= '{usuarios.Contraseña}', " +
                          $"nivel = '{usuarios.Nivel}', " +
                          $"estado = '{usuarios.Estado}', " +
                       $" WHERE id_usuario = {usuarios.Id_Usuario}", conn);

            comando.ExecuteNonQuery();
        }
        public void eliminarUsuario(UsuariosModel usuarios)
        {
            var conn = conexion.GetConexion();
            var comando = new Npgsql.NpgsqlCommand($"DELETE FROM usuarios WHERE" +
                $"id_usuario = '{usuarios.Id_Usuario}'", conn);

            comando.ExecuteNonQuery();
        }
    }

}
