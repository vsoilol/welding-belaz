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
import imgcalendar from "assets/icons/calendar.png"; 
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

  const classes = useStyles();
  const initialValues = {
    id: modalData?.id ?? "",
    rfidTag: modalData?.rfidTag ?? "",
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
      render: (rowData) => {
        return <p>{rowData?.rfidTag ?? rowData?.idFromSystem}</p>;
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
        return (ReturnWorkshop(rowData.productionArea.id));
      },
    },
    {
      title: "Номер цеха",
      render: (rowData) => {
        return (ReturnWorkshopNumber(rowData.productionArea.id));
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
        if (rowData?.weldingEquipments && rowData?.weldingEquipments.length!=0) { 
          return (
            rowData.weldingEquipments?.map(equipments =>
              <div><a className={styles.equipmentRefs} href="/equipment">{equipments.factoryNumber ?? "-"}</a> </div>
            )
          )
        }
      },
    },
  ];

  const controllersColumns = [
    {
      title: "RFID-метка",
      render: (rowData) => {
        return <p>{rowData?.rfidTag ?? rowData?.idFromSystem}</p>;
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
        return (ReturnWorkshop(rowData.productionArea.id));
      },
    },
    {
      title: "Номер цеха",
      render: (rowData) => {
        return (ReturnWorkshopNumber(rowData.productionArea.id));
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
  ];

 

  function ReturnWorkshop(Area) {
    if (area != undefined) {
      for (let index = 0; index < area.length; index++) {
        if (area[index].id === Area) {
          return area[index].workshop.name
        }
      }
    }

  }

  function ReturnWorkshopNumber(Area) {
    if (area != undefined) {
      for (let index = 0; index < area.length; index++) {
        if (area[index].id === Area) {
          return area[index].workshop.number
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
    {
      title: "RFID-метка",
      render: (rowData) => {
        return <p>{rowData?.rfidTag ?? rowData?.idFromSystem}</p>;
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
        return (ReturnWorkshop(rowData.productionArea.id));
      },
    },
    {
      title: "Номер цеха",
      render: (rowData) => {
        return (ReturnWorkshopNumber(rowData.productionArea.id));
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
        if (rowData?.weldingEquipments && rowData?.weldingEquipments.length!=0) { 
          return (
            rowData.weldingEquipments?.map(equipments =>
              <div><a className={styles.equipmentRefs} href="/equipment">{equipments.factoryNumber ?? "-"}</a> </div>
            )
          )
        }
      },
    },
    {
      title: "Номер рабочего места",
      field: "workplaceNumber",
      render: (rowData) => {
        return <p>{renderValue(rowData.workplaceNumber)}</p>;
      },
    },
    {
      title: "Просмотреть календарь",
      render: (rowData) => {
        return <img onClick={e => OpenCalendar(rowData)} className={styles.imgcalendar} src={imgcalendar}></img>;
      },
    }
  ];

  const renderRowChildren = (rowData) => {

    if (rowData?.weldingEquipments?.length != 0) {
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

            {rowData?.weldingEquipments?.map(equipments =>
              <TableBody>
                <TableRow key={equipments.id}>
                  <TableCell align="center">
                    {equipments.rfidTag}
                  </TableCell>
                  <TableCell align="center">
                    {equipments.name}
                  </TableCell>
                  <TableCell align="center">
                    {equipments.marking}
                  </TableCell>
                  <TableCell align="center">
                    {equipments.factoryNumber}
                  </TableCell>
                  <TableCell align="center">
                    {equipments.commissioningDate}
                  </TableCell>
                  <TableCell align="center">
                    {renderConditionValue(
                      equipments.currentCondition
                    )}
                  </TableCell>
                </TableRow>
              </TableBody>
            )}
          </MaterialTable>


        </TableContainer>
      );
    }
  };

  function OpenCalendar(rowData) {
    window.localStorage.setItem("executorId", rowData.id)
    window.localStorage.setItem("executor", `Сварщик: ${rowData.middleName} ${rowData.firstName} ${rowData.lastName}`)
    window.localStorage.removeItem("equipmentId")
    setTimeout(() => {
      window.location.href = "/calendar"
    }, 500);
  }

  const optworkshop = workshop?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });
  const optArea = area?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });
  const optequipment = equipment?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });
  //Запрос на редактирование или добавление
  function SendData(variables) {

    variables["productionAreaId"] = valuetArea
    variables["weldingEquipmentId"] = valuetEquipment
    variables["workshopId"] = valueWorkshopa

    //Добавить  
    if (valuetOpenModal === 0) {
      addExecutor(variables)
    }
    // //Редактировать 
    if (valuetOpenModal === 1 && type === "master") {
      editMaster(variables)
    }
    if (valuetOpenModal === 1 && type === "executor") {
      editExecutor(variables)
    }
    if (valuetOpenModal === 1 && type === "controller") {
      editTech(variables)
    }
  }
  function DisplaySelects(params) {

    if (params.select === "master") {
      return (
        <div>

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
                setValueWorkshop(event.value)
              }}
              options={optworkshop}
            />
          </div>
          {/* <div className={styles.row}>
            <Select
              name="valuetEquipment"
              width="380px"
              value={valuetEquipment}
              placeholder="Оборудование"
              onChange={(event) => setValuetEquipment(event.value)}
              options={optequipment}
            />
          </div> */}
        </div>
      )
    }
    if (params.select === "executor") {
      return (
        <div>
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
          {/* <div className={styles.row}>
            <Select
              name="valuetEquipment"
              width="380px"
              value={valuetEquipment}
              placeholder="Оборудование"
              onChange={(event) => setValuetEquipment(event.value)}
              options={optequipment}
            />
          </div> */}
          <div className={styles.row}>
            <Select
              name="valueWorkshopa"
              value={valueWorkshopa}
              width="380px"
              placeholder="Цех"
              onChange={(event) => {
                setValueWorkshop(event.value)
              }}
              options={optworkshop}
            />
          </div>
        </div>
      )
    }
    if (params.select === "controller") {
      return (
        <div>
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
        </div>
      )
    }
  }
  return (
    <>
      <div className={styles.tableWrapper}>
        <Table
          title="Сотрудники"
          isLoading={isRequesting}
          actions={
            userRole === "Admin"
              ? [
                {
                  icon: "add",
                  tooltip: "Добавить пользователя",
                  isFreeAction: true,
                  onClick: () => { setIsModalOpen(true); setValuetOpenModal(0) },
                },
                {
                  icon: "edit",
                  tooltip: "Редактировать пользователя",
                  onClick: (event, rowData) => {
                    setModalData(rowData);
                    setIsModalOpen(true);
                    setValuetOpenModal(1);

                    setValueWorkshop(rowData.workshop?.id)
                    setValuetArea(rowData.productionArea.id)
                    setValuetEquipment(rowData.weldingEquipment?.id)
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
            SendData(variables, type)
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
                  value={values.middleName}
                  name="middleName"
                  placeholder="Фамилия"
                  onBlur={handleBlur}
                />


                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  width="200"
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.firstName}
                  name="firstName"
                  placeholder="Имя"
                  onBlur={handleBlur}
                />
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.lastName}
                  name="lastName"
                  placeholder="Отчество"
                  onBlur={handleBlur}
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
                />
              </div>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{ height: 40, width: 562 }}
                  value={values.position}
                  name="position"
                  placeholder="Должность"
                  onBlur={handleBlur}
                />
              </div>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{ height: 40, width: 562 }}
                  value={values.serviceNumber}
                  name="serviceNumber"
                  placeholder="Табельный номер"
                  onBlur={handleBlur}
                />
              </div>
              <DisplaySelects select={type} />


              <div className={styles.row}>
                <Button
                  disabled={
                    values.middleName == "" || values.firstName == "" || values.lastName == "" || values.rfidTag == ""
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
    </>
  );
};
