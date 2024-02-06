import React, { useState, useRef } from 'react';

import { Formik, Form } from 'formik';
import {
  Button,
  ModalWindow,
  CustomFormikTextInput,
  CustomFormikField,
} from 'components/shared';

import { convertInputDateToDDMMYYYY } from 'core/helpers';
import { useProductAccountStore } from 'store/product-account';

export const UploadProductAccountFile = () => {
  const fileInputRef = useRef(null);
  const { productionAreaId, uploadProductAccountFile } =
    useProductAccountStore();

  const [isModalOpen, setIsOpenModal] = useState(false);
  const [file, setFile] = useState(null);

  const initialValues = {
    date: new Date().toISOString().split('T')[0],
  };

  const handleButtonClick = () => {
    fileInputRef.current.click();
  };

  const saveFileSelected = file => {
    document.querySelector('body').style.overflowY = 'auto';

    setFile(file);

    setIsOpenModal(true);
  };

  const handleUploadFile = ({ date }) => {
    const formData = new FormData();
    formData.append('file', file);

    const convertedDate = convertInputDateToDDMMYYYY(date);
    formData.append('date', convertedDate);

    document.querySelector('body').style.overflowY = 'auto';

    uploadProductAccountFile(formData, productionAreaId);

    setFile(null);
  };

  return (
    <div className="buttonXLS">
      <form>
        <Button className="XLS" onClick={handleButtonClick}>
          Загрузить файл
        </Button>
        <input
          ref={input => (fileInputRef.current = input)}
          hidden
          accept=".xlsx, .dbf"
          type="file"
          onChange={e => {
            saveFileSelected(e.target.files[0]);
          }}
        />
      </form>

      {file && (
        <ModalWindow
          isOpen={isModalOpen}
          headerText="Загрузка файла"
          setIsOpen={() => {
            setIsOpenModal(false);
            document.querySelector('body').style.overflowY = 'auto';
          }}
          wrapperStyles={{ width: 420 }}>
          <Formik
            initialValues={initialValues}
            enableReinitialize
            onSubmit={handleUploadFile}>
            {({ isValid, dirty }) => (
              <Form>
                <div>
                  <label className="getDate">Выберите дату</label>
                  <div className="row">
                    <CustomFormikField name="date">
                      <CustomFormikTextInput
                        width="200"
                        style={{
                          height: 40,
                          padding: '0 20px 0 30px',
                          width: 380,
                        }}
                        placeholder="Выберите дату загрузки ежедневного плана"
                        type="date"
                      />
                    </CustomFormikField>
                  </div>
                </div>
                <div className="row">
                  <Button disabled={!(isValid && dirty)} type="submit">
                    Загрузить
                  </Button>
                </div>
              </Form>
            )}
          </Formik>
        </ModalWindow>
      )}
    </div>
  );
};
