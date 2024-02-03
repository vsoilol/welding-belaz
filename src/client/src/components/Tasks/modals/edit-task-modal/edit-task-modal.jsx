import React from 'react';
import { Formik } from 'formik';

import { useTaskStore } from 'store/task';

import {
  Button,
  ModalWindow,
  CustomFormikTextInput,
  CustomFormikField,
  CustomFormikCheckbox,
} from 'components/shared';
import { createValidationSchema } from './validation-schema';
import { weldingTaskStatus, weldingTaskStatusText } from 'core/constants';
import {
  convertFromDDMMYYYYToInputFormat,
  convertFromDDMMYYYYToDateObject,
  convertInputDateToDDMMYYYY,
} from 'core/helpers';

import styles from 'components/Tasks/styles.module.scss';

export const EditTaskModal = ({ isOpen, toggleModal }) => {
  const { selectedTask, editTask } = useTaskStore();

  const initialValues = {
    date: convertFromDDMMYYYYToInputFormat(selectedTask.weldingDate),
    status: [selectedTask.status],
  };

  const validationSchema = createValidationSchema(
    convertFromDDMMYYYYToDateObject(selectedTask.weldingDate)
  );

  const handleFormSubmit = values => {
    const { status } = values;

    const data = convertInputDateToDDMMYYYY(values.date);

    editTask(selectedTask.id, data, status[0]);
    toggleModal(false);
  };

  return (
    <ModalWindow
      isOpen={isOpen}
      headerText="Редактировать"
      setIsOpen={state => {
        toggleModal(false);
      }}
      wrapperStyles={{ width: 420 }}>
      <Formik
        initialValues={initialValues}
        enableReinitialize
        validationSchema={validationSchema}
        onSubmit={handleFormSubmit}>
        {({ handleSubmit, isValid, dirty }) => (
          <form onSubmit={handleSubmit}>
            <div>
              <p style={{ padding: '15px 20px 0 30px' }}>
                Изменение даты задания{' '}
              </p>
              <div className={styles.row}>
                <CustomFormikField name="date">
                  <CustomFormikTextInput
                    width="200"
                    style={{ height: 40, padding: '0 20px 0 30px', width: 380 }}
                    placeholder="Дата задания"
                    type="date"
                  />
                </CustomFormikField>
              </div>

              <p style={{ padding: '15px 20px 0 30px' }}>
                Изменение статус задания{' '}
              </p>
              <div className={styles.rowCheck}>
                <div className={styles.rowInputCheckbox}>
                  <CustomFormikCheckbox
                    name="status"
                    value={weldingTaskStatus.notStarted}
                    exclusive={true}
                  />
                  <span className={styles.NotStarted}>
                    {weldingTaskStatusText[weldingTaskStatus.notStarted]}
                  </span>
                </div>
                <div className={styles.rowInputCheckbox}>
                  <CustomFormikCheckbox
                    name="status"
                    value={weldingTaskStatus.executionAccepted}
                    exclusive={true}
                  />
                  <span className={styles.InProcess}>
                    {' '}
                    {weldingTaskStatusText[weldingTaskStatus.executionAccepted]}
                  </span>
                </div>
                <div className={styles.rowInputCheckbox}>
                  <CustomFormikCheckbox
                    name="status"
                    value={weldingTaskStatus.completed}
                    exclusive={true}
                  />
                  <span className={styles.Done}>
                    {weldingTaskStatusText[weldingTaskStatus.completed]}
                  </span>
                </div>
              </div>

              <div className={styles.row}>
                <Button disabled={!(isValid && dirty)} type="submit">
                  Изменить
                </Button>
              </div>
            </div>
          </form>
        )}
      </Formik>
    </ModalWindow>
  );
};
