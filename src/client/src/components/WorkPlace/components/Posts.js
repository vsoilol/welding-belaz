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


export const Posts = ({
  area,
  posts,
  workplace,
  value_panel,
  value_panel2,
  userRole,
  addPosts,
  editPosts,
}) => {

  const [modalData, setModalData] = useState(null);
  const [isModalNumb, setIsModalNumb] = useState(0);
  const [value_goToTitle, setValuegoToTitle] = useState("");

  const [valueProdArea, setValueProdArea] = useState();
  const [valuetTechProc, setValuetTechProc] = useState();
  const [valuetPosts, setValuetPosts] = useState();
  const [valuetWorkPlace, setValuetWorkPlace] = useState();

  const [value_goToBodyTable, setValuegoToBodyTable] = useState(area);

  const [isModalOpen, setIsModalOpen] = useState(false);
  const [valueWorkplace, setValueWorkplace] = useState();

  const [, setValue] = useState(value_panel);
  const [, setValue2] = useState(value_panel2);


  const initialValues = {
    name: modalData?.name ?? "",
    number: modalData?.number ?? "",
    id: modalData?.id ?? "",

  };

  function SetValue(valueId, index) {
     
    ///area
    if (index === 1) {
      for (let index = 0; index < area.length; index++) {
        if (area[index].id === valueId) {
          return area[index].number
        }
      }
    }
    ///post
    if (index === 2) {
      for (let index = 0; index < posts.length; index++) {
        if (posts[index].id === valueId) {
          return posts[index].number
        }
      }
    }
  }
  //Запрос на редактирование или добавление
  function SendData(variables) {

    variables["workshopId"] = valueProdArea
    variables["workshopNumber"] = SetValue(valueProdArea, 0)

    variables["productionAreaId"] = valuetPosts
    variables["productionAreaNumber"] = SetValue(valuetPosts, 1)
 
 
    variables["workplaceId"] = valueWorkplace


    //Добавить Посты
    if (isModalNumb == 10) { 
       addPosts(variables)
    }
    //Редактировать Посты
    if (isModalNumb == 2) {
       editPosts(variables)
    }

  }

  const columns = [
    {
      title: "Наименование поста ",
      render: (rowData) => {
        return <p>Пост {rowData.number}</p>;
      },
    },
    {
      title: "Номер  поста ",
      field: "number",
    },
    {
      title: "Перерейти к",
      render: (rowData) => {
        return <p className={styles.goOver} onClick={e => { GoTo(9, "Рабочие места", rowData.id) }}>Рабочее место</p>;
      },
    },
  ]


  const [value_goToHeadTable, setValuegoToHeadTable] = useState(columns);
  const [value_goTo, setValuegoTo] = useState(0);


  ///Изменение заголовка модалки
  function TitleTextModal(params) {
    if (params === 2) {
      return "Редактировать Пост"
    }

    if (params === 10) {
      return "Добавить Пост"
    }
  }

 
  //select Посты   
  const optPosts = area?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });


  ///Перейти к 
  function GoTo(title, id) {
    setValuegoToTitle(title)
    setValuegoTo(1)


    setValue(-1);
    setValue2(-1);

    setValuegoToHeadTable(columns)
    //Вывод Рабочее место для производственного участка 
    let workplaceNew = []
    for (let index = 0; index < workplace.length; index++) {
      if (workplace[index].productionArea?.id === id) {
        workplaceNew.push(workplace[index])
      }
    }
    setValuegoToBodyTable(workplaceNew)

  }

  const TabPanel = (props_panel) => {
    const { children, value, indPanel } = props_panel;
    return <div hidden={value !== indPanel}>{children}</div>;
  };

  ////////////////////////////////////////////////////////////////////
  return (
    <div className={styles.innerWrapper}>

      <div className={styles.tableWrapper}> 
        {/*Посты*/}
        <TabPanel 
          style={{ minWidth: "800px" }}
        >
          <Table
            title="Посты"
            columns={columns} 
            className="posts"
            data={posts} 
            actions={
              userRole === "Admin"
                ? [
                  {
                    icon: "add",
                    tooltip: "Добавить пост",
                    isFreeAction: true,
                    onClick: () => {
                      setIsModalOpen(true); setIsModalNumb(10); setValueProdArea("")
                      setValuetTechProc("")
                      setValuetPosts("")
                      setValuetWorkPlace("")
                    },
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать пост",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                      setIsModalNumb(2)
                      setValuetPosts(rowData.productionArea.id)
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
                  <Select
                    name="valuetPosts"
                    width="380px"
                    value={valuetPosts}
                    placeholder="Производственные участки"
                    onChange={(event) => setValuetPosts(event.value)}
                    options={optPosts}
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
