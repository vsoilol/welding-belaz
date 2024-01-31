export const deleteEmpty = o => {
  let ignores = [null, undefined, ''],
    isNonEmpty = d =>
      !ignores.includes(d) && (typeof d !== 'object' || Object.keys(d).length);
  return JSON.parse(JSON.stringify(o), function (k, v) {
    if (isNonEmpty(v)) return v;
  });
};
