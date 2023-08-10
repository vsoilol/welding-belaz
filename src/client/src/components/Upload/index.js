import React, { useState, useEffect, useRef } from "react";
import "../Upload/styles.css";
import Button from "components/shared/Button";
import api from "services/api";
import ModalWindow from "components/shared/ModalWindow";
import { Formik } from "formik";

export const Upload = (tool) => {
  const [fileSelected, setFileSelected] = useState(null);
  const [loading, setLoading] = useState(false);
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
    importFile(file);
  };
  const importFile = async (file) => {
    const formData = new FormData();
    formData.append("file", file);
    try {
      setLoading(true);
      const response = await api.post(`${tools[tool.tool].url}`, formData);
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
    setFileSelected(null);
  };

  function handleButtonClick() {
    fileInputRef.current.click();
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
        :null
      }

    </div>
  );
};