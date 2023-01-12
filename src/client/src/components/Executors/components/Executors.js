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
import TableCell from "@material-ui/core/TableCell";
import styles from "../styles.module.css";
import TableRow from "@material-ui/core/TableRow";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import Paper from "@material-ui/core/Paper";
import MaterialTable from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import Calendars from "./Calendar";

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
    rfidTag: modalData?.rfidTag ?? "",
    firstName: modalData?.firstName ?? "",
    lastName: modalData?.lastName ?? "",
    middleName: modalData?.middleName ?? "",
    workshopName: modalData?.workshopName ?? "",
    productionAreaName: modalData?.productionAreaName ?? "",
    workplaceNumber: modalData?.workplaceNumber ?? "",
    weldingEquipment: modalData?.weldingEquipment ?? [
      {
        rfidTag: "",
        name: "",
        marking: "",
        factoryNumber: "",
        commissioningDate: "",
        currentCondition: "",
      },
    ],
  };

  const requiredKeys = [
    "rfidTag",
    "firstName",
    "lastName",
    "middleName",
    "workshopName",
    "productionAreaName",
    "workplaceNumber",
  ];

  const controllerColumns = [
    {
      title: "RFID-метка",
      field: "rfidTag",
    },
    {
      title: "Имя",
      field: "firstName",
    },
    {
      title: "Фамилия",
      field: "middleName",
    },
    {
      title: "Отчество",
      field: "lastName",
    },
    {
      title: "Цех",
      field: "workshopName",
    },
    {
      title: "Производственный участок",
      field: "name",
    },
  ];
 

  const renderValue = (value) => {
    if (value === 0 || value === "0" || value === null) {
      return "-";
    }
    return value ?? "-";
  };

  const renderConditionValue = (value) => {
    switch (value) {
      case 1:
        return "Выключено";
      case 2:
        return "Включено";
      case 3:
        return "В работе";
      default:
        return "Вынужденный простой";
    }
  };

  const extraUserColumns = [
    {
      title: "RFID-метка",
      field: "rfidTag",
    },
    {
      title: "Имя",
      field: "firstName",
    },
    {
      title: "Фамилия",
      field: "middleName",
    },
    {
      title: "Отчество",
      field: "lastName",
    },
    {
      title: "Цех",
      field: "workshopName",
    },
    {
      title: "Производственный участок",
      field: "productionAreaName",
    },
    {
      title: "Номер рабочего места",
      field: "workplaceNumber",
      render: (rowData) => {
        return <p>{renderValue(rowData.workplaceNumber)}</p>;
      },
    },
  ];

  const renderRowChildren = (rowData) => { 
    return (
      rowData?.weldingEquipment && (
        <TableContainer component={Paper}>
          <MaterialTable aria-label="simple table">
            <TableHead>
              <TableRow>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                >
                  RFID-метка
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                >
                  Наименование
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                >
                  Маркировка
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                >
                  Заводской номер
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                >
                  Дата ввода в эксплуатацию
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                >
                  Текущие состояние
                </TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              <TableRow key={rowData?.weldingEquipment?.id}>
                <TableCell align="center">
                  {rowData.weldingEquipment.rfidTag}
                </TableCell>
                <TableCell align="center">
                  {rowData.weldingEquipment.name}
                </TableCell>
                <TableCell align="center">
                  {rowData.weldingEquipment.marking}
                </TableCell>
                <TableCell align="center">
                  {rowData.weldingEquipment.factoryNumber}
                </TableCell>
                <TableCell align="center">
                  {rowData.weldingEquipment.commissioningDate}
                </TableCell>
                <TableCell align="center">
                  {renderConditionValue(
                    rowData.weldingEquipment.currentCondition
                  )}
                </TableCell>
              </TableRow>
            </TableBody>
          </MaterialTable>
        </TableContainer>
      )
    );
  };
 
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
          renderRowChildren={renderRowChildren}
          rowStyle={classes.rowStyle}
          columns={type === "executor" ? extraUserColumns : controllerColumns}
          data={executors}
        />
      </div>
      {/* <Calendars></Calendars> */}
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
