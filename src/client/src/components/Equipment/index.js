import Paper from "@material-ui/core/Paper";
import MaterialTable from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import SaveIcon from "@material-ui/icons/Save";
import { equipmentImage } from "assets/pics";
import Button from "components/shared/Button";
import EquipmentMap from "components/Map";
import Modal from "components/shared/Modal";
import Input from "components/shared/Input";
import ModalWindow from "components/shared/ModalWindow";
import { ResultsModal } from "components/shared/ResultsModal";
import Select from "components/shared/Select";
import { Table } from "components/shared/Table";
import ToolTip from "components/shared/ToolTip";
import { Formik } from "formik";
import React, { useEffect, useState } from "react";
import styles from "./styles.module.css";




import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";


const dateOptions = {
  day: "numeric",
  month: "short",
  year: "numeric",
};

export const Equipment = ({
  loadEquipment,
  loadMasters,
  equipment,
  addEquipment,
  deleteEquipment,
  editEquipment,
  isRequesting,
  masters,
  userRole,
}) => {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [modalData, setModalData] = useState(null);
  const [isResultsModalOpen, setIsResultsModalOpen] = useState(false);
  const [activeEquipment, setActiveEquipment] = useState("");
  const [open, setOpen] = useState(false);

  const initialValues = {
    machineId: modalData?.machineId ?? "",
    name: modalData?.name ?? "",
    serialNum: modalData?.serialNum ?? "",
    photoName: modalData?.photoName ?? "",
    nextInspectionDate: modalData?.nextInspectionDate ?? "",
    weldingProcess: modalData?.weldingProcess ?? "",
    weldingMethod: modalData?.weldingMethod ?? "",
    noLoadVoltage: modalData?.noLoadVoltage ?? "",
    minCurrentValue: modalData?.minCurrentValue ?? "",
    maxCurrentValue: modalData?.maxCurrentValue ?? "",
    minVoltageValue: modalData?.minVoltageValue ?? "",
    maxVoltageValue: modalData?.maxVoltageValue ?? "",
    loadPercentage: modalData?.loadPercentage ?? "",
    masterId: modalData?.master?.masterId ?? "",
  };

  const formattedMasters = masters?.map((item) => {
    return {
      value: item.masterId,
      label: `${item.surname} ${item.name}`,
    };
  });

  useEffect(() => {
    loadEquipment();
    loadMasters();
  }, [loadEquipment, loadMasters]);



  const columns = [
    { title: "Наименование", field: "name" },
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
            "https://semantic-ui.com/images/wireframe/white-image.png"
          }
          alt=""
        />
      ),
    },
    { title: "Маркировка", field: "serialNum" },
    { title: "RFID метка", field: "machineId" },
    {
      title: "Процесс сварки",
      field: "weldingProcess",
      render: (rowData) => <p>{rowData.weldingProcess}</p>,
    },
    {
      title: "Способ сварки",
      field: "weldingMethod",
      render: (rowData) => <p>{rowData.weldingMethod}</p>,
    },
    {
      title: "Дата очередной аттестации (ППР)",
      field: "nextInspectionDate",
      type: "date",
      render: (rowData) => (
        <span>
          {new Date(rowData?.nextInspectionDate).toLocaleDateString(
            "ru-RU",
            dateOptions
          )}
        </span>
      ),
    },
    {
      title: "Закреплено",
      field: "masterId",
      render: (rowData) => {
        const master = masters.find(
          (item) => item.masterId === rowData?.master?.masterId
        );
        return (
          <p>
            {master?.surname} {master?.name} {master?.patronymic}
          </p>
        );
      },
    },
    {
      title: "Серийный (инвентарный) номер",
      field: "serialNum",
      render: (rowData) => {
        return (
          <p>{rowData.serialNum}</p>
        );
      },

    },

    /////Новые поля
    {
      title: "Заводской (инвентарный) номер",
      render: (rowData) => {
        return (
          <p>"заводской (инвентарный) номер"</p>
        );
      },

    },
    {
      title: "Дата ввода в эксплуатацию",
      render: (rowData) => {
        return (
          <p>"дата ввода в эксплуатацию"</p>
        );
      },

    },
    {
      title: "Габариты",
      render: (rowData) => {
        return (
          <p>"габариты"</p>
        );
      },

    },
    {
      title: "Номер группы оборудования",
      render: (rowData) => {
        return (
          <p>"номер группы оборудования"</p>
        );
      },
    },
    {
      title: "Наименование изготовителя",
      render: (rowData) => {
        return (
          <p>"наименование изготовителя"</p>
        );
      },
    },
    {
      title: "Дата очередной аттестации",
      render: (rowData) => {
        return (
          <p>"дата очередной аттестации"</p>
        );
      },

    },
    {
      title: "Ф.И.О ответственного",
      render: (rowData) => {
        return (
          <p>"Ф.И.О ответственного"</p>
        );
      },

    },
    {
      title: "Процесс (способ) сварки",
      render: (rowData) => {
        return (
          <p>"процесс (способ) сварки"</p>
        );
      },
    },
    {
      title: "Напряжение холостого хода",
      render: (rowData) => {
        return (
          <p>"напряжение холостого хода"</p>
        );
      },
    },
    {
      title: "Допустимые диапазоны сварочного тока и напряжения на дуге (min и max)",
      render: (rowData) => {
        return (
          <p>" (min и max)"</p>
        );
      },
    },
    {
      title: "Продолжительность включения (нагрузки)",
      render: (rowData) => {
        return (
          <p>" продолжительность включения (нагрузки)"</p>
        );
      },
    },
    {
      title: "Номер поста",
      render: (rowData) => {
        return (
          <p>"номер поста"</p>
        );
      },
    },
    {
      title: "На котором находится оборудование (при наличии))",
      render: (rowData) => {
        return (
          <p>"на котором находится оборудование (при наличии))"</p>
        );
      },
    }, 
    {
      field: "link",
      title: "Отчет",
      render: (rowData) => (
        <div
          onClick={() => {
            setIsResultsModalOpen(true);
            setActiveEquipment(rowData?.machineId);
          }}
        >
          <SaveIcon />
        </div>
      ),
      width: 54,
    },
  ];

  const columns2 = [
    {
      title: "Время изменения состояния",
      render: (rowData) => {
        return (
          <p>"время изменения состояния"</p>
        );
      },
    },
    {
      title: "Текущее состояние",
      render: (rowData) => {
        return (
          <p>"текущее состояние"</p>
        );
      },
    },
    {
      title: "Причина простоя",
      render: (rowData) => {
        return (
          <p>" причину простоя"</p>
        );
      },
    },
  ]

  const requiredKeys = ["name", "nextInspectionDate"];

  const handleOpen = () => {
    setOpen(true);
  };



  const renderRowChildren = (rowData) => {
    return (
      rowData && (
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
                  Процесс сварки
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                >
                  Способ сварки
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                >
                  Напряжение холостого хода, В
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                  colSpan={2}
                >
                  Диапазон сварочного тока, А
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                  colSpan={2}
                >
                  Диапазон напряжения на дуге, В
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                >
                  Продолжительность включения/нагрузки, %
                </TableCell>
              </TableRow>
              <TableRow>
                <TableCell />
                <TableCell />
                <TableCell />
                <TableCell align="center">min</TableCell>
                <TableCell align="center">max</TableCell>
                <TableCell align="center">min</TableCell>
                <TableCell align="center">max</TableCell>
                <TableCell />
              </TableRow>
            </TableHead>
            <TableBody>
              <TableRow>
                <TableCell align="center" component="th" scope="row">
                  {rowData?.weldingProcess ?? "-"}
                </TableCell>
                <TableCell align="center" component="th" scope="row">
                  {rowData?.weldingMethod ?? "-"}
                </TableCell>
                <TableCell align="center" component="th" scope="row">
                  {rowData?.noLoadVoltage ?? "-"}
                </TableCell>
                <TableCell align="center">
                  {rowData?.minCurrentValue ?? "-"}
                </TableCell>
                <TableCell align="center">
                  {rowData?.maxCurrentValue ?? "-"}
                </TableCell>
                <TableCell align="center">
                  {rowData?.minVoltageValue ?? "-"}
                </TableCell>
                <TableCell align="center">
                  {rowData?.maxVoltageValue ?? "-"}
                </TableCell>
                <TableCell align="center" component="th" scope="row">
                  {rowData?.loadPercentage ?? "-"}
                </TableCell>
              </TableRow>
            </TableBody>
          </MaterialTable>
        </TableContainer>
      )
    );
  };


  

  const [value_panel, setValue] = useState(0);
  const ChangePanels = (event, newValue) => {
    setValue(newValue);
  };
  const TabPanel = (props_panel) => {
    const { children, value, indPanel } = props_panel;
    return (
      <div hidden={value !== indPanel}  >
        {children}
      </div>
    );
  };

  ////////////////////////////////////////////////////////////////////
  return (

    <div className={styles.innerWrapper}>
      <ToolTip
        title="Оборудование"
        toolTipText="Здесь Вы можете просмотреть оборудование, его технические характеристики, отчет о работе"
        src={equipmentImage}
        button={
          <button type="button" className={styles.button} onClick={handleOpen}>
            Оборудование на карте
          </button>
        }
      />
      {open ? (
        <Modal
          open={open}
          setOpen={setOpen}
          children={<EquipmentMap equipment={equipment} />}
        />
      ) : null}

      <Tabs
        value={value_panel}
        onChange={ChangePanels}
        indicatorColor="primary"
        textColor="primary"
        aria-label="full width tabs example"
      >
        <Tab label="Сварочное оборудование" />
        <Tab label="Простои оборудования " />
      </Tabs>


      <div className={styles.tableWrapper}>
        {/*Сварочное оборудование*/}
        <TabPanel 
          value={value_panel}
          indPanel={0}
          style={{  minWidth: "800px", }}
        >
             <Table
                title="Сварочное оборудование "
                columns={columns}
                data={equipment}
                isLoading={isRequesting}
                actions={
                  userRole === "admin"
                    ? [
                      {
                        icon: "add",
                        tooltip: "Добавить оборудование",
                        isFreeAction: true,
                        onClick: () => setIsModalOpen(true),
                      },
                      {
                        icon: "edit",
                        tooltip: "Редактировать оборудование",
                        onClick: (event, rowData) => {
                          setModalData(rowData);
                          setIsModalOpen(true);
                        },
                      },
                    ]
                    : []
                }
                renderRowChildren={renderRowChildren}
                deleteAction={userRole === "admin" ? deleteEquipment : null}
              />
        </TabPanel> 
        {/*Простои оборудования*/}
        <TabPanel 
          value={value_panel}
          indPanel={1}
          style={{  minWidth: "800px", }}
        >
             <Table
                title="Простои оборудования "
                columns={columns2}
                data={equipment}
                isLoading={isRequesting}
                actions={
                  userRole === "admin"
                    ? [
                      {
                        icon: "add",
                        tooltip: "Добавить оборудование",
                        isFreeAction: true,
                        onClick: () => setIsModalOpen(true),
                      },
                      {
                        icon: "edit",
                        tooltip: "Редактировать оборудование",
                        onClick: (event, rowData) => {
                          setModalData(rowData);
                          setIsModalOpen(true);
                        },
                      },
                    ]
                    : []
                } 
                deleteAction={userRole === "admin" ? deleteEquipment : null}
              />
        </TabPanel> 
        
      </div>
      <ResultsModal
        type={"EQUIPMENT"}
        activeId={activeEquipment}
        isOpen={isResultsModalOpen}
        setIsOpen={setIsResultsModalOpen}
      />
      <ModalWindow
        isOpen={isModalOpen}
        headerText={
          modalData ? "Редактировать оборудование" : "Добавить оборудование"
        }
        setIsOpen={(state) => {
          setIsModalOpen(state);
          setModalData(null);
        }}
        wrapperStyles={{ width: 420 }}
      >
        <Formik
          initialValues={initialValues}
          enableReinitialize
          onSubmit={(variables) => {
            const { id, ...dataToSend } = variables;
            modalData
              ? editEquipment({ ...variables })
              : addEquipment({ ...dataToSend });
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
            <form onSubmit={handleSubmit}>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  width="200"
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.name}
                  name="name"
                  placeholder="Наименовние"
                  onBlur={handleBlur}
                />
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  width="200"
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.serialNum}
                  name="serialNum"
                  placeholder="Маркировка"
                  onBlur={handleBlur}
                />
              </div>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
                  value={values.photoName}
                  name="photoName"
                  placeholder="Фото"
                  onBlur={handleBlur}
                />
              </div>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  width="200"
                  style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
                  value={values.nextInspectionDate}
                  name="nextInspectionDate"
                  placeholder="Дата очередной аттестации (ППР)»"
                  type="text"
                  onFocus={(e) => {
                    e.currentTarget.type = "date";
                  }}
                  onBlur={handleBlur}
                />
              </div>
              <div className={styles.row}>
                <Select
                  name="masterId"
                  value={values.masterId}
                  width="380px"
                  placeholder="Мастер"
                  onChange={(e) => {
                    setFieldValue("masterId", e.value);
                  }}
                  options={formattedMasters}
                />
              </div>
              <p className={styles.text}>Режим работы</p>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{
                    width: 180,
                    height: 40,
                    paddingLeft: 20,
                  }}
                  value={values.weldingProcess}
                  name={`weldingProcess`}
                  placeholder="Процесс сварки"
                />
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{
                    width: 180,
                    height: 40,
                    paddingLeft: 20,
                  }}
                  value={values.weldingMethod}
                  name={`weldingMethod`}
                  placeholder="Способ сварки"
                />
              </div>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{
                    width: 380,
                    height: 40,
                    paddingLeft: 20,
                  }}
                  value={values.noLoadVoltage}
                  name={`noLoadVoltage`}
                  placeholder="Напряжение холостого хода"
                />
              </div>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{
                    width: 380,
                    height: 40,
                    paddingLeft: 20,
                  }}
                  value={values.loadPercentage}
                  name={`loadPercentage`}
                  placeholder="Продолжительность нагрузки, %"
                />
              </div>
              <p className={styles.text}>Диапазон сварочного тока:</p>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{
                    width: 180,
                    height: 40,
                    paddingLeft: 20,
                  }}
                  value={values.minCurrentValue}
                  name={`minCurrentValue`}
                  placeholder="min"
                  onBlur={handleBlur}
                />
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{
                    width: 180,
                    height: 40,
                    paddingLeft: 20,
                  }}
                  value={values.maxCurrentValue}
                  name={`maxCurrentValue`}
                  placeholder="max"
                />
              </div>
              <p className={styles.text}>Диапазон напряжения на дуге:</p>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{
                    width: 180,
                    height: 40,
                    paddingLeft: 20,
                  }}
                  value={values.minVoltageValue}
                  name={`minVoltageValue`}
                  placeholder="min"
                />
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{
                    width: 180,
                    height: 40,
                    paddingLeft: 20,
                  }}
                  value={values.maxVoltageValue}
                  name={`maxVoltageValue`}
                  placeholder="max"
                />
              </div>
              {!modalData && (
                <div className={styles.row}>
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{
                      width: 380,
                      height: 40,
                    }}
                    value={values.machineId}
                    name={`machineId`}
                    placeholder="RFID метка"
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
    </div>
  );
};
