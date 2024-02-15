using System.Linq.Expressions;
using System.Reflection;

namespace Belaz.WeldingApp.WeldingApi.DataLayer;

public static class QueryableExtensions
{
    public static IQueryable<T> OrderByDynamic<T, TKey>(this IQueryable<T> source,
        Expression<Func<T, TKey>> keySelector, bool ascending = true)
    {
        return ascending ? source.OrderBy(keySelector) : source.OrderByDescending(keySelector);
    }

    public static IQueryable<T> OrderByNestedPropertyAndFilterNonNull<T>(this IQueryable<T> query, string propertyPath,
        bool ascending = true)
    {
        var properties = propertyPath.Split('.');
        var parameter = Expression.Parameter(typeof(T), "entity");

        Expression propertyAccess = parameter;
        Expression nonNullExpression = null;

        // Build the expression to access the nested property and check for non-null along the path
        foreach (var propName in properties)
        {
            var property = propertyAccess.Type.GetProperty(propName,
                BindingFlags.Public | BindingFlags.Instance | BindingFlags.IgnoreCase);
            if (property == null)
            {
                throw new ArgumentException($"Property '{propName}' not found on type '{propertyAccess.Type.Name}'.");
            }

            // Check for non-null and build up a conditional check
            var nextPropertyAccess = Expression.MakeMemberAccess(propertyAccess, property);
            if (property.PropertyType.IsClass || IsNullableProperty(property.PropertyType))
            {
                var notNullCheck =
                    Expression.NotEqual(nextPropertyAccess, Expression.Constant(null, property.PropertyType));
                nonNullExpression = nonNullExpression == null
                    ? notNullCheck
                    : Expression.AndAlso(nonNullExpression, notNullCheck);
            }

            propertyAccess = nextPropertyAccess;
        }

        // Filter entities where any property in the path is null
        if (nonNullExpression != null)
        {
            var nonNullLambda = Expression.Lambda<Func<T, bool>>(nonNullExpression, parameter);
            query = query.Where(nonNullLambda);
        }

        // Apply dynamic ordering
        var delegateType = typeof(Func<,>).MakeGenericType(typeof(T), propertyAccess.Type);
        var lambda = Expression.Lambda(delegateType, propertyAccess, parameter);

        var orderMethodName = ascending ? "OrderBy" : "OrderByDescending";
        var orderMethod = typeof(Queryable).GetMethods().Single(
                method => method.Name == orderMethodName && method.IsGenericMethodDefinition &&
                          method.GetGenericArguments().Length == 2 &&
                          method.GetParameters().Length == 2)
            .MakeGenericMethod(typeof(T), propertyAccess.Type);

        query = query.Provider.CreateQuery<T>(Expression.Call(orderMethod, query.Expression, Expression.Quote(lambda)));

        return query;
    }

    private static bool IsNullableProperty(Type type)
    {
        return type.IsGenericType && type.GetGenericTypeDefinition() == typeof(Nullable<>);
    }
}