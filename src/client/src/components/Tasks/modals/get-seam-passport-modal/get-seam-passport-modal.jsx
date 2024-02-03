import React from 'react';
import { Formik, Form } from 'formik';

import { useTaskStore } from 'store/task';

import {
  Button,
  ModalWindow,
  CustomFormikTextInput,
  CustomFormikField,
} from 'components/shared';
import { validationSchema } from './validation-schema';

import styles from 'components/Tasks/styles.module.scss';

export const GetSeamPassportModal = ({
  isFullPassport,
  isOpen,
  toggleModal,
}) => {
  const { selectedTaskId, getFullTaskPassport, getShortTaskPassport } =
    useTaskStore();

  const initialValues = {
    sequenceNumber: '',
  };

  const handleFormSubmit = values => {
    const { sequenceNumber } = values;
    console.log('Sequence Number', sequenceNumber);
    console.log('Task id', selectedTaskId);

    if (isFullPassport) {
      getFullTaskPassport(selectedTaskId, sequenceNumber);
    } else {
      getShortTaskPassport(selectedTaskId, sequenceNumber);
    }

    toggleModal(false);
  };

  return (
    <ModalWindow
      isOpen={isOpen}
      headerText="Получение паспорта"
      setIsOpen={() => {
        toggleModal(false);
      }}
      wrapperStyles={{ width: 420 }}>
      <Formik
        initialValues={initialValues}
        enableReinitialize
        validationSchema={validationSchema}
        onSubmit={handleFormSubmit}>
        {() => (
          <Form className={styles.columnFormPassport}>
            <div>
              <CustomFormikField
                style={{
                  width: '100%',
                }}
                name="sequenceNumber">
                <CustomFormikTextInput
                  style={{
                    height: 40,
                    padding: '0 20px 0 30px',
                    width: '100%',
                  }}
                  placeholder="Порядковый номер"
                  type="text"
                />
              </CustomFormikField>
            </div>

            <div>
              <Button width="100%" type="submit">
                Получить
              </Button>
            </div>
          </Form>
        )}
      </Formik>
    </ModalWindow>
  );
};
