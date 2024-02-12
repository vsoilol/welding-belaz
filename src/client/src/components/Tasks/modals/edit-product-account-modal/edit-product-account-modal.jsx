import { useState } from 'react';
import {
  ModalWindow,
  CustomFormikTextInput,
  CustomFormikField,
  Button,
} from 'components/shared';
import { Formik, Form, FieldArray } from 'formik';
import IconButton from '@material-ui/core/IconButton';
import ClearIcon from '@material-ui/icons/Clear';
import AddIcon from '@material-ui/icons/Add';

import { createValidationSchema } from './validation-schema';
import { useProductAccountStore } from 'store/product-account';

import styles from './edit-product-account-modal.module.scss';

export const EditProductAccountModal = ({ isOpen, toggleModal }) => {
  const [newNumber, setNewNumber] = useState('');
  const { selectedProductAccount, editProductAccount } =
    useProductAccountStore();

  const validationSchema = createValidationSchema();

  const initialValues = {
    sequenceNumbers: selectedProductAccount?.sequenceNumbers ?? [],
  };

  const handleEditProductAccount = values => {
    const { sequenceNumbers } = values;
    const amountFromPlan = sequenceNumbers.length;

    editProductAccount(
      selectedProductAccount.id,
      amountFromPlan,
      sequenceNumbers
    );
    toggleModal(false);
  };

  return (
    <ModalWindow
      isOpen={isOpen}
      headerText="Редактирование"
      setIsOpen={() => {
        toggleModal(false);
      }}
      wrapperStyles={{ width: 420 }}>
      <Formik
        initialValues={initialValues}
        validationSchema={validationSchema}
        onSubmit={handleEditProductAccount}>
        {({ values, setFieldValue, isValid, dirty }) => (
          <Form className={styles.form}>
            <div className={styles.field}>
              <span>Порядковый номер изделия</span>

              <div className={styles.sequenceNumbersInput}>
                <CustomFormikTextInput
                  style={{
                    height: 40,
                    padding: '0 20px 0 30px',
                    width: '100%',
                  }}
                  placeholder="Порядковый номер"
                  type="text"
                  value={newNumber}
                  onChange={e => {
                    setNewNumber(e.target.value);
                  }}
                />

                <IconButton
                  aria-label="add"
                  color="primary"
                  onClick={() => {
                    if (newNumber !== '') {
                      setFieldValue('sequenceNumbers', [
                        ...values.sequenceNumbers,
                        newNumber,
                      ]);
                      setNewNumber('');
                    }
                  }}>
                  <AddIcon />
                </IconButton>
              </div>

              <FieldArray name="sequenceNumbers">
                {({ remove }) => (
                  <ul className={styles.list}>
                    {values.sequenceNumbers.map((number, index) => (
                      <li className={styles.item} key={index}>
                        {number}
                        <IconButton
                          aria-label="add"
                          color="secondary"
                          size="small"
                          onClick={() => remove(index)}>
                          <ClearIcon />
                        </IconButton>
                      </li>
                    ))}
                  </ul>
                )}
              </FieldArray>
            </div>

            <Button disabled={!(isValid && dirty)} type="submit">
              Сохранить
            </Button>
          </Form>
        )}
      </Formik>
    </ModalWindow>
  );
};
