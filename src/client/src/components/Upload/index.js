import React, { useState, useRef } from "react";
import "../Upload/styles.css";
import Button from "components/shared/Button";
import api from "services/api";
import ModalWindow from "components/shared/ModalWindow";
import { Formik } from "formik";
import Input from "components/shared/Input";

export const Upload = ({ tool, updateParentState, Masters }) => {
  const fileInputRef = useRef(null);
  const [fileSelected, setFileSelected] = useState(null);
  const [loading, setLoading] = useState(false);
  const [modalDate, setModalDate] = useState(false);
  const [dataFile, setdataFile] = useState("");
  const [statusText, setStatusText] = useState("Подождите, файл загружается");
  const [fileInputKey, setFileInputKey] = useState(0);

  const saveFileSelected = async (file) => {
    setModalDate(false);
    document.querySelector("body").style.overflowY="auto"
    setFileSelected(file);
    try {
      if (tool === 0) {
        await sendDataUsers(file);
      }
      if (tool === 1) {
        setModalDate(true);
      }
    } catch (error) {
      setLoading(true);
      setStatusText(
        "Возникла ошибка. Пожалуйста, проверьте файл, который вы загружаете."
      );
      setModalDate(false);
      document.querySelector("body").style.overflowY="auto"
    }
  };

  async function sendDataUsers(file) {
    try {
      const formData = new FormData();
      formData.append("file", file);
      await api.post(`uploadFile/users`, formData);
      setLoading(true);
      setStatusText("Файл был успешно загружен");
      setTimeout(() => {
        setStatusText("Подождите, файл загружается");
        setLoading(false);
      }, 5000);
      setModalDate(false);
      document.querySelector("body").style.overflowY="auto"
      fileInputRef.current.value = null;
    } catch (error) {
      setLoading(true);
      setStatusText(
        "Возникла ошибка. Пожалуйста, проверьте файл, который вы загружаете."
      );
    }
  }

  async function sendDataPlan() {
    try {
      const formData = new FormData();
      formData.append("file", fileSelected);
      formData.append(
        "date",
        new Date(dataFile).toLocaleDateString("ru-RU", { dateStyle: "short" })
      );
      await api.post("uploadFile/product-account", formData);

      const masterProductionArea = Masters?.find(
        (master) => master.productionArea
      )?.productionArea;

      const response2 = await api.get(
        `/productAccount/dates/${masterProductionArea?.id}`
      );

      updateParentState(response2.data);

      setLoading(true);
      setStatusText("Файл был успешно загружен");
      setTimeout(() => {
        setStatusText("Подождите, файл загружается");
        setLoading(false);
      }, 5000);
      setModalDate(false);
      document.querySelector("body").style.overflowY="auto"
      fileInputRef.current.value = null;
    } catch (error) {
      setLoading(true);
      setStatusText(
        "Возникла ошибка. Пожалуйста, проверьте файл, который вы загружаете."
      );
      setModalDate(false);
      document.querySelector("body").style.overflowY="auto"
    }
  }

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
          key={fileInputKey}
          ref={(input) => (fileInputRef.current = input)}
          hidden
          accept=".xlsx, .dbf"
          type="file"
          onChange={(e) => {
            saveFileSelected(e.target.files[0]);
            setFileInputKey(fileInputKey + 1);
          }}
        />
      </form>



      {modalDate
        ? (
          <ModalWindow
            isOpen={modalDate}
            headerText="Загрузка файла"
            setIsOpen={() => {
              setModalDate(false);
              document.querySelector("body").style.overflowY="auto"
            }}
            wrapperStyles={{ width: 420 }}
          >
            <Formik
              enableReinitialize
              onSubmit={(variables) => {
                const { id, ...dataToSend } = variables;
                setModalDate(false);
                document.querySelector("body").style.overflowY="auto"
              }}
            >
              {({ handleSubmit, handleBlur }) => (
                <form onSubmit={handleSubmit}>
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
                        placeholder="Выберите дату загрузки ежедневного плана"
                        type="text"
                        onFocus={(e) => {
                          e.currentTarget.type = "date";
                        }}
                        onBlur={handleBlur}
                        autoComplete="off"
                      />
                    </div>
                  </div>
                  <div className="row">
                    <Button
                      disabled={!dataFile}
                      type="submit"
                      onClick={(e) => {
                        e.preventDefault();
                        sendDataPlan();
                      }}
                    >
                      Загрузить
                    </Button>
                  </div>
                </form>
              )}
            </Formik>
          </ModalWindow>
        ) 
        : null

     }


      {loading ? (
        <ModalWindow
          isOpen={loading}
          headerText="Загрузка файла"
          setIsOpen={() => {
            setLoading(false);
          }}
          wrapperStyles={{ width: 420 }}
        >
          <Formik
            enableReinitialize
            onSubmit={(variables) => {
              const { id, ...dataToSend } = variables;
              setLoading(false);
            }}
          >
            {({ handleSubmit }) => (
              <form onSubmit={handleSubmit}>
                <div>
                  <h4 style={{ padding: "35px 40px" }}>{statusText}</h4>
                </div>
              </form>
            )}
          </Formik>
        </ModalWindow>
      ) : null}
    </div>
  );
};