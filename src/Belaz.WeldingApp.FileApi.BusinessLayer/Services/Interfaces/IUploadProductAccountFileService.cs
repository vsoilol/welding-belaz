using LanguageExt;
using LanguageExt.Common;
using Microsoft.AspNetCore.Http;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;

public interface IUploadProductAccountFileService
{
    Task<Result<Unit>> UploadProductAccountDataDbfAsync(IFormFile formFile);
}