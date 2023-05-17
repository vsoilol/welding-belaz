export function calculateStrength(password) {
  if (password) {
    if (password.length === 0) {
      return -1;
    }

    const capLetterRegex = /[A-Z]/;
    const numberRegex = /[0-9]/;
    const specialCharacterRegex = /[!@#$%^&*()_+`~]/;

    const isCapLetter = password.match(capLetterRegex) !== null;
    const isNumber = password.match(numberRegex) !== null;
    const isSpecialCharacter = password.match(specialCharacterRegex) !== null;

    let strength = 0;

    if (isCapLetter) strength += 1;
    if (isNumber) strength += 1;
    if (isSpecialCharacter) strength += 1;

    return strength;
  }
  return -1;
}
