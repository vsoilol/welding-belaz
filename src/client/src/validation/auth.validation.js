import { string, object, ref } from 'yup';

export function calculateStrength(password) {
  const capLetterRegex = /[A-Z]/;
  const numberRegex = /[0-9]/;
  const specialCharacterRegex = /[!@#$%^&*()_+`~]/;

  const isCapLetter = password.match(capLetterRegex) !== null;
  const isNumber = password.match(numberRegex) !== null;
  const isSpecialCharacter = password.match(specialCharacterRegex) !== null;

  if (password.length === 0) {
    return -1;
  }

  let strength = 0;

  if (isCapLetter) strength += 1;
  if (isNumber) strength += 1;
  if (isSpecialCharacter) strength += 1;

  return strength;
}

export const loginValidation = object().shape({
  email: string()
    .email('Проверьте email')
    .max(80, 'email не должен быть длиннее 80 символов')
    .required('Введите email')
    .lowercase(),
  password: string()
    .min(6, 'Пароль должен содержать как минимум 6 символов')
    .max(80, 'Пароль не должен быть длиннее 80 символов')
    .required('Введите пароль'),
});

export const requestResetValidation = object().shape({
  email: string()
    .email('Проверьте email')
    .max(80, 'email не должен быть длиннее 80 символов')
    .required('Введите email')
    .lowercase(),
});

export const resetPasswordValidation = object().shape({
  password: string()
    .min(6, 'Пароль должен содержать как минимум 6 символов')
    .max(80, 'Пароль не должен быть длиннее 80 символов')
    .test(
      'validate-strength',
      'Пароль должен быть как минимум средней силы',
      value => {
        const strength = calculateStrength(value);

        return strength >= 2;
      }
    )
    .test(
      'validate-forbidden',
      'Пароль содержить неподдерживаемые знаки',
      value => {
        const forbiddenCharacters = /[^(0-9)(a-z)(A-Z)(!@#$%^&*()_+`~)]/;
        const isForbiddenCharacter = value.match(forbiddenCharacters) !== null;

        return !isForbiddenCharacter;
      }
    )
    .required('Введите пароль'),
  confirmPassword: string()
    .required('Необходимо подтверждение пароля')
    .oneOf([ref('password'), null], 'Пароли должны совпадать'),
});
