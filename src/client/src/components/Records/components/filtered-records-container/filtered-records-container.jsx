import React, { useEffect, useRef } from 'react';
import { FilteredRecordsTable } from '../filtered-records-table';

import {
  CustomFormikTextInput,
  CustomFormikField,
  Button,
  CustomFormikRadioButtons,
} from 'components/shared';
import { Formik, Form } from 'formik';
import { createValidationSchema } from './validation-schema';
import { convertStringToValue, convertInputDateToDDMMYYYY } from 'core/helpers';
import { useWeldingRecordStore } from 'store/welding-record';

import styles from './filtered-records-container.module.scss';

export const FilteredRecordsContainer = () => {
  const { setAdditionalFilters } = useWeldingRecordStore();
  const childRef = useRef();

  const handleFormSubmit = values => {
    const additionalFilters = {
      dateStart: values.dateStart
        ? convertInputDateToDDMMYYYY(values.dateStart)
        : null,
      dateEnd: values.dateEnd
        ? convertInputDateToDDMMYYYY(values.dateEnd)
        : null,
      includeDeviations: convertStringToValue(values.includeDeviations),
      sequenceNumber: values.sequenceNumber,
    };

    setAdditionalFilters(additionalFilters);
    childRef.current.reloadRecords();
  };

  useEffect(() => {
    return () => {
      setAdditionalFilters(null);
    };
  }, [setAdditionalFilters]);

  const validationScheme = createValidationSchema();

  const initialValues = {
    dateStart: '',
    dateEnd: '',
    includeDeviations: 'null',
    sequenceNumber: '',
  };

  const includeDeviationsOptions = [
    {
      key: 'С нарушениями',
      value: 'true',
    },
    {
      key: 'Без нарушений',
      value: 'false',
    },
    {
      key: 'Все записи',
      value: 'null',
    },
  ];

  return (
    <div className={styles.tableWrapper}>
      <Formik
        initialValues={initialValues}
        validationSchema={validationScheme}
        onSubmit={handleFormSubmit}>
        {({ isValid, dirty, resetForm }) => (
          <Form className={styles.form}>
            <div className={styles.formFields}>
              <div className={styles.fieldDates}>
                <span className={styles.fieldDatesTitle}>
                  Вывод записей за период
                </span>
                <div className={styles.fieldDatesInputs}>
                  <div className={styles.dateField}>
                    <span className={styles.dateFieldLabel}>Начало</span>

                    <CustomFormikField name="dateStart">
                      <CustomFormikTextInput
                        style={{
                          height: 40,
                          width: '100%',
                        }}
                        placeholder="Начало"
                        type="date"
                      />
                    </CustomFormikField>
                  </div>
                  <div className={styles.dateField}>
                    <span className={styles.dateFieldLabel}>Конец</span>

                    <CustomFormikField name="dateEnd">
                      <CustomFormikTextInput
                        style={{
                          height: 40,
                          width: '100%',
                        }}
                        placeholder="Конец"
                        type="date"
                      />
                    </CustomFormikField>
                  </div>
                </div>
              </div>
              <div className={styles.fieldDeviations}>
                <span className={styles.fieldDeviationsTitle}>
                  Вывод записей без нарушений / с нарушениями
                </span>

                <div className={styles.fieldDeviationsInputs}>
                  <CustomFormikRadioButtons
                    name="includeDeviations"
                    fieldClassName={styles.radioButtonField}
                    options={includeDeviationsOptions}
                  />
                </div>
              </div>
              <div className={styles.fieldSequenceNumber}>
                <span className={styles.fieldSequenceNumberTitle}>
                  Поиск задания по порядковому номеру изделия
                </span>

                <div className={styles.fieldSequenceNumberInput}>
                  <CustomFormikField name="sequenceNumber">
                    <CustomFormikTextInput
                      style={{
                        height: 40,
                        width: '100%',
                      }}
                      placeholder="Порядковый номер"
                      type="text"
                    />
                  </CustomFormikField>
                </div>
              </div>
            </div>

            <div className={styles.formButtons}>
              <Button disabled={!isValid} type="submit">
                Получить
              </Button>
              <Button
                type="button"
                onClick={() => {
                  resetForm();
                  setAdditionalFilters(null);
                  childRef.current.reloadRecords();
                }}>
                Сбросить фильтры
              </Button>
            </div>
          </Form>
        )}
      </Formik>

      <FilteredRecordsTable ref={childRef} />
    </div>
  );
};
