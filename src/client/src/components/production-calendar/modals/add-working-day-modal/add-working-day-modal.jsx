import React, { useState, useMemo } from 'react';
import { Formik, Form } from 'formik';

import {
  Button,
  ModalWindow,
  CustomFormikSelect,
  CustomFormikTextInput,
  CustomFormikField,
} from 'components/shared';
import { useCalendarStore } from 'store/calendar';

import styles from '../modal-style.module.scss';
import { createValidationSchema } from './validation-schema';

export const AddWorkingDayModal = ({
  isOpen,
  toggleModal,
  onWorkingDaySubmit,
}) => {
  const { calendar } = useCalendarStore();

  const validationSchema = createValidationSchema(calendar?.year);

  const [modalContent, setModalContent] = useState(null);

  // Memoize working shift options to avoid recalculating on every render
  const workingShiftOptions = useMemo(
    () =>
      calendar?.mainWorkingShifts.map(shift => ({
        value: shift.id,
        label: `Смена ${shift.number}`,
      })),
    [calendar]
  );

  const initialFormValues = {
    workingShiftId: modalContent?.shiftId ?? '',
    calendarId: calendar?.id ?? null,
    workingDay:
      modalContent?.workingDay ?? new Date().toISOString().split('T')[0],
  };

  const handleFormSubmit = async (values, { setSubmitting }) => {
    try {
      onWorkingDaySubmit(values);
      toggleModal(false);
    } catch (error) {
      console.error('Error submitting form:', error);
    }

    setSubmitting(false);
  };

  return (
    <ModalWindow
      isOpen={isOpen}
      headerText="Добавить рабочий день"
      setIsOpen={state => {
        toggleModal(state);
        setModalContent(null);
      }}
      wrapperStyles={{ width: 420 }}>
      <Formik
        initialValues={initialFormValues}
        enableReinitialize
        onSubmit={handleFormSubmit}
        validationSchema={validationSchema}>
        {({ isSubmitting, isValid }) => (
          <Form>
            <div className={styles.row}>
              <CustomFormikField name="workingDay">
                <CustomFormikTextInput
                  width="200"
                  style={{ height: 40, padding: '0 20px 0 30px', width: 380 }}
                  placeholder="Дата рабочего дня"
                  type="date"
                />
              </CustomFormikField>
            </div>

            <div className={styles.row}>
              <CustomFormikField name="workingShiftId">
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
