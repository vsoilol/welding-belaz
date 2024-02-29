export function isNumber(str) {
  return !isNaN(+str);
}

export function isNorNullAndUndefined(value) {
  return value !== null && value !== undefined;
}
