using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Extensions;

public static class ValidationExtensions
{
    public static Task<Result<TData>> ToDataResult<TData>(this Result<Unit> result,
        Func<Task<TData>> doAfterValidate)
    {
        return result.Match<Task<Result<TData>>>(async obj =>
            {
                var data = await doAfterValidate();
                return data;
            },
            exception => Task.FromResult(new Result<TData>(exception)));
    }
}