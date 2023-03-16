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

import { DailyPlan } from "./DailyPlan";

import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";
import { array } from "yup";




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
  // loadInstructions,
  techs,
  isRequesting,
  instructions,
  loadMasters,
  masters,
  userRole,
  equipment,


  loadSeam,
  seam,


  loadProduct,
  loadKnot,
  loadDetail,
  loadExecutors,

  product,
  knot,
  detail,
  executors,

  user,

  loadTasktools,
  loadEquipment

}) => {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [modalData, setModalData] = useState(null);
  const dispatch = useDispatch();



  const [production, setProduction] = useState(1);

  const [welderValue, setwelderValue] = useState("");


  ////Массивы продукции
  const [productArray, setproductArray] = useState([]);

  const [valueAreaId, setvalueAreaId] = useState(null);


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
    loadExecutors();
    loadMasters();

    loadSeam();
    loadEquipment();

    loadProduct();
    loadKnot();
    loadDetail();
  }, [
    loadMasters,
    loadTasks,
    loadTechs,
    loadProduct,
    loadExecutors,
    loadKnot,
    loadDetail,
    loadEquipment,
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
  const getDocument = (numberTask) => {
    const number = combinedArray?.find(task => task.number === numberTask).id;
    api.get(`/file/seamPassport/${number}`, {
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


  const combinedArray = tasks?.tasks?.concat(tasks.fullNames);


  function comparisonDate(weldingDate) {
    const targetDate = new Date(weldingDate)
    const now = new Date();

    if (now <= targetDate) {
      return false;
    } else {
      return true;
    }
  }

  const columns = [
    {
      title: "№ задания»", field: "number",
    },
    {
      title: "Номер шва", field: "seam.number",
    },
    {
      title: "Количество швов", field: "amountFromPlan",
    },
    {
      title: "Дата ", field: "weldingDate",
    },
    {
      title: "Статус ",
      render: (rowData) => {
        if (comparisonDate(rowData?.weldingDate)) {
          return <p className={styles.Done}>Завершено</p>
        }
        else {
          return <p className={styles.InProcess}>В процессе</p>
        }
      },
    },
    {
      title: "Наименование изделия",
      render: (rowData) => {
        if (rowData?.seam?.product)  return <p>{rowData?.seam?.product?.name} {rowData?.seam?.product?.number}</p>
        else return <p> - </p> 
      },
    },
    {
      title: "Наименование узла",
      render: (rowData) => {
        if (rowData?.seam?.knot)  return <p>{rowData?.seam?.knot?.name} {rowData?.seam?.knot?.number}</p>
        else return <p> - </p>  
      },
    },
    {
      title: "Наименование детали",
      render: (rowData) => {
        if (rowData?.seam?.detail)  return <p>{rowData?.seam?.detail?.name} {rowData?.seam?.detail?.number}</p>
        else return <p> - </p>   
      },
    },

    {
      title: "Оборудование  ( инвентарный номер )",
      render: (rowData) => {
        if (rowData?.weldingEquipment && rowData?.weldingEquipment.length != 0) {
          return  <p>{rowData?.weldingEquipment?.factoryNumber ?? "-"}</p>
        }
        else {
          return <span>-</span>
        }
      },
    },

    {
      title: "Исполнитель",
      field: "masterId",
      render: (rowData) => {
        if (rowData?.welder != null) {
          return (
            <p>{`
              ${rowData?.welder?.middleName} 
              ${rowData?.welder?.firstName} 
              ${rowData?.welder?.lastName}
              `}
            </p>
          );
        }
        else {
            return  <p>{`  -   `}  </p>
        }

      },
    },
    {
      title: "Руководитель сварочных работ",
      field: "masterId",
      render: (rowData) => {
        if (rowData?.master == null) {
          return (
            <p>{`-`}
            </p>
          );
        }
        else {
          return (
            <p>{`
              ${rowData?.master?.middleName} 
              ${rowData?.master?.firstName} 
              ${rowData?.master?.lastName}
              `}
            </p>
          );
        }

      },
    },
    {
      title: "Контролер",
      field: "masterId",
      render: (rowData) => {
        if (rowData?.inspector != null) {
          return (
            <p>{`
              ${rowData?.inspector?.middleName} 
              ${rowData?.inspector?.firstName} 
              ${rowData?.inspector?.lastName}
              `}
            </p>
          );
        }
        else {
          return (
            <p>{`  -   `}
            </p>
          );
        }
      },
    },
    {
      field: "url",
      title: "Скачать паспорт",
      render: (rowData) => (
        <div
          onClick={() => getDocument(rowData?.number)}
          className={styles.downloadButton}
        >
          <SaveIcon />
        </div>
      ),
      width: 54,
    },
  ];






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

  console.log(techs)
 

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
        <Tab label="Ежедневный план" />
      </Tabs>

      <div className={styles.tableWrapper}>

        {/*Сменные задания на сварку*/}
        <TabPanel
          value={value_panel}
          indPanel={0}
          style={{ minWidth: "1200px", }}
        >
          <Table
            title="Сменные задания на сварку"
            columns={columns}
            data={combinedArray}
            isLoading={isRequesting}

          />
        </TabPanel>

        {/*Ежедневный план*/}
        {value_panel === 1
          ? (
            <DailyPlan
              masters={masters}
              product={product}
              knot={knot}
              detail={detail}
              executors={executors}
              initialValues={initialValues}
              user={user}
              equipment={equipment}
              userRole={userRole}  
              techs={techs}
            />
          )
          : (
            <div className={styles.TableToFixed}>

            </div>
          )
        }




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
                    autocomplete="off"
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
                    autocomplete="off"
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
                    autocomplete="off"
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
                    autocomplete="off"
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
                    autocomplete="off"
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
                    autocomplete="off"
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