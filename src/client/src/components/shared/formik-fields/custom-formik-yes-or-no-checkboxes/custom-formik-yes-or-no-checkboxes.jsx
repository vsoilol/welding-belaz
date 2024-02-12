import React from 'react';
import { useField } from 'formik';
import { CustomFormikCheckbox } from '../custom-formik-checkbox/custom-formik-checkbox';

import styles from './custom-formik-yes-or-no-checkboxes.module.scss';

export const CustomFormikYesOrNoCheckboxes = ({ name, style }) => {
  const [, meta] = useField(name);

  return (
    <div style={style} className={styles.inputField}>
      <div className={styles.checkboxes}>
        <div className={styles.columnInputCheckbox}>
          <CustomFormikCheckbox name={name} value={true} exclusive={true} />
          <span className={styles.checkboxText}>Да</span>
        </div>
        <div className={styles.columnInputCheckbox}>
          <CustomFormikCheckbox name={name} value={false} exclusive={true} />
          <span className={styles.checkboxText}>Нет</span>
        </div>
      </div>
      {meta.touched && meta.error && (
        <div className={styles.inputError}>{meta.error}</div>
      )}
    </div>
  );
};
