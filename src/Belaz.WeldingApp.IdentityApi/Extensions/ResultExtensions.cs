using LanguageExt.Common;

namespace Belaz.WeldingApp.IdentityApi.Extensions;

public static class ResultExtensions
{
    public static TResult? GetDataOrNullFromResult<TResult>(this Result<TResult> result) where TResult : class
    {
        var data = result.Match<TResult>(
            obj => obj,
            _ => null
        );

        return data;
    }
}
