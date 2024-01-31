import React, { useMemo } from 'react';
import { Formik, Form } from 'formik';
import {
  Button,
  CustomFormikTextInput,
  CustomFormikField,
  CustomFormikSelect,
} from 'components/shared';
import { useCalendarStore } from 'store/calendar';
import { validationSchema } from './validation-schema';
import styles from '../../../modal-style.module.scss';

export const UpdateWorkingShiftForm = ({ toggleModal }) => {
  const { mainWorkingShifts, updateWorkingShift } = useCalendarStore();

  // Memoize working shift options to avoid recalculating on every render
  const workingShiftOptions = useMemo(
    () =>
      mainWorkingShifts.map(shift => ({
        value: shift.id,
        label: `Смена ${shift.number}`,
      })),
    [mainWorkingShifts]
  );

  const initialFormValues = {
    number: 1,
    shiftStart: '',
    shiftEnd: '',
    breakStart: '',
    breakEnd: '',
    workingShiftId: '',
  };

  const handleFormSubmit = async (values, { setSubmitting }) => {
    try {
      const workingShift = {
        ...values,
        id: values.workingShiftId,
        dayId: null,
      };

      updateWorkingShift(workingShift);
      toggleModal(false);
    } catch (error) {
      console.error('Error submitting form:', error);
    }

    setSubmitting(false);
  };

  return (
    <Formik
      initialValues={initialFormValues}
      enableReinitialize
      onSubmit={handleFormSubmit}
      validationSchema={validationSchema}>
      {({ isSubmitting, isValid, setFieldValue }) => (
        <Form>
          <div className={styles.rowWithoutMargin}>
            <CustomFormikField name="workingShiftId">
              <CustomFormikSelect
                width="380px"
                placeholder="Смена"
                options={workingShiftOptions}
                onChange={val => {
                  const { value: workingShiftId } = val;
                  const selectedWorkingShift = mainWorkingShifts.find(
                    shift => shift.id === workingShiftId
                  );

                  setFieldValue('number', selectedWorkingShift.number);
                  setFieldValue('shiftStart', selectedWorkingShift.shiftStart);
                  setFieldValue('shiftEnd', selectedWorkingShift.shiftEnd);
                  setFieldValue('breakStart', selectedWorkingShift.breakStart);
                  setFieldValue('breakEnd', selectedWorkingShift.breakEnd);
                }}
              />
            </CustomFormikField>
          </div>

          <div className={styles.rowWithoutMargin}>
            <CustomFormikField name="number">
              <CustomFormikTextInput
                width="200"
                style={{ height: 40, padding: '0 20px 0 30px', width: 380 }}
                placeholder="Номер смены"
                type="number"
              />
            </CustomFormikField>
          </div>

          <div className={styles.rowWithoutMargin}>
            <CustomFormikField name="shiftStart">
              <CustomFormikTextInput
                width="200"
                style={{ height: 40, padding: '0 20px 0 30px' }}
                placeholder="Начало работы"
              />
            </CustomFormikField>

            <CustomFormikField name="shiftEnd">
              <CustomFormikTextInput
                width="200"
                style={{ height: 40, padding: '0 20px 0 30px' }}
                placeholder="Конец работы"
              />
            </CustomFormikField>
          </div>

          <div className={styles.rowWithoutMargin}>
            <CustomFormikField name="breakStart">
              <CustomFormikTextInput
                width="200"
                style={{ height: 40, padding: '0 20px 0 30px' }}
                placeholder="Начало перерыва"
              />
            </CustomFormikField>

            <CustomFormikField name="breakEnd">
              <CustomFormikTextInput
                width="200"
                style={{ height: 40, padding: '0 20px 0 30px' }}
                placeholder="Конец перерыва"
              />
            </CustomFormikField>
          </div>

          <div className={styles.rowWithoutMargin}>
            <Button disabled={!isValid || isSubmitting} type="submit">
              Обновить
            </Button>
          </div>
        </Form>
      )}
    </Formik>
  );
};
