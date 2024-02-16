export function convertStringToInt(str) {
  const num = parseInt(str, 10); // Attempt to convert to an integer

  // Validate the conversion by checking if the result is an integer
  if (Number.isInteger(num) && Number(str) === num) {
    return num;
  } else {
    return null; // or any indication that the conversion failed
  }
}

export function convertStringToValue(str) {
  if (str === 'true') {
    return true;
  } else if (str === 'false') {
    return false;
  } else if (str === 'null') {
    return null;
  } else {
    return str; // Return the original string if it does not match
  }
}
