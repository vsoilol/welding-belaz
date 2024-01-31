import React, { useState } from 'react';
import { Formik, Form } from 'formik';

import {
  Button,
  ModalWindow,
  CustomFormikTextInput,
  CustomFormikField,
} from 'components/shared';
import { useCalendarStore } from 'store/calendar';

import styles from '../modal-style.module.scss';
import { createValidationSchema } from './validation-schema';

export const AddWeekendModal = ({
  isOpen,
  toggleModal,
  onWeekendDaySubmit,
}) => {
  const { calendarYear } = useCalendarStore();
  const [modalContent, setModalContent] = useState(null);

  const initialFormValues = {
    dayDate: modalContent?.workingDay ?? new Date().toISOString().split('T')[0],
  };

  const validationSchema = createValidationSchema(calendarYear);

  const handleFormSubmit = async (values, { setSubmitting }) => {
    try {
      onWeekendDaySubmit(values);
      toggleModal(false);
    } catch (error) {
      console.error('Error submitting form:', error);
    }

    setSubmitting(false);
  };

  return (
    <ModalWindow
      isOpen={isOpen}
      headerText="Добавить выходной день"
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
              <CustomFormikField name="dayDate">
                <CustomFormikTextInput
                  width="200"
                  style={{ height: 40, padding: '0 20px 0 30px', width: 380 }}
                  placeholder="Дата дня"
                  type="date"
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
