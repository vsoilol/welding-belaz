import React, { useState, useEffect, useRef } from "react";
import "../Upload/styles.css";
import Button from "components/shared/Button";
import api from "services/api";
import ModalWindow from "components/shared/ModalWindow";
import { Formik } from "formik";
import Input from "components/shared/Input";


export const Upload = (tool) => {
  const [fileSelected, setFileSelected] = useState(null);
  const [loading, setLoading] = useState(false);
  const [loadingDateFile, setloadingDateFile] = useState(false);
  const [dataFile, setdataFile] = useState("");
  const [statusText, setStatusText] = useState("Подождите, файл загружается");
  const fileInputRef = useRef(null);
  const tools = {
    0: {
      url: "uploadFile/users",
      message: "Файл пользователей успешно загружен"
    },
    1: {
      url: "uploadFile/product-account",
      message: "Файл плана успешно загружен"
    },
  }
  const saveFileSelected = (e) => {
    const file = e.target.files[0];
    setFileSelected(file);
    setloadingDateFile(true);
  };

  function handleButtonClick() {
    fileInputRef.current.click();
  }

  async function sendData() {
    try { 
      const formData = new FormData();
      formData.append("file", fileSelected);  
      formData.append('date', new Date(dataFile).toLocaleDateString('ru-RU', { dateStyle: 'short' }));

      const response = await api.post(`${tools[tool.tool].url}`, formData);
      setLoading(true);
      setloadingDateFile(false);
      setStatusText("Файл был успешно загружен");
      setTimeout(() => {
        setStatusText("Подождите, файл загружается");
        setLoading(false);
      }, 5000);
      fileInputRef.current.value = null;
    } catch (error) {
      console.log(error);
    } finally {

    }
  }
  return (
    <div className="buttonXLS">
      <form>
        <Button className="XLS" onClick={handleButtonClick}>
          Загрузить файл
        </Button>
        <input
          ref={fileInputRef}
          hidden
          accept=".xlsx, .dbf"
          type="file"
          onChange={saveFileSelected}
        />
      </form>



      <ModalWindow
        isOpen={loadingDateFile}
        headerText="Загрузка файла"
        setIsOpen={(state) => {
          setloadingDateFile(false)
        }}
        wrapperStyles={{ width: 420 }}
      >
        <Formik
          enableReinitialize
          onSubmit={(variables) => {
            const { id, ...dataToSend } = variables;
            setloadingDateFile(false)
          }}
        >
          {({
            handleSubmit,
            handleBlur,
          }) => (
            <form   >
              <div>
                <label className="getDate">Выберите дату</label>
                <div className="row">
                  <Input
                    onChange={(e) => {
                      setdataFile(e.target.value);
                    }}
                    width="200"
                    style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
                    value={dataFile}
                    name="dataFile"
                    placeholder="Дата очередной аттестации (ППР)»"
                    type="text"
                    onFocus={(e) => {
                      e.currentTarget.type = "date";
                    }}
                    onBlur={handleBlur}
                    autocomplete="off"
                  />

                </div>

              </div>

              <div className="row">
                <Button
                  disabled={!dataFile}
                  type="submit"
                  onClick={(e) => {
                    e.preventDefault();  
                    sendData();  
                  }}
                >
                  Загрузить
                </Button>
              </div>
            </form>
          )}
        </Formik>
      </ModalWindow>

      {loading
        ? (
          <ModalWindow
            isOpen={loading}
            headerText="Загрузка файла"
            setIsOpen={(state) => {
              setLoading(false)
            }}
            wrapperStyles={{ width: 420 }}
          >
            <Formik
              enableReinitialize
              onSubmit={(variables) => {
                const { id, ...dataToSend } = variables;
                setLoading(false)
              }}
            >
              {({
                handleSubmit,
              }) => (
                <form onSubmit={handleSubmit}>
                  <div>
                    <h4 style={{ padding: "35px 40px" }}>{statusText}</h4>
                  </div>
                </form>
              )}
            </Formik>
          </ModalWindow>
        )
        : null
      }

    </div>
  );
};