import Paper from "@material-ui/core/Paper";
import MaterialTable from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import SaveIcon from "@material-ui/icons/Save";
import { workPlaceImage } from "assets/pics";
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
import styles from "components/WorkPlace/styles.module.css";



import axios from "axios";
import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";
import api from "services/api";




const dateOptions = {
  day: "numeric",
  month: "short",
  year: "numeric",
};


export const Workshop = ({
  workshop,
  area,
  userRole,


  value_panel,
  value_panel2,

  addWorkshop,
  editWorkshop
}) => {

  const [modalData, setModalData] = useState(null);
  const [isModalNumb, setIsModalNumb] = useState(0);
  const [value_goToTitle, setValuegoToTitle] = useState("");

  const [value_goToBodyTable, setValuegoToBodyTable] = useState(workshop);

  const [isModalOpen, setIsModalOpen] = useState(false); 


  const [, setValue] = useState(value_panel);
  const [, setValue2] = useState(value_panel2);


  const initialValues = {
    name: modalData?.name ?? "",
    number: modalData?.number ?? "",
    id: modalData?.id ?? "",

  };


  //Запрос на редактирование или добавление
  function SendData(variables) {

    //Добавить Цех 
    if (isModalNumb == 8) {
      addWorkshop(variables)
    }
    //Редактировать Цех
    if (isModalNumb == 0) {
      editWorkshop(variables)
    }

  }

  const columns = [
    {
      title: "Наименование цеха",
      field: "name",
    },
    {
      title: "Номер  цеха",
      field: "number",
    },
    {
      title: "Перерейти к",
      render: (rowData) => {
        return <p className={styles.goOver} onClick={e => { GoTo("Производственные участки", rowData.id) }}>Производственный участок</p>;
      },
    }
  ]
 

  const [value_goToHeadTable, setValuegoToHeadTable] = useState(columns);
  const [value_goTo, setValuegoTo] = useState(0);


  ///Изменение заголовка модалки
  function TitleTextModal(params) {
    if (params === 0) {
      return "Редактировать Цех"
    }  

    if (params === 8) {
      return "Добавить Цех"
    } 
  }




  ///Перейти к 
  function GoTo(title, id) {
    setValuegoToTitle(title)
    setValuegoTo(1)


    setValue(-1);
    setValue2(-1);

    setValuegoToHeadTable(columns)
    //Вывод Производственный участок для цеха
    let areaNew = []
    for (let index = 0; index < area.length; index++) {
      if (area[index].workshop.id === id) {
        areaNew.push(area[index])
      }
    }
    setValuegoToBodyTable(areaNew)

  }

  const TabPanel = (props_panel) => {
    const { children, value, indPanel } = props_panel;
    return <div hidden={value !== indPanel}>{children}</div>;
  };

  ////////////////////////////////////////////////////////////////////
  return (
    <div className={styles.innerWrapper}>

      <div className={styles.tableWrapper}>
        {/*Цеха*/}
        <TabPanel
          style={{ minWidth: "800px" }}
        >
          <Table
            title="Цеха"
            columns={columns}
            data={workshop}
            actions={
              userRole === "Admin"
                ? [
                  {
                    icon: "add",
                    tooltip: "Добавить цех",
                    isFreeAction: true,
                    onClick: () => {
                      setIsModalOpen(true); 
                      setIsModalNumb(8)
                    },
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать цех",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                      setIsModalNumb(0); 
                    },
                  },
                ]
                : []
            }
          />
        </TabPanel>


        {/*Перейти к */}
        <div className="TableToGo">
          <TabPanel
            value={value_goTo}
            indPanel={1}
            style={{ minWidth: "800px" }}
          >
            <Table
              title={value_goToTitle}
              columns={value_goToHeadTable} 
              data={value_goToBodyTable} 
            />
          </TabPanel>
        </div>
 

        <ModalWindow
          isOpen={isModalOpen}
          headerText={TitleTextModal(isModalNumb)}
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
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{ width: 380, height: 40, padding: "0 20px 0 30px" }}
                    value={values.name}
                    name="name"
                    placeholder="Наименовние"
                    onBlur={handleBlur}
                  />
                </div>
                <div className={styles.row}>
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{ width: 380, height: 40, padding: "0 20px 0 30px" }}
                    value={values.number}
                    name="number"
                    placeholder="Номер"
                    onBlur={handleBlur}
                  />
                </div>
 

                <div className={styles.row}>
                  <Button
                    type="submit"
                    disabled={
                      values.number == "" || values.name == ""  
                    }
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
