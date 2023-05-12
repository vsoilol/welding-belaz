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


export const ProductionArea = ({
  workshop,
  area,
  posts,
  workplace,
  product,
  knot,
  indPanel,

  detail,
  seam,
  value_panel,
  value_panel2,
  userRole,
  addArea,
  editArea,

  deleteProduct,
  deleteIcon
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


  const [, setValue] = useState(value_panel);
  const [, setValue2] = useState(value_panel2);

  ///дописываю для чего просматриваем закрепленные объекты
  const [isDisplayFixed, setDisplayFixed] = useState("");

  /////Удоление
  const [deleteProdModal, setdeleteProdModal] = useState(false);
  const [idProduct, setidProduct] = useState("");

  const initialValues = {
    name: modalData?.name ?? "",
    number: modalData?.number ?? "",
    id: modalData?.id ?? "",

  };
  function SetValue(valueId, index) {
    ///workshop
    if (index === 0) {
      for (let index = 0; index < workshop.length; index++) {
        if (workshop[index].id === valueId) {
          return workshop[index].number
        }
      }
    }
    ///area
    if (index === 1) {
      for (let index = 0; index < area.length; index++) {
        if (area[index].id === valueId) {
          return area[index].number
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



    //Добавить Производственные участки
    if (isModalNumb == 9) {
      addArea(variables)
    }
    //Редактировать Производственные участки
    if (isModalNumb == 1) {
      editArea(variables)
    }

  }

  const columns = {
    workshops: [
      {
        title: "Наименование цеха",
        field: "name",
      },
      {
        title: "Номер  цеха",
        field: "number",
      },

      {
        title: "Наименование производственного участка ",
        render: (rowData) => {
          return <span>{DetArea(rowData.id, "name") ?? "-"}</span>
        },
      },
      {
        title: "Номер  производственного участка ",
        render: (rowData) => {
          return <span>{DetArea(rowData.id, "numb") ?? "-"}</span>
        },
      },
      {
        title: "Перерейти к",
        render: (rowData) => {
          return <p className={styles.goOver} onClick={e => { GoTo(1, "Производственные участки", rowData.id); setDisplayFixed(rowData?.name) }}>Производственный участок</p>;
        },
      },
    ],
    production_sites: [
      {
        title: "Удаление",
        render: (rowData) => {
          return <img className={styles.deleteIcon} src={deleteIcon} onClick={() => {
            setdeleteProdModal(true);
            setidProduct(rowData?.id)
          }}></img>
        }
      },
      {
        title: "Наименование производственного участка ",
        field: "name",
      },
      {
        title: "Номер  производственного участка ",
        field: "number",
      },
      {
        title: "Наименование цеха ",
        render: (rowData) => {
          return <span>{rowData?.workshop.name ?? "-"}</span>
        },
      },
      {
        title: "Номер  цеха ",
        render: (rowData) => {
          return <span>{rowData?.workshop.number ?? "-"}</span>
        },
      },
      {
        title: "Перерейти к",
        render: (rowData) => {

          return (
            <div>
              <p className={styles.goOver} onClick={e => { GoTo(2, "Посты", rowData.id); setDisplayFixed(rowData?.name) }}>Пост</p>
              <p className={styles.goOver} onClick={e => { GoTo(3, "Рабочее место", rowData.id); setDisplayFixed(rowData?.name) }}>Рабочее место</p>
            </div>
          )

          // return <p className={styles.goOver} onClick={e => { GoTo(2, "Посты", rowData.id) }}>Пост</p>;
        },
      },
    ],
    posts: [
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
        title: "Наименование цеха ",
        render: (rowData) => {
          return <span>{rowData?.workshop.name ?? "-"}</span>
        },
      },
      {
        title: "Номер  цеха ",
        render: (rowData) => {
          return <span>{rowData?.workshop.number ?? "-"}</span>
        },
      },

      {
        title: "Наименование производственного участка ",
        render: (rowData) => {
          return <span>{rowData?.productionArea.name ?? "-"}</span>
        },
      },
      {
        title: "Номер  производственного участка ",
        render: (rowData) => {
          return <span>{rowData?.productionArea.number ?? "-"}</span>
        },
      },
      {
        title: "Перерейти к",
        render: (rowData) => {
          return <p className={styles.goOver} onClick={e => { GoTo(9, "Рабочие места", rowData.id); setDisplayFixed(rowData?.name) }}>Рабочее место</p>;
        },
      },
    ],
    jobs_place: [
      {
        title: "Наименование рабочего места ",
        render: (rowData) => {
          return <p>Рабочее место {rowData.number ?? "-"}</p>;
        },
      },
      {
        title: "Номер  рабочего места ",
        field: "number",
      },
      {
        title: "Наименование цеха ",
        render: (rowData) => {
          return <span>{rowData?.workshop.name ?? "-"}</span>
        },
      },
      {
        title: "Номер  цеха ",
        render: (rowData) => {
          return <span>{rowData?.workshop.number ?? "-"}</span>
        },
      },

      {
        title: "Наименование производственного участка ",
        render: (rowData) => {
          return <span>{rowData?.productionArea.name ?? "-"}</span>
        },
      },
      {
        title: "Номер  производственного участка ",
        render: (rowData) => {
          return <span>{rowData?.productionArea.number ?? "-"}</span>
        },
      },


      {
        title: "Наименование поста",
        render: (rowData) => {
          return <span>{rowData?.post?.name ?? "-"}</span>
        },
      },
      {
        title: "Номер  поста",
        render: (rowData) => {
          return <span>{rowData?.post?.number ?? "-"}</span>
        },
      },
    ],

  };


  const [value_goToHeadTable, setValuegoToHeadTable] = useState(columns.production_sites);
  const [value_goTo, setValuegoTo] = useState(0);


  ///Изменение заголовка модалки
  function TitleTextModal(params) {
    if (params === 1) {
      return "Редактировать Производственный участок"
    }

    if (params === 9) {
      return "Добавить Производственный участок"
    }
  }
  //select Производственные участки  

  const optProdArea = workshop?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });

  function DetArea(params, field, numb) {

    if (numb === 1) {
      if (field === "name") {
        for (let index = 0; index < posts?.length; index++) {
          if (posts[index].productionArea?.id === params) {
            return posts[index].name
          }
        }
      }
      if (field === "numb") {
        for (let index = 0; index < posts?.length; index++) {
          if (posts[index].productionArea?.id === params) {
            return posts[index].number
          }
        }
      }
    }
    if (numb === 2) {
      if (field === "name") {
        for (let index = 0; index < workplace?.length; index++) {
          if (workplace[index].productionArea?.id === params) {
            return `Рабочее место ${workplace[index].number}`
          }
        }
      }
      if (field === "numb") {
        for (let index = 0; index < workplace?.length; index++) {
          if (workplace[index].productionArea?.id === params) {
            return workplace[index].number
          }
        }
      }
    }

  }

  ///Перейти к 
  function GoTo(param, title, id) {
    setValuegoToTitle(title)
    setValuegoTo(1)


    setValuegoToHeadTable(columns[Object.keys(columns)[param]])
    //Вывод Производственный участок для цеха
    if (param === 1) {
      let areaNew = []
      for (let index = 0; index < area.length; index++) {
        if (area[index].workshop.id === id) {
          areaNew.push(area[index])
        }
      }
      setValuegoToBodyTable(areaNew)
    }
    //Вывод постов для Производственных участоков
    if (param === 2) {
      let postsNew = []
      for (let index = 0; index < posts.length; index++) {
        if (posts[index].productionArea.id === id) {
          postsNew.push(posts[index])
        }
      }
      setValuegoToBodyTable(postsNew)
    }
    //Вывод Рабочее место для производственного участка 
    if (param === 3) {
      let workplaceNew = []
      for (let index = 0; index < workplace.length; index++) {
        if (workplace[index].productionArea?.id === id) {
          workplaceNew.push(workplace[index])
        }
      }
      setValuegoToBodyTable(workplaceNew)
    }
    //Вывод Рабочее место для производственного участка 
    if (param === 9) {
      let workplaceNew = []
      for (let index = 0; index < workplace.length; index++) {
        if (workplace[index].post?.id != undefined) {
          if (workplace[index].post.id === id) {
            workplaceNew.push(workplace[index])
          }
        }
      }
      setValuegoToBodyTable(workplaceNew)
      setValuegoToHeadTable(columns[Object.keys(columns)[3]])
    }
    /////////////////
    //Вывод деталей для изделий
    if (param === 6) {
      let detailNew = []
      for (let index = 0; index < product.length; index++) {
        if (product[index].id === id) {

          for (let index2 = 0; index2 < product[index].insideProducts.length; index2++) {
            if (product[index].insideProducts[index2].productType === 3) {
              detailNew.push(product[index].insideProducts[index2])
            }
          }
        }
      }
      setValuegoToBodyTable(detailNew)
    }
    //Вывод узлов для изделий
    if (param === 5) {
      let knotNew = []
      for (let index = 0; index < product.length; index++) {
        if (product[index].id === id) {
          for (let index2 = 0; index2 < product[index].insideProducts.length; index2++) {
            if (product[index].insideProducts[index2].productType === 2) {
              knotNew.push(product[index].insideProducts[index2])
            }
          }
        }
      }
      setValuegoToBodyTable(knotNew)
    }
    //Вывод швов для изделий
    if (param === 7) {
      let seamNew = []
      for (let index = 0; index < product.length; index++) {
        if (product[index].id === id) {
          seamNew = product[index].seams
        }
      }
      setValuegoToBodyTable(seamNew)
    }
    /////////////////
    //Вывод деталей для узла
    if (param === 10) {
      let detailNew = []
      for (let index = 0; index < knot.length; index++) {
        if (knot[index].id === id) {

          for (let index2 = 0; index2 < knot[index].insideProducts.length; index2++) {
            if (knot[index].insideProducts[index2].productType === 3) {
              detailNew.push(knot[index].insideProducts[index2])
            }
          }
        }
      }
      setValuegoToHeadTable(columns[Object.keys(columns)[6]])
      setValuegoToBodyTable(detailNew)
    }
    //Вывод швов для узла
    if (param === 11) {
      let seamNew = []
      for (let index = 0; index < knot.length; index++) {
        if (knot[index].id === id) {
          seamNew = knot[index].seams
        }
      }
      setValuegoToHeadTable(columns[Object.keys(columns)[7]])
      setValuegoToBodyTable(seamNew)
    }
    //Вывод швов для узла
    if (param === 11) {
      let seamNew = []
      for (let index = 0; index < knot.length; index++) {
        if (knot[index].id === id) {
          seamNew = knot[index].seams
        }
      }
      setValuegoToHeadTable(columns[Object.keys(columns)[7]])
      setValuegoToBodyTable(seamNew)
    }
    //Вывод швов для деталей
    if (param === 12) {
      let seamNew = []
      for (let index = 0; index < detail.length; index++) {
        if (detail[index].id === id) {
          seamNew = detail[index].seams
        }
      }
      setValuegoToHeadTable(columns[Object.keys(columns)[7]])
      setValuegoToBodyTable(seamNew)
    }
  }

  const TabPanel = (props_panel) => {
    const { children, value, indPanel } = props_panel;
    return <div hidden={value !== indPanel}>{children}</div>;
  };

  ////////////////////////////////////////////////////////////////////
  return (
    <div className={styles.innerWrapper}>

      <div className={styles.tableWrapper}>



        {value_goTo === 1
          ? (
            <div className="TableToGo">
              <TabPanel
                value={value_goTo}
                indPanel={value_goTo}
                style={{ minWidth: "800px" }}
              >
                <Table
                  title={isDisplayFixed + " - " + value_goToTitle}
                  columns={value_goToHeadTable}
                  data={value_goToBodyTable}
                />
              </TabPanel>
            </div>
          )
          : (
            <TabPanel
              style={{ minWidth: "800px" }}
            >
              <Table
                title="Производственные участки"
                columns={columns.production_sites}
                data={area}
                actions={
                  userRole === "Admin" || userRole === "Master"
                    ? [
                      {
                        icon: "add",
                        tooltip: "Добавить производственный участок",
                        isFreeAction: true,
                        onClick: () => {
                          setIsModalOpen(true);
                          setIsModalNumb(9)
                          setValueProdArea("")
                          setValuetTechProc("")
                          setValuetPosts("")
                          setValuetWorkPlace("")

                          api.post(`/eventLog`,{
                            "information": "Открыл модальное окно добавления производственого участка"
                          })
                        },
                      },
                      {
                        icon: "edit",
                        tooltip: "Редактировать производственный участок",
                        onClick: (event, rowData) => {
                          setModalData(rowData);
                          setIsModalOpen(true);
                          setIsModalNumb(1)
                          setValueProdArea(rowData.workshop.id)

                          api.post(`/eventLog`,{
                            "information": "Открыл модальное окно редактирования производственого участка"
                          })
                        },
                      },
                    ]
                    : []
                }
              />
            </TabPanel>
          )

        }


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
                    autocomplete="off"
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
                    type="number"
                    min="0"
                    step="1"
                    placeholder="Номер"
                    onBlur={handleBlur}
                    autocomplete="off"
                  />
                </div>
                <div className={styles.row}>
                  <Select
                    name="valueProdArea"
                    value={valueProdArea}
                    width="380px"
                    placeholder="Цех"
                    onChange={(event) => {
                      setValueProdArea(event.value)
                    }}
                    options={optProdArea}
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

        {/*Удаление задания*/}
        <ModalWindow
          isOpen={deleteProdModal}
          headerText="Удаление"
          setIsOpen={(state) => {
            setdeleteProdModal(false)
          }}
          wrapperStyles={{ width: 420 }}
        >
          <Formik
            initialValues={initialValues}
            enableReinitialize
            onSubmit={(variables) => {
              const { id, ...dataToSend } = variables;
              setdeleteProdModal(false)
              deleteProduct({ id: idProduct, index: 1 })
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
                  <h4 style={{ padding: "35px 40px" }}>Вы уверены что хотите <span>удалить</span> данный производственный участок ? </h4>

                  <div className={styles.row}>
                    <Button
                      type="submit"
                    >
                      Удалить
                    </Button>
                  </div>

                </div>
              </form>
            )}
          </Formik>
        </ModalWindow>

      </div>
    </div>
  );
};
