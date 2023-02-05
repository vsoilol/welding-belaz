import SaveIcon from "@material-ui/icons/Save";
import { tasksImage } from "assets/pics";
import Button from "components/shared/Button";
import Input from "components/shared/Input";
import ModalWindow from "components/shared/ModalWindow";
import Select from "components/shared/Select";
import { Table } from "components/shared/Table";
import ToolTip from "components/shared/ToolTip";
import { Formik } from "formik";
import React, { useEffect, useState } from "react";
import api from "services/api";
import styles from "./styles.module.css";
import errorActions from "store/error/actions";
import { useDispatch } from "react-redux";


import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";

const {
  Creators: { setError },
} = errorActions;

const dateOptions = {
  day: "numeric",
  month: "short",
  year: "numeric",
};

export const Tasks = ({
  loadTasks, 
  loadInfo,
  info,
  tasks,
  addTask,
  deleteTask,
  editTask,
  loadTechs,
  loadInstructions,
  techs,
  isRequesting,
  instructions,
  loadMasters,
  masters,
  userRole,


  loadSeam,
  seam
  
}) => {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [modalData, setModalData] = useState(null);
  const dispatch = useDispatch();

  const formattedMasters = masters?.map((item) => {
    return {
      value: item.masterId,
      label: `${item.surname} ${item.name}`,
    };
  });

  const initialValues = {
    object: modalData?.object ?? "",
    weldingConnectionName: modalData?.weldingConnectionName ?? "",
    sector: modalData?.sector ?? "",
    generalMaterial: modalData?.generalMaterial ?? "",
    weldingElectrodes: modalData?.weldingElectrodes ?? "",
    weldingWire: modalData?.weldingWire ?? "",
    technicalControllerId: modalData?.technicalController?.techUserId ?? "",
    masterId: modalData?.master?.masterId ?? "",
    instructionId: modalData?.instruction.id ?? "",
    id: modalData?.id ?? "",
  };

  const requiredKeys = [
    "object",
    "sector",
    "weldingConnectionName",
    "technicalControllerId",
    "weldingElectrodes",
    "generalMaterial",
    "weldingWire",
    "instructionId",
  ];

  useEffect(() => {
    loadTasks();
    loadTechs();
    loadMasters();
    // loadInstructions();
    // loadInfo();
    loadSeam();
  }, [//loadInstructions,
   loadMasters, loadTasks, loadTechs,
     //loadInfo,
   loadSeam]);

  const formattedTechs = techs?.map((item) => {
    return {
      value: item?.techUserId,
      label: `${item?.surname} ${item?.name}`,
    };
  });

  const formattedInstructions = instructions?.map((item) => {
    return {
      value: item?.id,
      label: item?.otkName,
    };
  });

  const getDocument = (activeId) => {
    api
      .get(`/reports/passportReport/${activeId}`, {
        responseType: "arraybuffer",
        dataType: "blob",
      })
      .then((response) => {
        const file = new Blob([response["data"]], {
          type: "application/pdf",
        });

        const fileURL = URL.createObjectURL(file);
        window.open(fileURL);
      })
      .catch((error) => dispatch(setError(error?.response?.data?.title ?? "")));
  };

  const columns = [
    {
      title: "№ задания»", field: "number",
    },
    {
      title: "Исполнитель",
      field: "masterId",
      render: (rowData) => {
        return (
          <p>{`
            ${rowData.welder.middleName} 
            ${rowData.welder.firstName} 
            ${rowData.welder.lastName}
            `} 
          </p>
        );
      },
    },
    {
      title: "Руководитель сварочных работ",
      field: "masterId",
      render: (rowData) => {
        return (
          <p>{`
            ${rowData.master.middleName} 
            ${rowData.master.firstName} 
            ${rowData.master.lastName}
            `} 
          </p>
        );
      },
    },
    {
      title: "Контролер",
      field: "masterId",
      render: (rowData) => {
        return (
          <p>{`
            ${rowData.inspector.middleName} 
            ${rowData.inspector.firstName} 
            ${rowData.inspector.lastName}
            `} 
          </p>
        );
      },
    }, 
    {
      field: "url",
      title: "Скачать паспорт",
      render: (rowData) => (
        <div
          onClick={() => getDocument(rowData?.id)}
          className={styles.downloadButton}
        >
          <SaveIcon />
        </div>
      ),
      width: 54,
    },
  ];

  const renderRowChildren = (rowData) => {
    return (
      <div className={styles.column}>
        <p className={styles.bold}>Общая информация</p>
        <p>Номер задания: {rowData?.taskId}</p>
        <p>
          Операционная технологическая карта:{" "}
          <a
            // className={styles.link}
            target="_blank"
            rel="noopener noreferrer"
            href={rowData?.instruction?.link}
          >
            {rowData?.instruction?.name ?? "---"}
          </a>
        </p>
        <p>
          Технический надзор:{" "}
          {rowData?.technicalController?.userData?.surname ?? "---"}
        </p>
        <div>
          <p className={styles.bold}>Материалы</p>
          <div>
            <p>
              Основной материал/номер партии:{" "}
              {rowData?.generalMaterial ?? "---"}
            </p>
            <p>
              Сварочные электроды/номер партии:{" "}
              {rowData?.weldingElectrodes ?? "---"}
            </p>
            <p>
              Сварочная проволока/номер партии: {rowData?.weldingWire ?? "---"}
            </p>
          </div>
        </div>
      </div>
    );
  };


  ////////////////////////////////////////////////////////////////////
  const columns_data = {

    seam: [
      {
        title: "Номер шва", 
        field:"number"
      },
      {
        title: "Номер детали", 
        field:"product.number"
      },
      {
        title: "Номер узла", 
        field:"product.productType"
      },
      {
        title: "Номер изделие", 
        field:"product.number"
      },
      {
        title: "Наименование   технологического процесса  ", 
        field:"technologicalProcess.name"
      },
      {
        title: "Номер  технологического процесса  ", 
        field:"technologicalProcess.number"
      },
    ],

    detals: [
      {
        title: "Наименование", 
        field:"product.name"
      },
      {
        title: "Номер шва", 
        field:"number"
      },
      {
        title: "Номер детали", 
        field:"product.number"
      },
      {
        title: "Номер узла", 
        field:"product.productType"
      },
      {
        title: "Номер изделие", 
        field:"product.number"
      },
      {
        title: "Наименование   технологического процесса  ", 
        field:"technologicalProcess.name"
      },
      {
        title: "Номер  технологического процесса  ", 
        field:"technologicalProcess.number"
      },
    ],

    temperatura: [
      {
        title: "Температура окружающей среды (°C)",
        render: (rowData) => {
          return (
            <p>
              {`${rowData.ambientTemperature}`}
            </p>
          );
        }, 
      },
      {
        title: "Влажность воздуха (%)",
        field: "airHumidity",
      },
      {
        title: "Межслойная температура (°C)",
        field: "interlayerTemperature",
      },
      {
        title: "Номер текущего слоя",
        field: "currentLayerNumber",
      },
      {
        title: "Температура предварительного нагрева (°C)",
        field: "preheatingTemperature",
      },
      {
        title: "Усредненные значения сварочного тока и напряжения на дуге",
        field: "arcVoltageValues[0]",
      },
    ]

  } 
 
 


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
        title="Задания"
        toolTipText="Здесь Вы можете назначить задания на сварку, посмотреть паспорт сварного стыка"
        src={tasksImage}
      />


      <Tabs
        value={value_panel}
        onChange={ChangePanels}
        indicatorColor="primary"
        textColor="primary"
        aria-label="full width tabs example"
      >
        <Tab label="Сменные задания на сварку " />
        <Tab label="Сварные швы деталей, узлов и изделий" />
        <Tab label="Данные об изготовленных изделиях" />
        <Tab label="Температура окружающей среды" />
      </Tabs>

      <div className={styles.tableWrapper}>

        {/*Сменные задания на сварку*/}
        <TabPanel
          value={value_panel}
          indPanel={0}
          style={{ minWidth: "800px",}} 
        >
          <Table
            title="Сменные задания на сварку"
            columns={columns}
            data={tasks} 
            isLoading={isRequesting} 
            deleteAction={
              userRole === "admin" || userRole === "master" ? deleteTask : null
            }
            actions={
              userRole === "admin" || userRole === "master"
                ? [
                  {
                    icon: "add",
                    tooltip: "Создать задачу",
                    isFreeAction: true,
                    onClick: () => setIsModalOpen(true),
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать задачу",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                    },
                  },
                ]
                : []
            }
          />
        </TabPanel>
        {/*Сварные швы деталей, узлов и изделий*/}
        <TabPanel
          value={value_panel}
          indPanel={1}
          style={{ minWidth: "800px", }}
        >
          <Table
            title="Сварные швы деталей, узлов и изделий"
            columns={columns_data.seam}
            data={seam}
            isLoading={isRequesting}
            deleteAction={
              userRole === "admin" || userRole === "master" ? deleteTask : null
            }
            actions={
              userRole === "admin" || userRole === "master"
                ? [
                  {
                    icon: "add",
                    tooltip: "Создать задачу",
                    isFreeAction: true,
                    onClick: () => setIsModalOpen(true),
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать задачу",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                    },
                  },
                ]
                : []
            }
          />
        </TabPanel>

        {/*Данные об изготовленных изделиях*/}
        <TabPanel
          value={value_panel}
          indPanel={2}
          style={{ minWidth: "800px", }}
        >
          <Table
            title="Данные об изготовленных изделиях"
            columns={columns_data.detals} 
            data={seam}
            isLoading={isRequesting}
            deleteAction={
              userRole === "admin" || userRole === "master" ? deleteTask : null
            }
            actions={
              userRole === "admin" || userRole === "master"
                ? [
                  {
                    icon: "add",
                    tooltip: "Создать задачу",
                    isFreeAction: true,
                    onClick: () => setIsModalOpen(true),
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать задачу",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                    },
                  },
                ]
                : []
            }
          />
        </TabPanel>


        {/*Температура окружающей среды*/}
        <TabPanel
          value={value_panel}
          indPanel={3}
          style={{ minWidth: "800px", }}
        >
          <Table
            title="Температура окружающей среды"
            columns={columns_data.temperatura}
            data={info}
            isLoading={isRequesting}
            deleteAction={
              userRole === "admin" || userRole === "master" ? deleteTask : null
            }
            actions={
              userRole === "admin" || userRole === "master"
                ? [
                  {
                    icon: "add",
                    tooltip: "Создать задачу",
                    isFreeAction: true,
                    onClick: () => setIsModalOpen(true),
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать задачу",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                    },
                  },
                ]
                : []
            }
          />
        </TabPanel>


        <ModalWindow
          isOpen={isModalOpen}
          headerText={modalData ? "Редактировать задание" : "Добавить задание"}
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
                ? editTask({ ...variables })
                : addTask({ ...dataToSend });
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
                    style={{ height: 40, padding: "0 20px 0 30px" }}
                    value={values.object}
                    name="object"
                    placeholder="Объект"
                    onBlur={handleBlur}
                  />
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{ height: 40, padding: "0 20px 0 30px" }}
                    value={values.sector}
                    name="sector"
                    placeholder="Участок/цех"
                    onBlur={handleBlur}
                  />
                </div>
                <div className={styles.row}>
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
                    value={values.weldingConnectionName}
                    name="weldingConnectionName"
                    placeholder="Наименовние соединения"
                    onBlur={handleBlur}
                  />
                </div>
                <div className={styles.row}>
                  <Select
                    name="instructionId"
                    value={values.instructionId}
                    style={{ height: 40, padding: "0 20px 0 30px" }}
                    width="190px"
                    placeholder="Инструкция"
                    onChange={(e) => {
                      setFieldValue("instructionId", e.value);
                    }}
                    options={formattedInstructions}
                  />
                  <Select
                    name="masterId"
                    value={values.masterId}
                    width="186px"
                    placeholder="Руководитель сварочных работ"
                    onChange={(e) => {
                      setFieldValue("masterId", e.value);
                    }}
                    options={formattedMasters}
                  />
                </div>

                <div className={styles.row}>
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{ height: 40, padding: "0 20px 0 30px" }}
                    value={values.generalMaterial}
                    name="generalMaterial"
                    placeholder="Материал"
                    onBlur={handleBlur}
                  />
                  <Select
                    name="technicalControllerId"
                    value={values.technicalControllerId}
                    style={{ height: 40, padding: "0 20px 0 30px" }}
                    width="190px"
                    placeholder="Тех. надзор"
                    onChange={(e) => {
                      setFieldValue("technicalControllerId", e.value);
                    }}
                    options={formattedTechs}
                  />
                </div>
                <div className={styles.row}>
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{ height: 40, padding: "0 20px 0 30px" }}
                    value={values.weldingElectrodes}
                    name="weldingElectrodes"
                    placeholder="Электроды"
                    onBlur={handleBlur}
                  />
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{ height: 40, padding: "0 20px 0 30px" }}
                    value={values.weldingWire}
                    name="weldingWire"
                    placeholder="Проволока"
                    onBlur={handleBlur}
                  />
                </div>
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
    </div>
  );
};
