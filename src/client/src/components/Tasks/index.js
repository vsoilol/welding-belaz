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
    loadInstructions();
  }, [loadInstructions, loadMasters, loadTasks, loadTechs]);

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
      title: "№ задания»",
      field: "id",
    },
    {
      title: "Наименование (маркировка сварного соединения)",
      field: "weldingConnectionName",
    },
    { title: "Объект", field: "object" },

    { title: "Участок/цех", field: "sector" },
    {
      title: "Дата выполнения",
      field: "finishedAt",
      render: (rowData) => (
        <span>
          {rowData?.finishedAt ? new Date(rowData?.finishedAt).toLocaleDateString(
            "ru-RU",
            dateOptions
          ) : "Не завершено"}
        </span>
      ),
    },
    {
      title: "Руководитель сварочных работ",
      field: "masterId",
      render: (rowData) => {
        const master = masters.find(
          (mater) => mater.masterId === rowData?.master?.masterId
        );
        return (
          <p>
            {master?.surname} {master?.name} {master?.patronymic}
          </p>
        );
      },
    },
    {
      title: "Исполнитель",
      field: "masterId",
      render: (rowData) => {
        const master = masters.find(
          (mater) => mater.masterId === rowData?.master?.masterId
        );
        return (
          <p>
            Иванов Алексей Валентинович
          </p>
        );
      },
    },
    {
      title: "Контролера",
      field: "masterId",
      render: (rowData) => {
        const master = masters.find(
          (mater) => mater.masterId === rowData?.master?.masterId
        );
        return (
          <p>
            Дубровский Александр Алексеевич
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
        render: (rowData) => (
          <span>{rowData.numb_seam}</span>
        ),
      },
      {
        title: "Номер детали",
        render: (rowData) => (
          <span>{rowData.numb_detals}</span>
        ),
      },
      {
        title: "Номер узла",
        render: (rowData) => (
          <span>{rowData.numb_node}</span>
        ),
      },
      {
        title: "Номер изделие",
        render: (rowData) => (
          <span>{rowData.numb_goods}</span>
        ),
      },
      {
        title: "Наименование   технологического процесса  ",
        render: (rowData) => (
          <span>{rowData.name_technological_process}</span>
        ),
      },
      {
        title: "Номер  технологического процесса  ",
        render: (rowData) => (
          <span>{rowData.numb_technological_process}</span>
        ),
      },
    ],

    detals: [
      {
        title: "Наименование",
        render: (rowData) => (
          <span>{rowData.numb_seam}</span>
        ),
      },
      {
        title: "Номер шва",
        render: (rowData) => (
          <span>{rowData.numb_seam}</span>
        ),
      },
      {
        title: "Номер детали",
        render: (rowData) => (
          <span>{rowData.numb_detals}</span>
        ),
      },
      {
        title: "Номер узла",
        render: (rowData) => (
          <span>{rowData.numb_node}</span>
        ),
      },
      {
        title: "Номер изделие",
        render: (rowData) => (
          <span>{rowData.numb_goods}</span>
        ),
      },
      {
        title: "Наименование   технологического процесса  ",
        render: (rowData) => (
          <span>{rowData.name_technological_process}</span>
        ),
      },
      {
        title: "Номер  технологического процесса  ",
        render: (rowData) => (
          <span>{rowData.numb_technological_process}</span>
        ),
      },
    ],

    temperatura: [
      {
        title: "Температура окружающей среды",
        render: (rowData) => (
          <span>{rowData.param1}</span>
        ),
      },
      {
        title: "Влажность воздуха",
        render: (rowData) => (
          <span>{rowData.param2}</span>
        ),
      },
      {
        title: "Межслойная температура",
        render: (rowData) => (
          <span>{rowData.param3}</span>
        ),
      },
      {
        title: "Номер текущего слоя",
        render: (rowData) => (
          <span>{rowData.param4}</span>
        ),
      },
      {
        title: "Температура предварительного нагрева",
        render: (rowData) => (
          <span>{rowData.param5}</span>
        ),
      },
      {
        title: "Усредненные значения сварочного тока и напряжения на дуге",
        render: (rowData) => (
          <span>{rowData.param6}</span>
        ),
      },
    ]

  }

  const columns_dataDetals = {

    seam: [
      // {
      //   name_node:"",
      //   numb_node:"",
      //   numb_workshops:"",
      //   numb_production_sites:"",
      //   numb_jobs_place:"",
      //   name_technological_process:"",
      //   numb_technological_process:""
      // },

    ],
    detals: [

    ],

    temperatura: [  ]

  }


  for (let index = 0; index < 17; index++) {
    columns_dataDetals.seam.push({
      numb_detals: `Деталь ${index + 1}`,
      numb_seam: `Шов ${index + 1}`,
      numb_node: `Узел ${index + 1}`,
      numb_goods: `Изделие ${index + 1}`,
      name_technological_process: `Технологический процесс  ${index + 1} `,
      numb_technological_process: `3886:${index}`
    }
    )
    columns_dataDetals.detals.push({
      numb_detals: `Деталь ${index + 1}`,
      numb_seam: `Шов ${index + 1}`,
      numb_node: `Узел ${index + 1}`,
      numb_goods: `Изделие ${index + 1}`,
      name_technological_process: `Технологический процесс  ${index + 1} `,
      numb_technological_process: `3886:${index}`
    }
    )
    columns_dataDetals.temperatura.push({
       param1:`3${index + 1} °C`,
       param2:`3${index + 1}—6${index + 1} %`,
       param3:`5${index + 1} °C`,
       param4:`${index + 10}`,
       param5:`4${index + 1} °C`,
       param6:`1${index + 1} - 3${index + 1}`,
    }
    )
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
          style={{ minWidth: "800px", }}
        >
          <Table
            title="Сменные задания на сварку"
            columns={columns}
            data={tasks}
            isLoading={isRequesting}
            renderRowChildren={renderRowChildren}
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
            data={columns_dataDetals.seam}
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
            data={columns_dataDetals.seam}
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
            data={columns_dataDetals.temperatura}
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
