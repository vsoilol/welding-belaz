import React, { useState, useEffect, useRef } from "react";
import "../change-password/styles.css";
import Button from "components/shared/Button";
import api from "services/api";
import ModalWindow from "components/shared/ModalWindow";
import { Formik } from "formik";
import Input from "components/shared/Input";


export const ChangePassword = (tool) => {

  const [isOpen, setisOpen] = useState(true);

  function ChangePassw(values) {
    if (values.newPass1 == values.newPass2) {
      api.post(`/auth/change-password`, {
        "oldPassword": values.oldPass,
        "newPassword": values.newPass,
        "confirmNewPassword": values.confirmNewPassword,
      })
        .then((response) => {
          setisOpen(false)
          localStorage.setItem("isFirstLogin","false")

        })
        .catch((error) => { });
    }
  }
  const initialValuesPass = {
    oldPass: "",
    newPass: "",
    confirmNewPassword: "",

  };

  return (
    <div className="Modal">
      <ModalWindow
        isOpen={isOpen}
        headerText="Поменять пароль"
        setIsOpen={(state) => {
          /* setisOpen(false) */
        }}
        wrapperStyles={{ width: 420 }}
      >
        <Formik
          enableReinitialize
          initialValues={initialValuesPass}
          onSubmit={(variables) => {
            /* setisOpen(false) */
            /* localStorage.setItem("isFirstLogin","false") */
          }}
        >
          {({
            handleSubmit,
            handleChange,
            values,
            setFieldValue,
            handleBlur,
          }) => (
            <form onSubmit={handleSubmit}>
              <div>

                <div className="row">
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{ height: 40, width: 562 }}
                    value={values.oldPass}
                    name="oldPass"
                    placeholder="Старый пароль"
                    onBlur={handleBlur}
                    autocomplete="off"
                  />
                </div>
                <div className="row">
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{ height: 40, width: 562 }}
                    value={values.newPass}
                    name="newPass"
                    placeholder="Новый пароль"
                    onBlur={handleBlur}
                    autocomplete="off"
                  />
                </div>
                <div className="row">
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{ height: 40, width: 562 }}
                    value={values.confirmNewPassword}
                    name="confirmNewPassword"
                    placeholder="Новый пароль"
                    onBlur={handleBlur}
                    autocomplete="off"
                  />
                </div>  
                <div className="row">
                  <Button onClick={() => { ChangePassw(values) }} >
                    Сохранить
                  </Button>
                </div> 
              </div> 
            </form>
          )}
        </Formik>
      </ModalWindow>
    </div>
  );
};