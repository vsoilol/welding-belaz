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


export const Seam = ({
  workshop,
  area,
  posts,
  workplace,
  product,
  knot,
  detail,
  seam,
  texprocwelding,

  value_panel,
  value_panel2,
  userRole,
  addSeam,
  editSeam,
}) => {

  const [modalData, setModalData] = useState(null); 
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [isModalNumb, setIsModalNumb] = useState(0);
  const [value_goTo, setValuegoTo] = useState(0);
  const [value_goToTitle, setValuegoToTitle] = useState("");
 
  const [value_goToBodyTable, setValuegoToBodyTable] = useState(area);
  const [valueWorkplace, setValueWorkplace] = useState();

  const initialValues = {
    name: modalData?.name ?? "",
    number: modalData?.number ?? "",
    id: modalData?.id ?? "",  

    productionArea:modalData?.productionArea?.id?? "",  
    technologicalProcess:modalData?.technologicalProcess?.id?? "",
  };




  const columns = {

    welding_seam: [
      {
        title: "Наименование сварного шва ",
        render: (rowData) => {
          return <p>{rowData.number}</p>;
        },
      },
      {
        title: "Номер  сварного шва ", field: "number"
      },

      {
        title: "Номер  цеха ", field: "workshop.number"
      },
      {
        title: "Номер  производственного участка ", field: "productionArea.number"
      },
      // {
      //   title: "Номер  рабочего места  ", field: "workplace.number"
      // },

      {
        title: "Номер  технологического процесса  ", field: "technologicalProcess.number"
      },
      {
        title: "Технологическая инструкция", field: "technologicalInstruction.name"
      },
      {
        title: "Наименование изделия ",
        render: (rowData) => {
          return <span>{rowData?.product?.name ?? "-"}</span>
        },
      },
      {
        title: "Номер  изделия ",
        render: (rowData) => {
          return <span>{rowData?.product?.number ?? "-"}</span>
        },
      },
      {
        title: "Наименование узла ",
        render: (rowData) => {
          return <span>{rowData?.knot?.name ?? "-"}</span>
        },
      },
      {
        title: "Номер  узла ",
        render: (rowData) => {
          return <span>{rowData?.knot?.number ?? "-"}</span>
        },
      },
      {
        title: "Наименование детали ",
        render: (rowData) => {
          return <span>{rowData?.detail?.name ?? "-"}</span>
        },
      },
      {
        title: "Номер  детали ",
        render: (rowData) => {
          return <span>{rowData?.detail?.number ?? "-"}</span>
        },
      },
      // {
      //   title: "Закрепить задание",
      //   render: (rowData) => {
      //     return <p className={styles.Fix}>Закрепить</p>;
      //   },
      // },
      // {
      //   title: "Просмотреть закрепленные",
      //   render: (rowData) => {
      //     return <p className={styles.Fix}>Просмотреть</p>;
      //   },
      // },
    ],
  };

  const [value_goToHeadTable, setValuegoToHeadTable] = useState(columns.details);



  //select Посты   
  const optPosts = area?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });
  //select Рабочие места 
  const WorkPlaceOpt = posts?.map((item) => {
    return {
      value: item.id,
      label: "Пост " + item.number,
    };
  });
  //select рабочие места
  const workplaceIdOptions = workplace?.map((item) => {
    return {
      value: item.id,
      label: `Рабочие место ${item.number}`,
    };
  });
  //select технологического процесса   
  const TechProc = texprocwelding?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });
  //select Сварочный шов  
  const SeamOptions = seam?.map((item) => {
    return {
      value: item.id,
      label: `Cварочный шов ${item.number}`,
    };
  });



  //select изделие
  const productsOptions = product?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });
  //select узел
  const knotsOptions = knot?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });
  //select деталь
  const detailOptions = detail?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });


  const TabPanel = (props_panel) => {
    const { children, value, indPanel } = props_panel;
    return <div hidden={value !== indPanel}>{children}</div>;
  };
  ///Изменение заголовка модалки
  function TitleTextModal(params) {
    if (params === 7) {
      return "Редактировать Сварочный шов"
    }

    if (params === 15) {
      return "Добавить Сварочный шов"
    }
  }
  //Запрос на редактирование или добавление
  function SendData(variables) {


    // variables["workshopId"] = valueProdArea
    // variables["workshopNumber"] = SetValue(valueProdArea, 0)
    // variables["productionAreaId"] = valuetPosts
    // variables["productionAreaNumber"] = SetValue(valuetPosts, 1)

    // variables["technologicalProcessId"] = valuetTechProc

    // variables["seams"] = [valuetSeam]

    // variables["postId"] = valuetWorkPlace
    // variables["workplaceId"] = valueWorkplace

 
    // //Добавить Сварочный шов
    // if (isModalNumb == 15) {
    //   addSeam(variables)
    // }
    // //Редактировать Сварочный шов
    // if (isModalNumb == 7) {
    //   editSeam(variables)
    // }

  }
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
  ////////////////////////////////////////////////////////////////////
  return (
    <div className={styles.innerWrapper}>

      <div className={styles.tableWrapper}>
        {/*Сварные швы*/}
        <TabPanel
          style={{ minWidth: "800px" }}
        >
          <Table
            title="Сварные швы"
            columns={columns.welding_seam}
            data={seam}
            actions={
              userRole === "Admin" || userRole === "Master"
                ? [
                  {
                    icon: "add",
                    tooltip: "Добавить шов",
                    isFreeAction: true,
                    onClick: () => {
                      setIsModalOpen(true);
                      setIsModalNumb(15); 
                      console.log("Добавить шоваааа")

                    },
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать шва",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                      setIsModalNumb(7) 

                      console.log(rowData)
                      console.log("Редактировать шваааа")
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
                    value={values.number}
                    name="number"
                    placeholder="Номер"
                    onBlur={handleBlur}
                    autocomplete="off"
                  />
                </div>

                <div className={styles.row}>
                  <Select
                    name="valueWorkplace"
                    value={valueWorkplace}
                    width="380px"
                    placeholder="Рабочее место"
                    onChange={(event) => {
                      setValueWorkplace(event.value)
                    }}
                    options={workplaceIdOptions}
                  />
                </div>
                <div className={styles.row}>
                  <Select
                    name="productionArea"
                    width="380px"
                    value={values.productionArea}
                    placeholder="Производственные участки"
                    onChange={(event) => {values.productionArea=event.value}}
                    options={optPosts}
                  />
                </div>

                <div className={styles.row}>
                  <Select
                    name="technologicalProcess"
                    width="380px"
                    value={values.technologicalProcess}
                    placeholder="Технологический процесс"
                    onChange={(event) => {values.technologicalProcess=event.value}}
                    options={TechProc}
                  />
                </div>
                {/* 

                


                

 
                <div className={styles.row}>
                  <Select
                    name="valuetProduct"
                    width="380px"
                    value={valuetProduct}
                    placeholder="Изделие"
                    onChange={(event) => setvaluetProduct(event.value)}
                    options={productsOptions}
                  />
                </div>
                <div className={styles.row}>
                  <Select
                    name="valuetKnots"
                    width="380px"
                    value={valuetKnots}
                    placeholder="Узел"
                    onChange={(event) => setvaluetKnots(event.value)}
                    options={knotsOptions}
                  />
                </div>
                <div className={styles.row}>
                  <Select
                    name="valuetDetail"
                    width="380px"
                    value={valuetDetail}
                    placeholder="Деталь"
                    onChange={(event) => setvaluetDetail(event.value)}
                    options={detailOptions}
                  />
                </div> */}





                <div className={styles.row}>
                  <Button
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
