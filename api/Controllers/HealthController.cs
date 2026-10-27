using Microsoft.AspNetCore.Mvc;

namespace Pushly.Api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class HealthController : ControllerBase
{
    // Mobil uygulama sunucuya ulaşabiliyor mu diye bakar.
    [HttpGet]
    public IActionResult Get() => Ok(new { status = "ok", time = DateTime.UtcNow });
}
