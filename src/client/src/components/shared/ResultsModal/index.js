import React from "react";
import Button from "components/shared/Button";
import ModalWindow from "components/shared/ModalWindow";
import Input from "components/shared/Input";
import styles from "./styles.module.scss";
import api from "services/api";
import errorActions from "store/error/actions";
import { Formik } from "formik";
import { useDispatch } from "react-redux";

const {
  Creators: { setError },
} = errorActions;

export const ResultsModal = ({ isOpen, setIsOpen, type, activeId }) => {
  const requiredKeys = ["startDate", "endDate"];
  const dispatch = useDispatch();

  const generatePPdf = (values) => {
    type === "EXECUTOR"
      ? api
          .get(
            `/reports/executorReport/${activeId}?executorId=${activeId}&startDate=${values.startDate}&endDate=${values.endDate}`,
            {
              responseType: "arraybuffer",
              dataType: "blob",
            }
          )
          .then((response) => {
            const file = new Blob([response["data"]], {
              type: "application/pdf",
            });

            const fileURL = URL.createObjectURL(file);
            window.open(fileURL);
          })
          .catch((error) => dispatch(setError(error.response.data)))
      : api
          .get(
            `/reports/machineReport/${activeId}?machineId=${activeId}&startDate=${values.startDate}&endDate=${values.endDate}`,
            {
              responseType: "arraybuffer",
              dataType: "blob",
            }
          )
          .then((response) => {
            const file = new Blob([response["data"]], {
              type: "application/pdf",
            });

            const fileURL = URL.createObjectURL(file);
            window.open(fileURL);
          })
          .catch((error) => dispatch(setError(error.response.data)));
  };

  return (
    <ModalWindow
      isOpen={isOpen}
      headerText={
        type === "EXECUTOR" ? "Отчет пользователя" : "Отчет по оборудованию"
      }
      setIsOpen={(state) => {
        setIsOpen(state);
      }}
      wrapperStyles={{ width: 400 }}
    >
      <Formik
        initialValues={{ startDate: "", endDate: "" }}
        enableReinitialize
        onSubmit={(variables) => {
          generatePPdf(variables);
          setIsOpen(false);
        }}
      >
        {({ handleSubmit, handleChange, values, handleBlur }) => (
          <form className={styles.form} onSubmit={handleSubmit}>
            <div className={styles.row}>
              <Input
                onChange={(e) => {
                  handleChange(e);
                }}
                style={{ height: 40, padding: "0 20px 0 30px" }}
                value={values.startDate}
                name="startDate"
                type="text"
                onFocus={(e) => {
                  e.currentTarget.type = "date";
                }}
                placeholder="Начальная дата"
                onBlur={handleBlur}
                autoComplete="off"
              />
              <Input
                onChange={(e) => {
                  handleChange(e);
                }}
                style={{ height: 40, padding: "0 20px 0 30px" }}
                value={values.endDate}
                name="endDate"
                type="text"
                onFocus={(e) => {
                  e.currentTarget.type = "date";
                }}
                placeholder="Конечная дата"
                autoComplete="off"
                onBlur={handleBlur}
              />
            </div>
            <div className={styles.row}>
              <Button
                disabled={requiredKeys.some((key) => !values[key])}
                type="submit"
              >
                Сгенерировать
              </Button>
            </div>
          </form>
        )}
      </Formik>
    </ModalWindow>
  );
};
