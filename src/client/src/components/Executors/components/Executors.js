import React, { useState } from "react";
import { Link } from "react-router-dom";
import { makeStyles } from "@material-ui/core/styles";
import SaveIcon from "@material-ui/icons/Save";
import Button from "components/shared/Button";
import Input from "components/shared/Input";
import ModalWindow from "components/shared/ModalWindow";
import { ResultsModal } from "components/shared/ResultsModal";
import Select from "components/shared/Select";
import { Table } from "components/shared/Table";
import { Formik } from "formik";
import TableCell from "@material-ui/core/TableCell";
import styles from "../styles.module.scss";
import TableRow from "@material-ui/core/TableRow";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import Paper from "@material-ui/core/Paper";
import MaterialTable from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import imgcalendar from "assets/icons/calendar.png";
import deleteIcon from "assets/icons/delete.png";
import api from "services/api";

import { Upload } from "components/Upload/index";

const useStyles = makeStyles(() => ({
  rowStyle: {
    padding: 10,
    border: "1px solid red",
  },
}));
export const ExecutorsTable = ({
  addExecutor,
  deleteExecutor,
  editExecutor,
  editMaster,
  editTech,
  executors,
  isRequesting,
  type,
  userRole,
  equipment,
  workshop,
  area,
  workplace,
  value,
}) => {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [modalData, setModalData] = useState(null);
  const [isResultsModalOpen, setIsResultsModalOpen] = useState(false);
  const [activeExecutor, setActiveExecutor] = useState("");

  const [valueWorkshopa, setValueWorkshop] = useState();
  const [valuetArea, setValuetArea] = useState();
  const [valuetEquipment, setValuetEquipment] = useState();
  const [valuetOpenModal, setValuetOpenModal] = useState();
  const [valuetOpenVkladka, setValuetOpenVkladka] = useState(0);

  const [valueWorkplace, setvalueWorkplace] = useState(0);

  /*newPassword */
  const [valuemodalPass, setvaluemodalPass] = useState(false);

  const classes = useStyles();
  const initialValues = {
    id: modalData?.id ?? "",
    rfidTag: modalData?.rfidTag ?? modalData?.idFromSystem ?? "",
    firstName: modalData?.firstName ?? "",
    lastName: modalData?.lastName ?? "",
    middleName: modalData?.middleName ?? "",
    position: modalData?.position ?? "",
    serviceNumber: modalData?.serviceNumber ?? "",
    weldingEquipment: modalData?.weldingEquipment ?? [
      {
        id: modalData?.weldingEquipment?.id ?? null,
        rfidTag: "",
        name: "",
        marking: "",
        factoryNumber: "",
        commissioningDate: "",
        currentCondition: "",
      },
    ],
  };

  const [deleteTaskModal, setdeleteTaskModal] = useState(false);
  const [idExecutor, setidExecutor] = useState("");
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
    userRole === "Admin" /* || userRole === "Master" */ && {
      title: "Удаление",
      render: (rowData) => (
        <img
          className={styles.deleteIcon}
          src={deleteIcon}
          onClick={() => {
            setdeleteTaskModal(true);
            setidExecutor(rowData?.id);
          }}
        />
      ),
    },
    {
      title: "RFID-метка",
      render: (rowData) => {
        return <p>{rowData?.rfidTag ?? "-"}</p>;
      },
    },
    {
      title: "Фамилия",
      field: "middleName",
    },
    {
      title: "Имя",
      field: "firstName",
    },
    {
      title: "Отчество",
      field: "lastName",
    },
    {
      title: "Табельный номер",
      field: "serviceNumber",
    },
    {
      title: "Должность",
      field: "position",
    },
    {
      title: "Наименование цеха",
      render: (rowData) => {
        return ReturnWorkshop(rowData?.productionArea?.id);
      },
    },
    {
      title: "Номер цеха",
      render: (rowData) => {
        return ReturnWorkshopNumber(rowData?.productionArea?.id);
      },
    },
    {
      title: "Наименование производственного участка",
      field: "productionArea.name",
    },
    {
      title: "Номер производственного участка",
      field: "productionArea.number",
    },

    {
      title: "Закреплённое оборудование (ссылка)",
      render: (rowData) => {
        if (
          rowData?.weldingEquipments &&
          rowData?.weldingEquipments.length !== 0
        ) {
          return rowData?.weldingEquipments?.map((equipment) => (
            <div key={equipment.id}>
              <a className={styles.equipmentRefs} href="/equipment">
                {equipment.factoryNumber || "-"}
              </a>
            </div>
          ));
        }
      },
    },
  ].filter((column) => column);

  const controllersColumns = [
    userRole === "Admin" /*  || userRole === "Master" */ && {
      title: "Удаление",
      render: (rowData) => (
        <img
          className={styles.deleteIcon}
          src={deleteIcon}
          onClick={() => {
            setdeleteTaskModal(true);
            setidExecutor(rowData?.id);
          }}
        />
      ),
    },
    {
      title: "RFID-метка",
      render: (rowData) => {
        return <p>{rowData?.rfidTag ?? "-"}</p>;
      },
    },
    {
      title: "Фамилия",
      field: "middleName",
    },
    {
      title: "Имя",
      field: "firstName",
    },
    {
      title: "Отчество",
      field: "lastName",
    },
    {
      title: "Табельный номер",
      field: "idFromSystem",
    },
    {
      title: "Должность",
      field: "position",
    },
    {
      title: "Наименование цеха",
      render: (rowData) => {
        return ReturnWorkshop(rowData?.productionArea?.id);
      },
    },
    {
      title: "Номер цеха",
      render: (rowData) => {
        return ReturnWorkshopNumber(rowData?.productionArea?.id);
      },
    },
    {
      title: "Наименование производственного участка",
      field: "productionArea.name",
    },
    {
      title: "Номер производственного участка",
      field: "productionArea.number",
    },
  ].filter((column) => column);

  function ReturnWorkshop(Area) {
    if (area != undefined) {
      for (let index = 0; index < area.length; index++) {
        if (area[index].id === Area) {
          return area[index].workshop.name;
        }
      }
    }
  }

  function ReturnWorkshopNumber(Area) {
    if (area != undefined) {
      for (let index = 0; index < area.length; index++) {
        if (area[index].id === Area) {
          return area[index].workshop.number;
        }
      }
    }
  }

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
    userRole === "Admin" /* || userRole === "Master" */ && {
      title: "Удаление",
      render: (rowData) => (
        <img
          className={styles.deleteIcon}
          src={deleteIcon}
          onClick={() => {
            setdeleteTaskModal(true);
            setidExecutor(rowData?.id);
          }}
        />
      ),
    },
    {
      title: "RFID-метка",
      render: (rowData) => {
        return <p>{rowData?.rfidTag ?? "-"}</p>;
      },
    },
    {
      title: "Фамилия",
      field: "middleName",
    },
    {
      title: "Имя",
      field: "firstName",
    },
    {
      title: "Отчество",
      field: "lastName",
    },
    {
      title: "Табельный номер",
      field: "serviceNumber",
    },
    {
      title: "Должность",
      field: "position",
    },
    {
      title: "Наименование цеха",
      render: (rowData) => {
        return ReturnWorkshop(rowData?.productionArea?.id);
      },
    },
    {
      title: "Номер цеха",
      render: (rowData) => {
        return ReturnWorkshopNumber(rowData?.productionArea?.id);
      },
    },
    {
      title: "Наименование производственного участка",
      field: "productionArea.name",
    },
    {
      title: "Номер производственного участка",
      field: "productionArea.number",
    },
    {
      title: "Закреплённое оборудование ( ссылка )",
      render: (rowData) => {
        if (
          rowData?.weldingEquipments &&
          rowData?.weldingEquipments.length != 0
        ) {
          return rowData.weldingEquipments?.map((equipments) => (
            <div>
              <a className={styles.equipmentRefs} href="/equipment">
                {equipments.factoryNumber ?? "-"}
              </a>{" "}
            </div>
          ));
        }
      },
    },
    {
      title: "Номер рабочего места",
      field: "workplaceNumber",
      render: (rowData) => {
        return <p>{renderValue(rowData?.workplace?.number ?? "-")}</p>;
      },
    },
    {
      title: "Просмотреть календарь",
      render: (rowData) => {
        return (
          <Link to={`/production-calendar?welderId=${rowData.id}`}>
            <img
              alt="Календарь"
              className={styles.imgcalendar}
              src={imgcalendar}
            ></img>
          </Link>
        );
      },
    },
  ].filter((column) => column);

  const renderRowChildren = (rowData) => {
    if (rowData?.weldingEquipments?.length > 0) {
      return (
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

            {rowData?.weldingEquipments?.map((equipments) => (
              <TableBody>
                <TableRow key={equipments.id}>
                  <TableCell align="center">{equipments.rfidTag}</TableCell>
                  <TableCell align="center">{equipments.name}</TableCell>
                  <TableCell align="center">{equipments.marking}</TableCell>
                  <TableCell align="center">
                    {equipments.factoryNumber}
                  </TableCell>
                  <TableCell align="center">
                    {equipments.commissioningDate}
                  </TableCell>
                  <TableCell align="center">
                    {renderConditionValue(equipments.currentCondition)}
                  </TableCell>
                </TableRow>
              </TableBody>
            ))}
          </MaterialTable>
        </TableContainer>
      );
    }
  };

  const optworkshop = workshop?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });
  const optArea = area?.map((item) => {
    return {
      value: item.id,
      label: `№${item.number} ${item.name} `,
    };
  });
  const optequipment = equipment?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });

  const optWorkPlase = workplace?.map((item) => {
    return {
      value: item.id,
      label: `Рабочее место №${item.number}`,
    };
  });

  //Запрос на редактирование или добавление
  function SendData(variables) {
    variables["productionAreaId"] = valuetArea;
    variables["weldingEquipmentId"] = valuetEquipment;
    variables["workshopId"] = valueWorkshopa;
    variables["workplaceId"] = valueWorkplace;
    //Добавить
    if (valuetOpenModal === 0) {
      addExecutor(variables);
    }
    // //Редактировать
    if (valuetOpenModal === 1 && type === "master") {
      editMaster(variables);
    }
    if (valuetOpenModal === 1 && type === "executor") {
      editExecutor(variables);
    }
    if (valuetOpenModal === 1 && type === "controller") {
      editTech(variables);
    }
  }

  return (
    <>
      <div className={styles.tableWrapper}>
        <Table
          title="Сотрудники"
          isLoading={isRequesting}
          actions={
            userRole === "Admin" /* || userRole === "Master" */
              ? [
                  {
                    icon: "add",
                    tooltip: "Добавить пользователя",
                    isFreeAction: true,
                    onClick: () => {
                      setIsModalOpen(true);
                      setValuetOpenModal(0);
                      api.post(`/eventLog`, {
                        information:
                          "Открыл модальное окно добавления пользователя ",
                      });
                    },
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать пользователя",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                      setValuetOpenModal(1);
                      setvalueWorkplace(rowData?.workplace?.id);

                      setValueWorkshop(rowData?.workshop?.id);
                      setValuetArea(rowData?.productionArea?.id);
                      setValuetEquipment(rowData?.weldingEquipment?.id);
                      api.post(`/eventLog`, {
                        information:
                          "Открыл модальное окно редактирования пользователя",
                      });
                    },
                  },
                ]
              : []
          }
          renderRowChildren={renderRowChildren}
          rowStyle={classes.rowStyle}
          columns={type === "executor" ? extraUserColumns : controllerColumns}
          data={executors}
        />
      </div>

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
            SendData(variables, type);
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
                    if (/^[а-яА-ЯЁё\s]+$/.test(e.target.value)) {
                      handleChange(e);
                    }
                  }}
                  width="200"
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.middleName}
                  name="middleName"
                  placeholder="Фамилия"
                  onBlur={handleBlur}
                  autoComplete="off"
                />

                <Input
                  onChange={(e) => {
                    if (/^[а-яА-ЯЁё\s]+$/.test(e.target.value)) {
                      handleChange(e);
                    }
                  }}
                  width="200"
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.firstName}
                  name="firstName"
                  placeholder="Имя"
                  onBlur={handleBlur}
                  autoComplete="off"
                />
                <Input
                  onChange={(e) => {
                    if (/^[а-яА-ЯЁё\s]+$/.test(e.target.value)) {
                      handleChange(e);
                    }
                  }}
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.lastName}
                  name="lastName"
                  placeholder="Отчество"
                  onBlur={handleBlur}
                  autoComplete="off"
                />
              </div>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{ height: 40, width: 562 }}
                  value={values.rfidTag}
                  name="rfidTag"
                  placeholder="RFID метка "
                  onBlur={handleBlur}
                  autoComplete="off"
                />
              </div>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    if (/^[а-яА-ЯЁё\s]+$/.test(e.target.value)) {
                      handleChange(e);
                    }
                  }}
                  style={{ height: 40, width: 562 }}
                  value={values.position}
                  name="position"
                  placeholder="Должность"
                  onBlur={handleBlur}
                  autoComplete="off"
                />
              </div>
              <div className={styles.row}>
                <Input
                  onChange={handleChange}
                  style={{ height: 40, width: 562 }}
                  value={values.serviceNumber}
                  name="serviceNumber"
                  placeholder="Табельный номер"
                  type="number"
                  min="0"
                  step="1"
                  onBlur={handleBlur}
                  autoComplete="off"
                />
              </div>
              <div className={styles.row}>
                <Select
                  name="valuetArea"
                  width="380px"
                  value={valuetArea}
                  placeholder="Производственные участки"
                  onChange={(event) => setValuetArea(event.value)}
                  options={optArea}
                />
              </div>
              <div className={styles.row}>
                <Select
                  name="valueWorkshopa"
                  value={valueWorkshopa}
                  width="380px"
                  placeholder="Цех"
                  onChange={(event) => {
                    setValueWorkshop(event.value);
                  }}
                  options={optworkshop}
                />
              </div>

              {value === 1 ? (
                <div className={styles.row}>
                  <Select
                    name="valueWorkplace"
                    value={valueWorkplace}
                    width="380px"
                    placeholder="Рабочее место"
                    onChange={(event) => {
                      setvalueWorkplace(event.value);
                    }}
                    options={optWorkPlase}
                  />
                </div>
              ) : null}

              {userRole === "Admin" /* || userRole === "Master" */ ? (
                <Upload tool={0} Masters={executors}></Upload>
              ) : null}

              <div className={styles.row}>
                <Button
                  disabled={
                    values.middleName == "" ||
                    values.firstName == "" ||
                    values.lastName == "" ||
                    values.rfidTag == ""
                  }
                  type="submit"
                >
                  {modalData ? "Сохранить" : "Создать"}
                </Button>
              </div>
            </form>
          )}
        </Formik>
      </ModalWindow>

      {/*Удаление сотрудника*/}
      <ModalWindow
        isOpen={deleteTaskModal}
        headerText="Удаление"
        setIsOpen={(state) => {
          setdeleteTaskModal(false);
        }}
        wrapperStyles={{ width: 420 }}
      >
        <Formik
          initialValues={initialValues}
          enableReinitialize
          onSubmit={(variables) => {
            const { id, ...dataToSend } = variables;
            setdeleteTaskModal(false);
            deleteExecutor(idExecutor);
          }}
        >
          {({
            handleSubmit,
            handleChange,
            values,
            setFieldValue,
            handleBlur,
          }) => (
            <form onSubmit={handleSubmit}>
              <div>
                <h4 style={{ padding: "35px 40px" }}>
                  Вы уверены что хотите <span>удалить</span> сотрудника ?{" "}
                </h4>

                <div className={styles.row}>
                  <Button type="submit">Удалить</Button>
                </div>
              </div>
            </form>
          )}
        </Formik>
      </ModalWindow>
    </>
  );
};
