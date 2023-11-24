using Microsoft.AspNetCore.Mvc;
using Servicios.ContactService;
using Infraestructura.Modelos;


namespace Segunda_Parcial_APIS_CuentasBD.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UsuariosController : ControllerBase
    {
        private const string connectionString = "Host=localhost;User Id=postgres;Password=1234;Database=Cuentas_Primer_Parcial;";
        private UsuariosService servicios;

        public UsuariosController()
        {
            servicios = new UsuariosService(connectionString);
        }

        [HttpGet("por-ruta/{id}")]
        public IActionResult ObtenerUsuarioAccion([FromRoute] int id)
        {
            var personas = servicios.obtenerUsuario(id);
            return Ok(personas);
        }

        [HttpGet("por-parametro")]
        public IActionResult ObtenerUsuarioAccion2([FromQuery] int id)
        {
            var usuario = servicios.obtenerUsuario(id);
            return Ok(usuario);
        }

        [HttpPost]
        public IActionResult InsertarUsuarioAccion([FromBody] Infraestructura.Modelos.UsuariosModel usuarios)
        {
            servicios.insertarUsuario(usuarios);
            return Created("Se creo con exito!!", usuarios);
        }

        [HttpPut]
        public IActionResult ModificarUsuarioAccion([FromBody] Infraestructura.Modelos.UsuariosModel usuarios)
        {
            servicios.modificarUsuario(usuarios);
            return Ok("Se actualizo con exito!!");
        }
        [HttpDelete("{id}")]
        public IActionResult EliminarUsuarioAccion([FromRoute] int id_Usuario)
        {
            try
            {
                servicios.eliminarUsuario(id_Usuario);
                return NoContent();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error al eliminar la ciudad: {ex.Message}");
            }
        }
    }
}