/**
 * Flatten a multidimensional object
 *
 * For example:
 *   flattenObject({ a: 1, b: { c: 2 } })
 * Returns:
 *   { a: 1, c: 2}
 */
export const flattenObject = ((o) => {
  return o !== Object(o) || Array.isArray(o)
    ? {}
    : Object.assign(
        {},
        ...(function leaves(o) {
          return [].concat.apply(
            [],
            Object.entries(o)?.map(([k, v]) => {
              return !v ||
                typeof v !== "object" ||
                !Object.keys(v).some((key) => v.hasOwnProperty(key)) ||
                Array.isArray(v)
                ? { [k]: v }
                : leaves(v);
            })
          );
        })(o)
      );
});
