import React, { useState, useEffect, useContext } from "react";
import { Formik } from "formik";
import { loginValidation } from "validation/auth.validation";
import TabletContext from "context/TabletContext";
import Field from "components/shared/Field";
import Button from "components/shared/Button";
import styles from "./styles.module.scss";
import { useHistory } from "react-router-dom";

const initialValues = { email: "", password: "" };

const Main = ({ logIn, isRequesting, requestType, error }) => {
  const isTablet = useContext(TabletContext);
  const [showError, setShowError] = useState(false);
  const history = useHistory();
  const [indexForm, setindexForm] = useState(0);

  useEffect(() => {
    if (requestType === "LOGIN_FAILURE") {
      setShowError(true);
    }
  }, [requestType, error]);

  return (
    <div className={styles.loginPage}>
      <div className={styles.formWrapper}>
        <div className={styles.content}>
          <Formik
            initialValues={initialValues}
            onSubmit={(values) => {
              logIn(values);
              history.push("/");
            }}
            /* validationSchema={loginValidation} */
          >
            {({
              handleSubmit,
              handleChange,
              values,
              errors,
              touched,
              isValid,
              dirty,
              handleBlur,
            }) => {
              return (
                <form className={styles.form} onSubmit={handleSubmit}>
                  <Field
                    width={isTablet ? "300px" : "360px"}
                    onChange={(e) => {
                      setShowError(false);
                      handleChange(e);
                    }}
                    value={values.email}
                    invalid={
                      showError
                      /* ? true
                        : touched.email && Boolean(errors.email) */
                    }
                    /* error={showError ? error : errors.email} */
                    name="email"
                    placeholder="Введите email"
                    onBlur={handleBlur}
                    disabled={isRequesting}
                    type="text"
                  />

                  <Field
                    type="password"
                    width={isTablet ? "300px" : "360px"}
                    onChange={(e) => {
                      setShowError(false);
                      handleChange(e);
                    }}
                    value={values.password}
                    invalid={
                      showError
                        ? true
                        : touched.password && Boolean(errors.password)
                    }
                    error={showError ? error : errors.password}
                    name="password"
                    placeholder="Пароль"
                    onBlur={handleBlur}
                    disabled={isRequesting}
                  />

                  <Button
                    /*  disabled={!(isValid && dirty)   || isRequesting} */
                    disabled={!dirty}
                    isRequesting={isRequesting}
                    width={isTablet ? "275px" : "200px"}
                    className={styles.button}
                    type="submit"
                  >
                    Войти
                  </Button>
                </form>
              );
            }}
          </Formik>

          {/* <a className={styles.refChange} href="/new-password" >Изменить пароль</a>  */}
        </div>
      </div>
    </div>
  );
};

export default Main;
