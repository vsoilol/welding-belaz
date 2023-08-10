using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;

public interface IUploadProductAccountFileService
{
    Task<Result<Unit>> UploadProductAccountDataDbfAsync(UploadProductAccountDataRequest request);
}