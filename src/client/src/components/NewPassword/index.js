import Button from "components/shared/Button";
import Field from "components/shared/Field";
import Text from "components/shared/Text";
import TabletContext from "context/TabletContext";
import { Formik } from "formik";
import React, { useContext } from "react";
import { useHistory } from "react-router-dom";
import { resetPasswordValidation } from "validation/auth.validation";
import styles from "./index.module.css";

import api from "services/api";


const initialValues = {
  oldpassword: "",
  password: "",
  confirmPassword: "",
};

const NewPassword = ({ resetPassword, isRequesting }) => {
  const isMobile = useContext(TabletContext);
  const history = useHistory();


  async function ChangePassword(params) {
    try {
      const response = await api.post(`auth/change-password`,{
        "oldPassword": params.oldpassword,
        "newPassword": params.password,
        "confirmNewPassword": params.confirmPassword
      }); 
    } catch (error) {
      console.log(error);
    }
    finally {
      history.push("/login")
    }
  }


  return (
    <div className={styles.page}>
      <Text tag="p" type="p1">
        Задайте новый пароль
      </Text>

      <Text tag="p" type="p2" className={styles.text}>
        Пожалуйста, введить новй пароль для вашего аккаунта.
      </Text>

      <Text tag="p" type="p3" className={styles.paragraph}>
        Пароль должен содежрать как минимум 6 символов. {!isMobile && <br />}Мы
        рекомендуем включить в пароль как минимум одну заглавную букву, одну
        цифру и спецсимвол (!@#$%^&amp;*()_+`~).
      </Text>
      <Formik
        initialValues={initialValues}
        validationSchema={resetPasswordValidation}
        onSubmit={(values) => {
          /* resetPassword(values); */
          ChangePassword(values)
        }}
      >
        {({
          handleSubmit,
          handleChange,
          values,
          errors,
          touched,
          handleBlur,
          isValid,
          dirty,
        }) => (
          <form className={styles.form} onSubmit={handleSubmit}>

            <Field
              type="password"
              width="300px"
              onChange={handleChange}
              value={values.oldpassword}
              invalid={touched.oldpassword && Boolean(errors.oldpassword)}
              error={errors.oldpassword}
              name="oldpassword"
              placeholder="старый пароль"
              onBlur={handleBlur}
              withStrength
              disabled={isRequesting}
            />

            <Field
              type="password"
              width="300px"
              onChange={handleChange}
              value={values.password}
              invalid={touched.password && Boolean(errors.password)}
              error={errors.password}
              name="password"
              placeholder="новый пароль"
              onBlur={handleBlur}
              withStrength
              disabled={isRequesting}
            />

            <Field
              type="password"
              width="300px"
              onChange={handleChange}
              value={values.confirmPassword}
              invalid={
                touched.confirmPassword && Boolean(errors.confirmPassword)
              }
              error={errors.confirmPassword}
              name="confirmPassword"
              placeholder="повторите пароль"
              onBlur={handleBlur}
              disabled={isRequesting}
            />

            <Button
              onClick={{}/* () => history.push("/login") */}
              isRequesting={isRequesting}
              disabled={isRequesting || !(isValid && dirty)}
              width="255px"
              type="submit"
            >
              Сохранить
            </Button>
          </form>
        )}
      </Formik>



      
    </div>
  );
};

export default NewPassword;
