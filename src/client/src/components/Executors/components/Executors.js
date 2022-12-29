import { makeStyles } from "@material-ui/core/styles";
import SaveIcon from "@material-ui/icons/Save";
import Button from "components/shared/Button";
import Input from "components/shared/Input";
import ModalWindow from "components/shared/ModalWindow";
import { ResultsModal } from "components/shared/ResultsModal";
import Select from "components/shared/Select";
import { Table } from "components/shared/Table";
import { Formik } from "formik";
import React, { useState } from "react";
import styles from "../styles.module.css";

import Calendars from "./Calendar"



const useStyles = makeStyles(() => ({
  rowStyle: {
    padding: 10,
    border: "1px solid red",
  },
}));

const dateOptions = {
  day: "numeric",
  month: "short",
  year: "numeric",
};

export const ExecutorsTable = ({
  addExecutor,
  deleteExecutor,
  editExecutor,
  executors,
  masters,
  isRequesting,
  type,
  userRole,
}) => {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [modalData, setModalData] = useState(null);
  const [isResultsModalOpen, setIsResultsModalOpen] = useState(false);
  const [activeExecutor, setActiveExecutor] = useState("");

  const classes = useStyles();

  const formattedMasters = masters?.map((item) => {
    return {
      value: item.masterId,
      label: `${item.surname} ${item.name}`,
    };
  });

  const initialValues = {
    refId:
      type === "executor"
        ? modalData?.executorId
        : type === "master"
        ? modalData?.masterId
        : modalData?.techUserId ?? "",
    name: modalData?.name ?? "",
    surname: modalData?.surname ?? "",
    patronymic: modalData?.patronymic ?? "",
    photoName: modalData?.photoName ?? "",
    email: modalData?.email ?? "",
    position: modalData?.position ?? "",
    stamp: modalData?.stamp ?? "",
    badgeNumber: modalData?.badgeNumber ?? "",
    badgeExpirationDate: modalData?.badgeExpirationDate ?? "",
  };

  const requiredKeys = [
    "refId",
    "name",
    "badgeNumber",
    "badgeExpirationDate",
    "surname",
    "position",
    "email",
    "patronymic",
  ];


  const mastersName = (rowData)=>{  
    for (let index = 0; index < masters.length; index++) { 
      for (let index2 = 0; index2 < masters[index].executors.length; index2++) {
          let nameExecutors = masters[index].executors[index2].userData.surname; 
          if(rowData==nameExecutors){
            return masters[index].surname 
          } 
      }
    }
  }
 

  const executorColumns = [
    {
      title: "Фото",
      field: "photoName",
      render: (rowData) => (
        <img
          style={{
            width: 40,
            height: 40,
            borderRadius: "50%",
          }}
          src={
            `${process.env.REACT_APP_API_URI}/images/${rowData.photo}` ??
            "https://www.pngfind.com/pngs/b/110-1102775_download-empty-profile-hd-png-download.png"
          }
          alt=""
        />
      ),
    },
    {
      title: "ФИО",
      field: "name",
      render: (rowData) => (
        <span>{`${rowData.surname} ${rowData.name} ${rowData.patronymic}`}</span>
      ),
    },
    {
      title: "Должность",
      field: "position",
    },
    {
      title: "№ Удостоверения",
      field: "badgeNumber",
    },
    {
      title: "RFID метка",
      field: "id",
    },
    {
      title: "Срок действия удостоверения",
      field: "badgeExpirationDate",
      render: (rowData) => (
        <span>
          {new Date(rowData?.badgeExpirationDate).toLocaleDateString(
            "ru-RU",
            dateOptions
          )}
        </span>
      ),
    },
    {
      title: "Область распространения квалификации",
      field: "qualificationArea",
      width: 400,
    },
    {
      title: "Цех",
      field: "id",
      render: (rowData) => (
        <span>Цех</span>
      ),
    },
    {
      title: "Производственный участок",
      field: "id",
      render: (rowData) => (
        <span>Производственный участок</span>
      ),
    },  
    {
      title: "Закрепленное сварочное оборудование",
      field: "id",
      render: (rowData) => (
        <span>Закрепленное сварочное оборудование</span>
      ),
    },
    {
      title: "Mастер", 
      render: (rowData) => { 
        return <p>{mastersName(rowData.surname)}</p>;
      },
    },
    { title: "Клеймо", field: "stamp" }, 
    {
      field: "link",
      title: "Отчет",
      render: (rowData) => (
        <div
          onClick={() => {
            setIsResultsModalOpen(true);
            setActiveExecutor(rowData?.executorId);
          }}
        >
          <SaveIcon />
        </div>
      ),
      width: 54,
    },
  ];

  const executorConrolerColumns = [
    {
      title: "Фото",
      field: "photoName",
      render: (rowData) => (
        <img
          style={{
            width: 40,
            height: 40,
            borderRadius: "50%",
          }}
          src={
            `${process.env.REACT_APP_API_URI}/images/${rowData.photo}` ??
            "https://www.pngfind.com/pngs/b/110-1102775_download-empty-profile-hd-png-download.png"
          }
          alt=""
        />
      ),
    },
    {
      title: "ФИО",
      field: "name",
      render: (rowData) => (
        <span>{`${rowData.surname} ${rowData.name} ${rowData.patronymic}`}</span>
      ),
    },
    {
      title: "Должность",
      field: "position",
    },
    {
      title: "№ Удостоверения",
      field: "badgeNumber",
    },
    {
      title: "RFID метка",
      field: "id",
    },
    {
      title: "Срок действия удостоверения",
      field: "badgeExpirationDate",
      render: (rowData) => (
        <span>
          {new Date(rowData?.badgeExpirationDate).toLocaleDateString(
            "ru-RU",
            dateOptions
          )}
        </span>
      ),
    },
    {
      title: "Область распространения квалификации",
      field: "qualificationArea",
      width: 400,
    },
    {
      title: "Цех",
      field: "id",
      render: (rowData) => (
        <span>Цех</span>
      ),
    },
    {
      title: "Производственный участок",
      field: "id",
      render: (rowData) => (
        <span>Производственный участок</span>
      ),
    },   
    { title: "Клеймо", field: "stamp" }, 
    {
      field: "link",
      title: "Отчет",
      render: (rowData) => (
        <div
          onClick={() => {
            setIsResultsModalOpen(true);
            setActiveExecutor(rowData?.executorId);
          }}
        >
          <SaveIcon />
        </div>
      ),
      width: 54,
    },
  ];


  const extraUserColumns = [
    {
      title: "Фото",
      field: "photoName",
      render: (rowData) => (
        <img
          style={{ width: 40, height: 40, borderRadius: "50%" }}
          src={
            `${process.env.REACT_APP_API_URI}/images/${rowData.photo}` ??
            "https://www.pngfind.com/pngs/b/110-1102775_download-empty-profile-hd-png-download.png"
          }
          alt=""
        />
      ),
    },
    {
      title: "ФИО",
      field: "name",
      render: (rowData) => (
        <span>{`${rowData.surname} ${rowData.name} ${rowData.patronymic}`}</span>
      ),
    },
    {
      title: "Должность",
      field: "position",
    },
    {
      title: "№ Удостоверения",
      field: "badgeNumber",
    },
    {
      title: "RFID метка",
      field: "id",
    },

    /////Новые поля
    {
      title: "Цех",
      field: "id",
      render: (rowData) => (
        <span>Цех</span>
      ),
    },
    {
      title: "Производственный участок",
      field: "id",
      render: (rowData) => (
        <span>Производственный участок</span>
      ),
    },  
    {
      title: "Закрепленное сварочное оборудование",
      field: "id",
      render: (rowData) => (
        <span>Закрепленное сварочное оборудование</span>
      ),
    },
    /////!Новые поля
    {
      title: "Срок действия удостоверения",
      field: "badgeExpirationDate",
      render: (rowData) => (
        <span>
          {new Date(rowData?.badgeExpirationDate).toLocaleDateString(
            "ru-RU",
            dateOptions
          )}
        </span>
      ),
    },
  ];

  return (
    <>
      <div className={styles.tableWrapper}>
        <Table
          title="Сотрудники"
          isLoading={isRequesting}
          actions={
            userRole === "admin"
              ? [
                  {
                    icon: "add",
                    tooltip: "Добавить пользователя",
                    isFreeAction: true,
                    onClick: () => setIsModalOpen(true),
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать пользователя",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                    },
                  },
                ]
              : []
          }
          deleteAction={userRole === "admin" ? deleteExecutor : null}
          rowStyle={classes.rowStyle}
          columns={type === "executor" ? executorColumns : extraUserColumns}
          data={executors}
        />
      </div>
      <Calendars></Calendars>
      <ResultsModal
        type={"EXECUTOR"}
        activeId={activeExecutor}
        isOpen={isResultsModalOpen}
        setIsOpen={setIsResultsModalOpen}
      />
      <ModalWindow
        isOpen={isModalOpen}
        headerText={
          modalData ? "Редактировать пользователя" : "Создать пользователя"
        }
        setIsOpen={(state) => {
          setIsModalOpen(state);
          setModalData(null);
        }}
        wrapperStyles={{ width: 600 }}
      >
        <Formik
          initialValues={initialValues}
          enableReinitialize
          onSubmit={(variables) => {
            const { id, ...dataToSend } = variables;
            modalData
              ? editExecutor(
                  { ...variables },
                  type === "executor"
                    ? modalData.executorId
                    : type === "master"
                    ? modalData.masterId
                    : modalData.techUserId
                )
              : addExecutor({ ...dataToSend });
            setIsModalOpen(false);
            setModalData(null);
          }}
        >
          {({
            handleSubmit,
            handleChange,
            values,
            setFieldValue,
            handleBlur,
          }) => (
            <form className={styles.form} onSubmit={handleSubmit}>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  width="200"
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.surname}
                  name="surname"
                  placeholder="Фамилия"
                  onBlur={handleBlur}
                />
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  width="200"
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.name}
                  name="name"
                  placeholder="Имя"
                  onBlur={handleBlur}
                />
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.patronymic}
                  name="patronymic"
                  placeholder="Отчество"
                  onBlur={handleBlur}
                />
              </div>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  width="186px"
                  style={{ height: 40, width: 186 }}
                  value={values.email}
                  name="email"
                  placeholder="email"
                  onBlur={handleBlur}
                  type="user"
                  autoComplete="email"
                />
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{ height: 40, width: 186, padding: "0 20px 0 30px" }}
                  value={values.photoName}
                  name="photoName"
                  placeholder="Ссылка на фото"
                  onBlur={handleBlur}
                />
              </div>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.position}
                  name="position"
                  placeholder="Должность"
                  onBlur={handleBlur}
                />
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.badgeNumber}
                  name="badgeNumber"
                  placeholder="Номер удостоверения"
                  onBlur={handleBlur}
                />
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.badgeExpirationDate}
                  name="badgeExpirationDate"
                  type="text"
                  onFocus={(e) => {
                    e.currentTarget.type = "date";
                  }}
                  placeholder="Срок действия"
                  onBlur={handleBlur}
                />
              </div>

              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{ width: 260, height: 40, padding: "0 20px 0 30px" }}
                  value={values.stamp}
                  name="stamp"
                  placeholder="Клеймо"
                  onBlur={handleBlur}
                />
              </div>
              {type === "executor" && (
                <div className={styles.row}>
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{
                      width: 260,
                      height: 40,
                      padding: "0 20px 0 30px",
                    }}
                    value={values.qualificationArea}
                    name="qualificationArea"
                    placeholder="Область распростр. квалификации"
                    onBlur={handleBlur}
                  />
                  <Select
                    name="masterId"
                    value={values.masterId}
                    width="186px"
                    placeholder="Мастер"
                    onChange={(e) => {
                      setFieldValue("masterId", e.value);
                    }}
                    options={formattedMasters}
                  />
                </div>
              )}
              {!modalData && (
                <div className={styles.row}>
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{ height: 40, padding: "0 20px 0 30px" }}
                    value={values.refId}
                    name="refId"
                    placeholder="RFID метка"
                    onBlur={handleBlur}
                  />
                </div>
              )}
              <div className={styles.row}>
                <Button
                  disabled={requiredKeys.some((key) => !values[key])}
                  type="submit"
                >
                  {modalData ? "Сохранить" : "Создать"}
                </Button>
              </div>
            </form>
          )}
        </Formik>
      </ModalWindow>


      

    </>
  );
};
