using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ProductController : CommonProductController
{
    public ProductController(IProductService productService) : base(productService, ProductType.Product)
    {
    }
}