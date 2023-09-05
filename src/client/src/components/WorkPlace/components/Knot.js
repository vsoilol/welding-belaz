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


export const Knot = ({
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
  addKnot,
  editKnot,

  masters,
  techs,
  executors,

  deleteProduct,
  deleteIcon
}) => {

  const [modalData, setModalData] = useState(null);
  const [isModalNumb, setIsModalNumb] = useState(0);
  const [value_goToTitle, setValuegoToTitle] = useState("");

  const [valueProdArea, setValueProdArea] = useState();
  const [valuetTechProc, setValuetTechProc] = useState();
  const [valuetPosts, setValuetPosts] = useState(area[0].id);
  const [valuetWorkPlace, setValuetWorkPlace] = useState();

  const [value_goToBodyTable, setValuegoToBodyTable] = useState(area);

  const [isModalOpen, setIsModalOpen] = useState(false);
  const [valueWorkplace, setValueWorkplace] = useState();

  const [, setValue] = useState(value_panel);
  const [, setValue2] = useState(value_panel2);

  const [valuetSeam, setValuetSeam] = useState([]);


  const [valueWelder, setValueWelder] = useState(1);
  const [valueWelderExe, setValueWelderExe] = useState(0);
  const [valueWelderExeName, setValueWelderName] = useState("");


  const [valueFixed, setValueFixed] = useState(0);
  //Создание задания
  const [createTask, setcreateTask] = useState(0);
  //Выбранные сварщики
  const [welderListChoise, setwelderListChoise] = useState([]);
  //Выбранное изделие/деталь/узел
  const [valueChoise, setvalueChoise] = useState("");
  //Id выбранного изделие/деталь/узел
  const [valueIdIzdelia, setIdIzdelia] = useState("");
  ///дописываю для чего просматриваем закрепленные объекты
  const [isDisplayFixed, setDisplayFixed] = useState("");
  const initialValues = {
    name: modalData?.name ?? "",
    number: modalData?.number ?? "",
    id: modalData?.id ?? "",
    manufacturingTime:modalData?.manufacturingTime??""
  };
  /////Удоление
  const [deleteProdModal, setdeleteProdModal] = useState(false);
  const [idProduct, setidProduct] = useState("");
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

    variables["technologicalProcessId"] = valuetTechProc

    variables["seams"] = [valuetSeam]

    variables["postId"] = valuetWorkPlace
    variables["workplaceId"] = valueWorkplace



    //Добавить Узел
    if (isModalNumb == 13) {
      variables["status"] = "add"
      variables["mainProductId"] = valuetProduct
      addKnot(variables)
    }
    //Редактировать Узел
    if (isModalNumb == 5) {
      variables["mainProductId"] = valuetProduct

      editKnot(variables)
    }

  }
 
  const columns = {  
    node: [
      (userRole === "Admin" || userRole === "Inspector") && {
        title: "Удаление",
        render: (rowData) => (
          <img
            className={styles.deleteIcon}
            src={deleteIcon}
            onClick={() => {
              setdeleteProdModal(true);
              setidProduct(rowData?.id)
            }}
          />
        ),
      },    
      {
        title: "Наименование узла ", field: "name"
      },
      {
        title: "Номер  узла ", field: "number"
      },
      {
        title: "Норма времени на изготовление", field: "manufacturingTime"
      },
      {
        title: "Номер  цеха ", field: "workshop.number"
      },
      {
        title: "Номер  производственного участка ", field: "productionArea.number"
      }, 
      {
        title: "Наименование   технологического процесса  ", field: "technologicalProcess.name"
      },
      {
        title: "Номер  технологического процесса  ", field: "technologicalProcess.number"
      }, 
      {
        title: "Перерейти к",
        render: (rowData) => {
          return (
            <div>
              <p className={styles.goOver} onClick={e => { GoTo(10, "Детали", rowData?.id); setDisplayFixed(rowData?.name) }}>Деталь</p>
              <p className={styles.goOver} onClick={e => { GoTo(11, "Сварные швы", rowData?.id); setDisplayFixed(rowData?.name) }}>Сварной шов</p>
            </div>
          )
        },
      },

    ].filter(column => column), 
  };

  const columnsFix = {

    node: [
      {
        title: "Закрепить узлы",
        render: (rowData) => {
          return <input type="checkbox"></input>
        },
      },
      {
        title: "Наименование узла ", field: "name"
      },
      {
        title: "Номер  узла ", field: "number"
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
        title: "Наименование   технологического процесса  ", field: "technologicalProcess.name"
      },
      {
        title: "Номер  технологического процесса  ", field: "technologicalProcess.number"
      },

    ],

    welder: [
      {
        title: "Закрепить сварщика",
        render: (rowData) => {
          return <input type="checkbox" onClick={e => { ChioseWelder(rowData) }}></input>
        },
      },
      {
        title: "RFID-метка",
        render: (rowData) => {
          return <p>{rowData?.rfidTag ?? rowData?.idFromSystem}</p>;
        },
      },
      {
        title: "Имя",
        field: "firstName",
      },
      {
        title: "Фамилия",
        field: "middleName",
      },
      {
        title: "Отчество",
        field: "lastName",
      },
      {
        title: "Цех",
        render: (rowData) => {
          return rowData?.workshop?.name;
        },
      },
      {
        title: "Производственный участок",
        field: "productionArea.name",
      },
    ]
  };
  const [value_goToHeadTable, setValuegoToHeadTable] = useState(columns.node);
  const [value_goTo, setValuegoTo] = useState(0);


  ///Изменение заголовка модалки
  function TitleTextModal(params) { 
    if (params === 5) {
      return "Редактировать Узел"
    }

    if (params === 13) {
      return "Добавить Узел"
    }
  }


  //select Посты   
  const optPosts = area?.map((item) => {
    return {
      value: item.id,
      label: `№${item.number} ${item.name} `,
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
      label: `${item.name} ${item.number}`,
    };
  });
  //select Сварочный шов  
  const SeamOptions = seam?.map((item) => {
    return {
      value: item.id,
      label: `Cварочный шов ${item.number}`,
    };
  });

  ///Перейти к 
  function GoTo(param, title, id) {
    setValuegoToTitle(title)
    setValuegoTo(1)


    setValue(-1);
    setValue2(-1);
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


  const formattedMasters = masters?.map((item) => {
    return {
      value: item.id,
      label: `${item.middleName} ${item.firstName}`,
    };
  });
  const formattedTechs = techs?.map((item) => {
    return {
      value: item.id,
      label: `${item.middleName} ${item.firstName}`,
    };
  });


  const exec = [
    {
      id: 1,
      name: "Мастера"
    },
    {
      id: 2,
      name: "Контролеры УКК"
    },
  ]

  


  //Select выбор сотрудника
  const optExecutors = exec?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });


  //наименование изделия 
  const [valuetProduct, setvaluetProduct] = useState("");
  const productsOptions = [
    { value: null, label: "Не выбрано" },
    ...(product?.map((item) => ({
      value: item.id,
      label: `${item.name} ${item.number}`,
    })) || []),
  ]



  const [welderList, setwelderList] = useState(welderGetList(area[0].id, 0));
  function welderGetList(idArea, tools_numb) {

    if (tools_numb != 0) {
      let welderList = []
      for (let index = 0; index < executors.length; index++) {
        if (executors[index].productionArea.id === idArea) {
          welderList.push(executors[index])
        }
      }
      setwelderList(welderList)
    }
    else {
      let welderList = []
      for (let index = 0; index < executors.length; index++) {
        if (executors[index].productionArea.id === idArea) {
          welderList.push(executors[index])
        }
      }
      return welderList
    }
  }
  function ChioseWelder(welder) {
    if (welder["active"] === undefined) {
      welderListChoise.push(welder.id)
      welder["active"] = 1
      setwelderListChoise(welderListChoise)
    }
    else if (welder["active"] === 1) {
      for (let index = 0; index < welderListChoise.length; index++) {
        if (welderListChoise[index].id === welder.id) {
          welderListChoise.splice(index, 1)
        }
      }
      welder["active"] = 0
    }
    else if (welder["active"] === 0) {
      welderListChoise.push(welder.id)
      setwelderListChoise(welderListChoise)
      welder["active"] = 1
    }
  }
  function SendChoiseWelder() {
    let dataToassignWelders = {
      "productId": valueIdIzdelia,
      "welderIds": welderListChoise,
      status: "assign"
    }
    addKnot(dataToassignWelders)

  }


  ////Скрыть отобразить сварные швы изделия/узла/детали 
  const [displaySeams, setdisplaySeams] = useState(0);
  const [SeamsList, setSeamsList] = useState([]);

  function SeamsDisplay() {
    if (displaySeams === 0) {
      GetSeams()
      setdisplaySeams(1)
    }
    else {
      setdisplaySeams(0)
    }
  }
  const [valuetKnots, setvaluetKnots] = useState("");

  function GetSeams() {

    let SeamsArray = []
    for (let index = 0; index < knot.length; index++) {
      if (knot[index].id === valueIdIzdelia) {
        for (let index2 = 0; index2 < seam.length; index2++) {

          for (let index3 = 0; index3 < knot[index].seams.length; index3++) {
            if (seam[index2].id === knot[index].seams[index3].id) {
              SeamsArray.push(seam[index2])
            }
          }
        }

      }
    }
    setSeamsList(SeamsArray)
  }
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
          : null
        }

        {value_goTo === 0
          ? (
            <TabPanel
              value={value_panel2}
              indPanel={1}
              style={{ minWidth: "800px" }}
            >
              <Table
                title="Узлы"
                columns={columns.node}
                value={1}
                data={knot}
                actions={
                  userRole === "Admin" || userRole === "Inspector"
                    ? [
                      {
                        icon: "add",
                        tooltip: "Добавить узел",
                        isFreeAction: true,
                        onClick: () => {
                          setIsModalOpen(true);
                          setIsModalNumb(13);
                          setValueProdArea("")
                          setValuetTechProc("")
                          setValuetPosts("")
                          setValuetWorkPlace("")

                          api.post(`/eventLog`,{
                            "information": "Открыл модальное окно добавления узла"
                          })
                        },
                      },
                      {
                        icon: "edit",
                        tooltip: "Редактировать узел",
                        onClick: (event, rowData) => {
                          setModalData(rowData);
                          setIsModalOpen(true);
                          setIsModalNumb(5)
                          setValueProdArea(rowData?.workshop?.id)
                          setValuetTechProc(rowData?.technologicalProcess?.id)
                          setValuetPosts(rowData?.productionArea?.id)
                          setValuetWorkPlace(rowData?.workplace?.id)

                          setvaluetProduct(rowData?.mainProduct?.id)

                          api.post(`/eventLog`,{
                            "information": "Открыл модальное окно редактирования узла"
                          })
                        },
                      },
                    ]
                    : []
                }
              />
            </TabPanel>
          )
          : null
        }


        {createTask === 1

          ? (
            <div className={styles.TableToFixed}>


              <h2>Закрепить сварщика</h2>
              <h3>Узел: {valueChoise}</h3>
              <div className={styles.Seams}>

                {
                  displaySeams === 1
                    ? (
                      <TabPanel
                        style={{ minWidth: "800px" }}
                      >
                        <Table
                          title="Сварные швы"
                          columns={columns.welding_seam}
                          data={SeamsList}
                        />
                      </TabPanel>
                    )
                    : <div></div>
                }



              </div>
              <div className={styles.selects}>

                <div className={styles.roww}>
                  <p>Производственные участки</p>
                  <Select
                    name="valuetPosts"
                    width="380px"
                    value={valuetPosts}
                    placeholder="Производственные участки"
                    onChange={(event) => {
                      setValuetPosts(event.value)
                      welderGetList(event.value, 1)
                    }}
                    options={optPosts}
                  />
                  <button className={styles.fixed} onClick={SendChoiseWelder}> Закрерить </button>
                </div>
              </div>



              <TabPanel
                style={{ minWidth: "800px" }}
              >
                <Table
                  title="Сварщики"
                  columns={columnsFix.welder}
                  data={welderList}
                />
              </TabPanel>

            </div>
          )
          : null

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
                      const value = e.target.value;
                      if (/^[\dA-Za-z-]+$/.test(value)) {
                        handleChange(e);
                      }
                    }}
                    style={{ width: 380, height: 40, padding: "0 20px 0 30px" }}
                    value={values.number}
                    name="number"
                    placeholder="Номер"
                    onBlur={handleBlur}
                    autoComplete="off"
                  />
                </div> 
                <div className={styles.row}>
                  <Input
                    onChange={(e) => {
                      const value = e.target.value;
                      if (/^[\dA-Z-]+$/.test(value)) {
                        handleChange(e);
                      }
                    }}
                    style={{ width: 380, height: 40, padding: "0 20px 0 30px" }}
                    value={values.manufacturingTime}
                    name="manufacturingTime"
                    placeholder="Норма времени на изготовление"
                    onBlur={handleBlur}
                    autoComplete="off"
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
                    name="valuetTechProc"
                    width="380px"
                    value={valuetTechProc}
                    placeholder="Технологический процесс"
                    onChange={(event) => setValuetTechProc(event.value)}
                    options={TechProc}
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

        {/*Удаление */}
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
              deleteProduct({ id: idProduct, index: 5 })
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
                  <h4 style={{ padding: "35px 40px" }}>Вы уверены что хотите <span>удалить</span> данный узел ? </h4>
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
