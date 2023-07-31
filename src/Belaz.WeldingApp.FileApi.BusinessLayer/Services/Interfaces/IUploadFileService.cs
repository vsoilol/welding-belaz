using LanguageExt;
using LanguageExt.Common;
using Microsoft.AspNetCore.Http;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;

public interface IUploadFileService
{
    Task<Result<Unit>> UploadProductAccountDataAsync(IFormFile formFile);

    Task<Result<Unit>> UploadUsersDataAsync(IFormFile formFile);
}