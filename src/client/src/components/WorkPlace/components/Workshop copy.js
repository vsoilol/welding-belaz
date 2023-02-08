
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
import styles from "./styles.module.css";



import axios from "axios";
import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";
import api from "services/api";




const dateOptions = {
  day: "numeric",
  month: "short",
  year: "numeric",
};

export const WorkPlace = ({
  addFixedProduct,
  loadMasters,
  loadTechs,
  loadExecutors,
  ///Workshop

  loadWorkshop,
  addWorkshop,
  editWorkshop,
  ///Area 
  loadArea,
  addArea,
  editArea,
  ///Posts 
  loadPosts,
  addPosts,
  editPosts,
  ///Workplace 
  loadWorkplace,
  addWorkplace,
  editWorkplace,
  ///Product
  loadProduct,
  addProduct,
  editProduct,
  //Knot
  loadKnot,
  addKnot,
  editKnot,
  ///Detail
  loadDetail,
  addDetail,
  editDetail,
  ///Seam
  loadSeam,
  addSeam,
  editSeam,
  loadTexprocwelding,



  deleteEquipment,
  isRequesting,
  masters,
  techs,
  userRole,


  workshop,
  area,
  posts,
  workplace,
  product,
  knot,
  detail,
  seam,
  texprocwelding,

  executors,



  detailbyinspector,
  getDetailByInspector
}) => {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [isModalSeamOpen, setIsModalSeamOpen] = useState(false);
  const [isModalNumb, setIsModalNumb] = useState(0);

  const [modalData, setModalData] = useState(null);
  const [isResultsModalOpen, setIsResultsModalOpen] = useState(false);
  const [activeEquipment, setActiveEquipment] = useState("");
  const [open, setOpen] = useState(false);

  const [valueProdArea, setValueProdArea] = useState();

  const [valuetPosts, setValuetPosts] = useState();
  const [valuetWorkPlace, setValuetWorkPlace] = useState();
  const [valuetTechProc, setValuetTechProc] = useState();
  const [valuetSeam, setValuetSeam] = useState([]);
  const [valueWorkplace, setValueWorkplace] = useState();


  const [isModalFixProduct, setIsModalFixOpen] = useState(false);
  const [isModalFixKnot, setIsModalFixKnotOpen] = useState(false);
  const [isModalFixDetail, setIsModalFixDetailOpen] = useState(false);
  const [isModalFixSeam, setIsModalFixSeamOpen] = useState(false);


  const [masterValue, setIsmasterValue] = useState(0);
  const [valueIdProduct, setvalueIdProduct] = useState(0);
  const [valueSeamId, setvalueSeamId] = useState(0);
  const [techsValue, setIstechsValue] = useState(0);
  const [valueExecutors, setValueExecutors] = useState(1);

  const [valueTypeFixed, setValueTypeFixed] = useState(0);








  const initialValues = {
    name: modalData?.name ?? "",
    number: modalData?.number ?? "",
    id: modalData?.id ?? "",

    workshopNumber: modalData?.workshop?.number ?? "",
    productionAreaNumber: modalData?.productionInfo?.productionAreaNumber ?? "",
    workplaceNumber: modalData?.productionInfo?.workplaceNumber ?? "",
    technologicalProcessname: modalData?.technologicalProcess?.name ?? "",
    technologicalProcessnumber: modalData?.technologicalProcess?.number ?? "",
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
  const formattedWelder = executors?.map((item) => {
    return {
      value: item.id,
      label: `${item.middleName} ${item.firstName}`,
    };
  });

  useEffect(() => {
    loadWorkshop();
    loadArea();
    loadPosts();
    loadWorkplace();
    loadProduct();
    loadKnot();
    loadDetail();
    loadSeam();
    loadTexprocwelding();
    loadMasters();
    loadTechs();
    loadExecutors();
  }, [
    loadWorkshop,
    loadArea,
    loadPosts,
    loadWorkplace,
    loadProduct,
    loadKnot,
    loadDetail,
    loadTexprocwelding,
    loadMasters,
    loadTechs,
    loadExecutors,
  ]);



  //////////////////////////////////////////////////////////////////// 
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
        title: "Перерейти к",
        render: (rowData) => {
          return <p className={styles.goOver} onClick={e => { GoTo(1, "Производственные участки", rowData.id) }}>Производственный участок</p>;
        },
      },
    ],
    production_sites: [
      {
        title: "Наименование производственного участка ",
        field: "name",
      },
      {
        title: "Номер  производственного участка ",
        field: "number",
      },
      {
        title: "Перерейти к",
        render: (rowData) => {

          return (
            <div>
              <p className={styles.goOver} onClick={e => { GoTo(2, "Посты", rowData.id) }}>Пост</p>
              <p className={styles.goOver} onClick={e => { GoTo(3, "Рабочее место", rowData.id) }}>Рабочее место</p>
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
        title: "Перерейти к",
        render: (rowData) => {
          return <p className={styles.goOver} onClick={e => { GoTo(9, "Рабочие места", rowData.id) }}>Рабочее место</p>;
        },
      },
    ],
    jobs_place: [
      {
        title: "Наименование рабочего места ",
        render: (rowData) => {
          return <p>Рабочее место {rowData.number}</p>;
        },
      },
      {
        title: "Номер  рабочего места ",
        field: "number",
      },
    ],

    goods: [
      {
        title: "Наименование изделия ", field: "name"
      },
      {
        title: "Номер  изделия ", field: "number"
      },

      {
        title: "Номер  цеха ", field: "workshop.number"
      },
      {
        title: "Номер  производственного участка ", field: "productionArea.number"
      },
      {
        title: "Номер  рабочего места  ", field: "workplace.number"
      },
      {
        title: "Наименование   технологического процесса  ", field: "technologicalProcess.name"
      },
      {
        title: "Номер  технологического процесса  ", field: "technologicalProcess.number"
      },
      {
        title: "Закрепить изделие",
        render: (rowData) => {
          return <p className={styles.Fix}>Закрепить</p>;
        },
      },
      // {
      //   title: "Просмотреть закрепленные",
      //   render: (rowData) => {
      //     return <p onClick={e => setIsModalDisplayFix(true)} className={styles.Fix}>Просмотреть</p>;
      //   },
      // },
      {
        title: "Перерейти к",
        render: (rowData) => {
          return (
            <div>
              <p className={styles.goOver} onClick={e => { GoTo(6, "Детали ", rowData.id) }}>Деталь</p>
              <p className={styles.goOver} onClick={e => { GoTo(5, "Узлы", rowData.id) }}>Узел </p>
              <p className={styles.goOver} onClick={e => { GoTo(7, "Сварные швы", rowData.id) }}>Сварной шов</p>
            </div>
          )
        },
      },
    ],
    node: [
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
      {
        title: "Номер  рабочего места  ", field: "workplace.number"
      },
      {
        title: "Наименование   технологического процесса  ", field: "technologicalProcess.name"
      },
      {
        title: "Номер  технологического процесса  ", field: "technologicalProcess.number"
      },
      {
        title: "Закрепить изделие",
        render: (rowData) => {
          return <p className={styles.Fix}>Закрепить</p>;
        },
      },
      // {
      //   title: "Просмотреть закрепленные",
      //   render: (rowData) => {
      //     return <p onClick={e => setIsModalDisplayFix(true)} className={styles.Fix}>Просмотреть</p>;
      //   },
      // },
      {
        title: "Перерейти к",
        render: (rowData) => {
          return (
            <div>
              <p className={styles.goOver} onClick={e => { GoTo(10, "Детали", rowData.id) }}>Деталь</p>
              <p className={styles.goOver} onClick={e => { GoTo(11, "Сварные швы", rowData.id) }}>Сварной шов</p>
            </div>
          )
        },
      },

    ],
    details: [
      {
        title: "Наименование детали ", field: "name"
      },
      {
        title: "Номер  детали ", field: "number"
      },

      {
        title: "Номер  цеха ", field: "workshop.number"
      },
      {
        title: "Номер  производственного участка ", field: "productionArea.number"
      },
      {
        title: "Номер  рабочего места  ", field: "workplace.number"
      },
      {
        title: "Наименование   технологического процесса  ", field: "technologicalProcess.name"
      },
      {
        title: "Номер  технологического процесса  ", field: "technologicalProcess.number"
      },
      {
        title: "Закрепить изделие",
        render: (rowData) => {
          return <p className={styles.Fix}>Закрепить</p>;
        },
      },
      // {
      //   title: "Просмотреть закрепленные",
      //   render: (rowData) => {
      //     return <p onClick={e => setIsModalDisplayFix(true)} className={styles.Fix}>Просмотреть</p>;
      //   },
      // },
      {
        title: "Перерейти к",
        render: (rowData) => {
          return (
            <div>
              <p className={styles.goOver} onClick={e => { GoTo(12, "Сварные швы") }}>Сварной шов</p>
            </div>
          )
        },
      },
    ],
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
      {
        title: "Номер  рабочего места  ", field: "workplace.number"
      },
      {
        title: "Наименование   технологического процесса  ", field: "technologicalProcess.name"
      },
      {
        title: "Номер  технологического процесса  ", field: "technologicalProcess.number"
      },
      {
        title: "Закрепить задание",
        render: (rowData) => {
          return <p className={styles.Fix}>Закрепить</p>;
        },
      },
      // {
      //   title: "Просмотреть закрепленные",
      //   render: (rowData) => {
      //     return <p className={styles.Fix}>Просмотреть</p>;
      //   },
      // },
    ],
  };






  const handleOpen = () => {
    setOpen(true);
  };

  const [value_panel, setValue] = useState(0);
  const [value_panel2, setValue2] = useState(-1);
  const [value_workplace, setValueworkplace] = useState(0);
  const [value_goTo, setValuegoTo] = useState(0);





  const [value_goToTitle, setValuegoToTitle] = useState("");
  const [value_goToHeadTable, setValuegoToHeadTable] = useState(columns.workshops);
  const [value_goToBodyTable, setValuegoToBodyTable] = useState(workshop);





  const ChangePanels = (event, newValue) => {
    if (value_workplace === 0) {
      setValue(newValue);
      setValue2(-1);
      setValuegoTo(0)
    }
    else {
      setValue(-1);
      setValue2(newValue);
      setValuegoTo(0)
    }

  };


  const ChangePanelsworkplace = (event, newValue) => {
    setValueworkplace(newValue)
  }




  const TabPanel = (props_panel) => {
    const { children, value, indPanel } = props_panel;

    return <div hidden={value !== indPanel}>{children}</div>;
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
    ///post
    if (index === 2) {
      for (let index = 0; index < posts.length; index++) {
        if (posts[index].id === valueId) {
          return posts[index].number
        }
      }
    }
    ///texprocwelding
    if (index === 3) {
      for (let index = 0; index < texprocwelding.length; index++) {
        if (texprocwelding[index].id === valueId) {
          return texprocwelding[index].number
        }
      }
    }
    ///texprocwelding
    if (index === 4) {
      for (let index = 0; index < texprocwelding.length; index++) {
        if (texprocwelding[index].id === valueId) {
          return texprocwelding[index].name
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

    variables["postId"] = valuetWorkPlace
    variables["postNumber"] = SetValue(valuetWorkPlace, 2)

    variables["technologicalProcessId"] = valuetTechProc
    variables["technologicalProcessNumber"] = SetValue(valuetTechProc, 3)
    variables["technologicalProcessName"] = SetValue(valuetTechProc, 4)

    variables["workplaceId"] = valueWorkplace
    variables["seams"] = [valuetSeam]

    //Добавить Цех 
    if (isModalNumb == 8) {
      addWorkshop(variables)
    }
    //Редактировать Цех
    if (isModalNumb == 0) {
      editWorkshop(variables)
    }

    //Добавить Производственные участки
    if (isModalNumb == 9) {

      addArea(variables)
    }
    //Редактировать Производственные участки
    if (isModalNumb == 1) {
      editArea(variables)
    }

    //Добавить Посты
    if (isModalNumb == 10) {

      addPosts(variables)
    }
    //Редактировать Посты
    if (isModalNumb == 2) {
      editPosts(variables)
    }

    //Добавить Рабочие места
    if (isModalNumb == 11) {
      if (variables.postId.length < 2) {
        variables.postId = null
      }
      else {
        variables.productionAreaId = null
      }
      addWorkplace(variables)
    }
    //Редактировать Рабочие места
    if (isModalNumb == 3) {
      if (variables.postId.length < 2) {
        variables.postId = null
      }
      else {
        variables.productionAreaId = null
      }
      editWorkplace(variables)
    }

    //Добавить Изделие
    if (isModalNumb == 12) {
      addProduct(variables)
    }
    //Редактировать Изделие
    if (isModalNumb == 4) {
      editProduct(variables)
    }

    //Добавить Узел
    if (isModalNumb == 13) {
      addKnot(variables)
    }
    //Редактировать Узел
    if (isModalNumb == 5) {
      editKnot(variables)
    }
    //Добавить Деталь
    if (isModalNumb == 14) {
      addDetail(variables)
    }
    //Редактировать Деталь
    if (isModalNumb == 6) {
      editDetail(variables)
    }
    //Добавить Сварочный шов
    if (isModalNumb == 15) {
      addSeam(variables)
    }
    //Редактировать Сварочный шов
    if (isModalNumb == 7) {
      editSeam(variables)
    }

  }

  ///Изменение заголовка модалки
  function TitleTextModal(params) {
    if (params === 0) {
      return "Редактировать Цех"
    }
    if (params === 1) {
      return "Редактировать Производственный участок"
    }
    if (params === 2) {
      return "Редактировать Пост"
    }
    if (params === 3) {
      return "Редактировать Рабочее место"
    }
    if (params === 4) {
      return "Редактировать Изделие"
    }
    if (params === 5) {
      return "Редактировать Узел"
    }
    if (params === 6) {
      return "Редактировать Деталь"
    }
    if (params === 7) {
      return "Редактировать Сварочный шов"
    }

    if (params === 8) {
      return "Добавить Цех"
    }
    if (params === 9) {
      return "Добавить Производственный участок"
    }
    if (params === 10) {
      return "Добавить Пост"
    }
    if (params === 11) {
      return "Добавить Рабочее место"
    }
    if (params === 12) {
      return "Добавить Изделие"
    }
    if (params === 13) {
      return "Добавить Узел"
    }
    if (params === 14) {
      return "Добавить Деталь"
    }
    if (params === 15) {
      return "Добавить Сварочный шов"
    }
  }



  const exec = [
    {
      id: 1,
      name: "Мастера"
    },
    {
      id: 2,
      name: "Контролеры"
    },
  ]

  const exec2 = [
    {
      id: 1,
      name: "Сварщики"
    },
    {
      id: 2,
      name: "Контролеры"
    },
  ]

  //Select выбор сотрудника
  const optExecutors = exec?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });
  //Select выбор сотрудника
  const optWelders = exec2?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });

  //select Производственные участки  

  const optProdArea = workshop?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });
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


  //select рабочие места
  const workplaceIdOptions = workplace?.map((item) => {
    return {
      value: item.id,
      label: `Рабочие место ${item.number}`,
    };
  });
  ///Отображение Selects
  function DisplaySelects(select) {

    if (select.select === 0 || select.select === 8) {
      return (
        <div  ></div>
      )
    }
    //select Производственные участки  
    if (select.select === 9 || select.select === 1) {
      return (
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
      )
    }
    //select Посты
    if (select.select === 10 || select.select === 2) {
      return (
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
      )
    }
    //select Рабочие места
    if (select.select === 11 || select.select === 3) {
      return (
        <div>

          <div className={styles.row}>
            <Select
              name="valuetWorkPlace"
              width="380px"
              value={valuetWorkPlace}
              placeholder="Пост"
              onChange={(event) => setValuetWorkPlace(event.value)}
              options={WorkPlaceOpt}
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
        </div>


      )
    }

    ///Изделия / Узлы / Детали / Сварные швы
    if (select.select === 20) {
      return (
        <div>
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
              name="valuetTechProc"
              width="380px"
              value={valuetTechProc}
              placeholder="Технологический процесс"
              onChange={(event) => setValuetTechProc(event.value)}
              options={TechProc}
            />
          </div>


          {isModalNumb != 15
            ? (
              <div className={styles.row}>
                <Select
                  name="valuetTechProc"
                  width="380px"
                  value={valuetSeam}
                  placeholder="Сварочный шов"
                  onChange={(event) => setValuetSeam(event.value)}
                  options={SeamOptions}
                />
              </div>
            )
            : (
              <div className={styles.row}>

              </div>
            )

          }


        </div>
      )
    }
  }

  function FixedProduct(param, valEx) {

    param["valEx"] = valueExecutors
    param["masterId"] = masterValue
    param["inspectorId"] = techsValue
    param["productId"] = valueIdProduct
    param["seamId"] = valueSeamId
    if (valueTypeFixed === 1) {
      addProduct(param)
    }
    if (valueTypeFixed === 2) {
      addKnot(param)
    }
    if (valueTypeFixed === 3) {
      addDetail(param)
    }
    if (valueTypeFixed === 4) {
      addSeam(param)
    }
  }



  function displayFixedProd() {
    if (valueExecutors === 1) {

    }
    if (valueExecutors === 2) {
      getDetailByInspector(techsValue)
    }
  }


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

  ////////////////////////////////////////////////////////////////////
  return (
    <div className={styles.innerWrapper}>
     

      <div className={styles.tableWrapper}>
         
        {/*Рабочие места */}
        <TabPanel
          value={value_panel}
          indPanel={3}
          style={{ minWidth: "800px" }}
        >
          <Table
            title="Рабочие места"
            columns={columns.jobs_place}
            value={3}
            className="workshops"
            data={workplace}
            isLoading={isRequesting}
            actions={
              userRole === "Admin"
                ? [
                  {
                    icon: "add",
                    tooltip: "Добавить рабочее место",
                    isFreeAction: true,
                    onClick: () => {
                      setIsModalOpen(true);
                      setIsModalNumb(11)

                      setValueProdArea("")
                      setValuetTechProc("")
                      setValuetPosts("")
                      setValuetWorkPlace("")
                    },
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать рабочее место",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                      setIsModalNumb(3)

                      console.log(rowData)
                      setValueProdArea(rowData.workshop?.id)
                      setValuetTechProc(rowData.technologicalProcess?.id)
                      setValuetPosts(rowData.productionArea?.id)
                      setValuetWorkPlace(rowData.workplace?.id)
                    },
                  },
                ]
                : []
            }
            deleteAction={userRole === "Admin" ? deleteEquipment : null}
          />
        </TabPanel>

        {/*Изделия*/}
        <TabPanel
          value={value_panel2}
          indPanel={0}
          style={{ minWidth: "800px" }}
        >
          <Table
            title="Изделия"
            columns={columns.goods}
            value={0}
            data={product}
            isLoading={isRequesting}
            actions={
              userRole === "Admin"
                ? [
                  {
                    icon: "add",
                    tooltip: "Добавить изделие",
                    isFreeAction: true,
                    onClick: () => {
                      setIsModalOpen(true);
                      setIsModalNumb(12)

                      setValueProdArea("")
                      setValuetTechProc("")
                      setValuetPosts("")
                      setValueWorkplace("")

                    },
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать изделие",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                      setIsModalNumb(4)

                      setValueProdArea(rowData.workshop?.id)
                      setValuetTechProc(rowData.technologicalProcess?.id)
                      setValuetPosts(rowData.productionArea?.id)
                      setValueWorkplace(rowData.workplace?.id)
                    },
                  },
                ]
                : []
            }
            deleteAction={userRole === "Admin" ? deleteEquipment : null}
          />
        </TabPanel>
        {/*Узлы*/}
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
            isLoading={isRequesting}
            actions={
              userRole === "Admin"
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
                    },
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать узел",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                      setIsModalNumb(5)
                      setValueProdArea(rowData.workshop?.id)
                      setValuetTechProc(rowData.technologicalProcess?.id)
                      setValuetPosts(rowData.productionArea?.id)
                      setValuetWorkPlace(rowData.workplace?.id)
                    },
                  },
                ]
                : []
            }
            deleteAction={userRole === "Admin" ? deleteEquipment : null}
          />
        </TabPanel>
        {/*Детали*/}
        <TabPanel
          value={value_panel2}
          indPanel={2}
          style={{ minWidth: "800px" }}
        >
          <Table
            title="Детали"
            columns={columns.details}
            value={2}
            data={detail}
            isLoading={isRequesting}
            actions={
              userRole === "Admin"
                ? [
                  {
                    icon: "add",
                    tooltip: "Добавить деталь",
                    isFreeAction: true,
                    onClick: () => {
                      setIsModalOpen(true);
                      setIsModalNumb(14);
                      setValueProdArea("")
                      setValuetTechProc("")
                      setValuetPosts("")
                      setValuetWorkPlace("")
                    },
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать деталь",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                      setIsModalNumb(6)
                      setValueProdArea(rowData.workshop?.id)
                      setValuetTechProc(rowData.technologicalProcess?.id)
                      setValuetPosts(rowData.productionArea?.id)
                      setValuetWorkPlace(rowData.workplace?.id)
                    },
                  },
                ]
                : []
            }
            deleteAction={userRole === "Admin" ? deleteEquipment : null}
          />
        </TabPanel>
        {/*Сварные швы*/}
        <TabPanel
          value={value_panel2}
          indPanel={3}
          style={{ minWidth: "800px" }}
        >
          <Table
            title="Сварные швы"
            columns={columns.welding_seam}
            value={3}
            data={seam}
            isLoading={isRequesting}
            actions={
              userRole === "Admin"
                ? [
                  {
                    icon: "add",
                    tooltip: "Добавить шов",
                    isFreeAction: true,
                    onClick: () => {
                      setIsModalOpen(true);
                      setIsModalNumb(15);
                      setValueProdArea("")
                      setValuetTechProc("")
                      setValuetPosts("")
                      setValuetWorkPlace("")
                    },
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать шва",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                      setIsModalNumb(7)
                      setValueProdArea(rowData.workshop?.id)
                      setValuetTechProc(rowData.technologicalProcess?.id)
                      setValuetPosts(rowData.productionArea?.id)
                      setValuetWorkPlace(rowData.workplace?.id)
                    },
                  },
                ]
                : []
            }
            deleteAction={userRole === "Admin" ? deleteEquipment : null}
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
              value={3}
              data={value_goToBodyTable}
              isLoading={isRequesting}

              deleteAction={userRole === "Admin" ? deleteEquipment : null}
            />
          </TabPanel>
        </div>

      </div>


      {/*Закрепить*/}
      {/* <TabPanel
        value={value_panel}
        indPanel={0}
        style={{ minWidth: "800px" }}
      >
        <Table
          title="Цеха"
          columns={columns.workshops}
          value={0}
          data={workshop}
          isLoading={isRequesting} 
        />
      </TabPanel> */}



      <ResultsModal
        type={"EQUIPMENT"}
        activeId={activeEquipment}
        isOpen={isResultsModalOpen}
        setIsOpen={setIsResultsModalOpen}
      />

      <ModalWindow
        isOpen={isModalOpen}
        headerText={TitleTextModal(isModalNumb)}
        setIsOpen={(state) => {
          setIsModalOpen(state);
          setModalData(null);
        }}
        wrapperStyles={{ width: 420 }}
      >

        {isModalNumb < 4 || isModalNumb > 7 && isModalNumb < 12
          ? (
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

                  <DisplaySelects select={isModalNumb} />

                  <div className={styles.row}>
                    <Input
                      onChange={(e) => {
                        handleChange(e);
                      }}
                      style={{ width: 380, height: 40, padding: "0 20px 0 30px" }}
                      value={values.number}
                      name="number"
                      placeholder="Номер   "
                      onBlur={handleBlur}
                    />
                  </div>
                  <div className={styles.row}>
                    <Button
                      disabled={
                        values.number == "" || values.name == ""
                      }
                      type="submit"
                    >
                      {modalData ? "Сохранить" : "Создать"}
                    </Button>
                  </div>
                </form>
              )}
            </Formik>
          )
          : (
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

                  <DisplaySelects select={20} />

                  <div className={styles.row}>
                    <Button
                      type="submit"
                      disabled={
                        values.number == "" || values.name == "" || valueWorkplace == "" ||
                        valuetTechProc == "" || valuetPosts == ""
                      }
                    >
                      {modalData ? "Сохранить" : "Создать"}
                    </Button>
                  </div>
                </form>

              )}
            </Formik>
          )
        }

      </ModalWindow>



    </div>
  );
};
