import React, { useState, useMemo } from "react";
import { Formik, useFormik, Form } from "formik";

import {
  Button,
  Input,
  ModalWindow,
  Select,
  CustomFormikSelect,
  CustomFormikTextInput,
  CustomFormikField,
} from "components/shared";

import styles from "../modal-style.module.scss";
import { validationSchema } from "./validation-schema";

export const AddWorkingDayModal = ({
  isOpen,
  toggleModal,
  calendarId,
  workingShifts,
  onWorkingDaySubmit,
}) => {
  const [modalContent, setModalContent] = useState(null);
  const [selectedShift, setSelectedShift] = useState(null);

  // Memoize working shift options to avoid recalculating on every render
  const workingShiftOptions = useMemo(
    () =>
      workingShifts.map((shift) => ({
        value: shift.id,
        label: `Смена ${shift.number}`,
      })),
    [workingShifts]
  );

  const initialFormValues = {
    shiftId: modalContent?.shiftId ?? "",
    calendarId: calendarId ?? null,
    workingDay:
      modalContent?.workingDay ?? new Date().toISOString().split("T")[0],
  };

  const handleSubmit = (values) => {
    toggleModal(false);
    setModalContent(null);
    onWorkingDaySubmit({ ...values, shiftId: selectedShift });
  };

  const handleFormSubmit = async (values, { setSubmitting }) => {
    try {
      // Make your request here, e.g., await yourApiService.submitForm(values);
      console.log("Form submitted with values:", values);
      toggleModal(false);
      // Handle success response
    } catch (error) {
      // Handle any errors
      console.error("Error submitting form:", error);
    }

    setSubmitting(false); // Set submitting to false after the operation
  };

  const onSubmit = async (values, actions) => {
    // await new Promise((resolve) => setTimeout(resolve, 1000));
    // actions.resetForm();
    // console.log(values);
    // console.log(actions);
    const result = await actions.validateForm();
    console.log(result);
  };

  return (
    <ModalWindow
      isOpen={isOpen}
      headerText="Добавить рабочий день"
      setIsOpen={(state) => {
        toggleModal(state);
        setModalContent(null);
      }}
      wrapperStyles={{ width: 420 }}
    >
      <Formik
        initialValues={initialFormValues}
        enableReinitialize
        onSubmit={handleFormSubmit}
        validationSchema={validationSchema}
      >
        {({ isSubmitting, isValid }) => (
          <Form>
            <div className={styles.row}>
              <CustomFormikField name="workingDay">
                <CustomFormikTextInput
                  width="200"
                  style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
                  placeholder="Дата рабочего дня"
                  type="date"
                />
              </CustomFormikField>
            </div>

            <div className={styles.row}>
              <CustomFormikField name="shiftId">
                <CustomFormikSelect
                  width="380px"
                  placeholder="Смена"
                  options={workingShiftOptions}
                />
              </CustomFormikField>
            </div>
            <div className={styles.row}>
              <Button disabled={!isValid || isSubmitting} type="submit">
                Добавить
              </Button>
            </div>
          </Form>
        )}
      </Formik>
    </ModalWindow>
  );
};
