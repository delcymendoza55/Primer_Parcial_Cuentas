using Microsoft.AspNetCore.Mvc;
using System.Runtime.CompilerServices;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.IdentityModel.Tokens;
using System.Security.Cryptography;
using System.Text;
using System.Text.Unicode;
using System.Security.Claims;
using System.Runtime.InteropServices;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Segunda_Parcial_APIS_CuentasBD.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Parcial_3_AutenticacionController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public Parcial_3_AutenticacionController(IConfiguration configuration )
        {
            _configuration= configuration;
        }

        // POST api/<Parcial_3_AutenticacionController>
        [HttpPost("login")]
        public IActionResult Post([FromBody] LoginModel login)
        {
            var userIsValid = validUser(login);
            if (!userIsValid)
            {
                return Unauthorized();
            }
            var token = GenerateJWT(login.Usuario);
            return Ok(token);
        }

        private object GenerateJWT(string usuario)
        {
           var securityKey = new SymmetricSecurityKey(System.Text.Encoding, UTF8.GetBytes(_configuration["Jwt:key"]));
           var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

           var claims = new[]
           {
                new Claim(JwtRegisteredClaimNames.Sub, usuario);
            new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString());

            var token = JwtSecurityToken(
                issuer: _configuration["Jwt:Issuer"],
                audience: _configuration["Jwt:Audience"],
                claims: claims,
                expires:DateTime.Now.AddSeconds(320),
                signingCredentials: credentials
            );
            return JwtSecurityTokenHandler().WriteToken(token);



        }
        private bool validUser(LoginModel login)
        {
            return login.Usuario == "admin" && login.Contraseña == "12345";

        }

    }
        public class LoginModel
        {
            public string Usuario { get; set; }
            public string Contraseña { get; set; }
        }
}
