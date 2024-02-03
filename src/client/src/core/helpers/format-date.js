export function convertFromDDMMYYYYToInputFormat(dateStr) {
  const parts = dateStr.split('.');
  return `${parts[2]}-${parts[1]}-${parts[0]}`; // Reorder to yyyy-mm-dd
}

export function convertFromDDMMYYYYToDateObject(dateStr) {
  const parts = dateStr.split('.');
  // Note: months are 0-based in JavaScript Date
  const year = parseInt(parts[2], 10);
  const month = parseInt(parts[1], 10) - 1; // Adjust for 0-based indexing
  const day = parseInt(parts[0], 10);

  return new Date(year, month, day);
}

export function convertInputDateToDDMMYYYY(inputDate) {
  // Split the input date string by '-'
  const parts = inputDate.split('-');
  // Reverse the array to get the date in DD.MM.YYYY format and join with '.'
  return parts.reverse().join('.').replace(/-/g, '.');
}
