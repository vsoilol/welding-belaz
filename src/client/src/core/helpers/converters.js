export function convertStringToInt(str) {
  const num = parseInt(str, 10); // Attempt to convert to an integer

  // Validate the conversion by checking if the result is an integer
  if (Number.isInteger(num) && Number(str) === num) {
    return num;
  } else {
    return null; // or any indication that the conversion failed
  }
}
