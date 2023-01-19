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
import Calendars from "../Calendar/Calendar";

const {
  Creators: { setError },
} = errorActions;

const dateOptions = {
  day: "numeric",
  month: "short",
  year: "numeric",
};

export const Calendar = ({
  calendar,
  loadCalendar,
  executors,
  loadExecutors,

  equipment,
  loadEquipment

}) => {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [modalData, setModalData] = useState(null);
  const dispatch = useDispatch();

  const [valueObj, setValueObj] = useState(null);
  const [valueExecutors, setValueExecutors] = useState(null);
  const [valueNameExecutors, setValueNameExecutors] = useState(null);
  const [valueEquipment, setValueEquipment] = useState(null);
  const [valueNameEquipment, setValueNameEquipment] = useState(null);

  const [valueObjSmens, setValueObjSmens] = useState(null);


  const initialValues = {
    shiftDay: modalData?.shiftDay ?? ""
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
    loadCalendar();
    loadExecutors();
    loadEquipment();
  }, [loadCalendar, loadExecutors, loadEquipment]);



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



  ////////////////////////////////////////////////////////////////////




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
  const welder = [
    {
      title: "День",
      field: "day",
    },
    {
      title: "Смена",
      field: "alter",
    },
    {
      title: "Оборудование / Сотрудник",
      field: "obj",
    },
  ]

  const welderData = [
    {
      day: "11.01.2023 ",
      alter: "Смена 1",
      obj: "Оборудование 1",
    },
    {
      day: "12.01.2023",
      alter: "Смена 2",
      obj: "Сотрудник 1",
    }, {
      day: "13.01.2023",
      alter: "Смена 3",
      obj: "Сотрудник 2",
    },
    {
      day: "14.01.2023",
      alter: "Смена 4",
      obj: "Оборудование 2",
    },
    {
      day: "15.01.2023",
      alter: "Смена 5",
      obj: "Оборудование 2",
    },
    {
      day: "16.01.2023",
      alter: "Смена 6",
      obj: "Сотрудник 3",
    }
  ]

  
  const ObjSlects = [
    {
      id: 1,
      name: "Оборудование "
    },
    {
      id: 2,
      name: "Сотрудник"
    }
  ]

  const optObs = ObjSlects?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });
  const executorsOptions = executors?.map((item) => {
    return {
      value: item.id,
      label: item.middleName,
    };
  });
  const equipmentOptions = equipment[0]?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });

  function DisplaySelect() {  
    if (valueObj === null) {
      return (
         <div></div>
      )
    }
    if (valueObj === 2) {
      return (
        <div className={styles.row}>
          <Select
            name="valueExecutors"
            value={valueExecutors}
            width="380px"
            placeholder="Сотрудники"
            onChange={(event) => { 
              setValueExecutors(event.value)
              setValueNameExecutors(event.label)
            }}
            options={executorsOptions}
          />
        </div>
      )
    }
    if (valueObj === 1) {
      return (
        <div className={styles.row}>
          <Select
            name="valueEquipment"
            value={valueEquipment}
            width="380px"
            placeholder="Оборудование"
            onChange={(event) => {
              setValueEquipment(event.value)
              setValueNameEquipment(event.label)
            }}
            options={equipmentOptions}
          />
        </div>
      )
    }
  }


  function SendData(params) { 
    params["valueObj"]=valueObj
    params["valueExecutors"]=valueExecutors 
    params["nameExecutors"]=valueNameExecutors 
    params["valueEquipment"]=valueEquipment 
    params["nameEquipment"]=valueNameEquipment 
    params["shiftDay"]=new Date(params.shiftDay).toLocaleDateString() 
  }

  return (
    <div className={styles.innerWrapper}>
      <ToolTip
        title="Календарь"
        toolTipText="Здесь Вы можете просмотреть производственный календарь "
        src={tasksImage}
      />

      <div className={styles.tableWrapper}>

        <Calendars></Calendars>

        {/*График работы */}
        <TabPanel
          value={value_panel}
          indPanel={0}
          className={styles.grafWork}
        >
          <Table
            title="График работы "
            columns={welder}
            value={0}
            data={welderData}
            actions={
              value_panel == 0
                ? [
                  {
                    icon: "add",
                    tooltip: "Добавить смену",
                    isFreeAction: true,
                    onClick: () => { setIsModalOpen(true); },
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать смену",
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
          headerText={modalData ? "Редактировать смену" : "Добавить смену"}
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
              setIsModalOpen(false);
              setModalData(null);
              SendData(variables)
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
                  <Select
                    name="valueObj"
                    value={valueObj}
                    width="380px"
                    placeholder="Оборудование / Сотрудник"
                    onChange={(event) => {
                      setValueObj(event.value) 
                    }}
                    options={optObs}
                  />
                </div>

                <DisplaySelect />


                <div className={styles.row}>
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
                    value={values.sector}
                    name="sector"
                    placeholder="Смена"
                    onBlur={handleBlur}
                  />
                </div>
                <div className={styles.row}>
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
                    value={values.shiftDay}
                    name="shiftDay"
                    placeholder="День"
                    type="text"
                    onFocus={(e) => {
                      e.currentTarget.type = "date";
                    }}
                    onBlur={handleBlur}
                  />
                </div>
                <div className={styles.row}>
                  <Button
                    disabled={
                      values.nameEquipment == ""||values.nameExecutors == ""||values.sector == ""||values.shiftDay == ""
                      ||values.valueEquipment == ""||values.valueExecutors == ""
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


      </div>
    </div>
  );
};
