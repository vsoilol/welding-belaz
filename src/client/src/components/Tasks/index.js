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


import deleteIcon from "assets/icons/delete.png";

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
    date: modalData?.weldingDate ?? "",
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
      title:"Удаление",
      render:(rowData)=>{
         return <img className={styles.deleteIcon} src={deleteIcon} onClick={()=>{
          setdeleteTaskModal(true);
          setidPlan(rowData?.id)
        }}></img>
      }
    },
    {
      title: "№ задания»", field: "number",
    }, 
    {
      title: "Номер шва", field: "seam.number",
    },
    {
      title: "Количество швов", field: "manufacturedAmount",
    },
    {
      title: "Дата ", field: "weldingDate",
    },
    {
      title: "Статус",
      field: "status",
      render: (rowData) => {
        if (rowData?.status === 3) {
          return <p className={styles.Done}>Завершено</p>;
        } else {
          return <p className={styles.InProcess}>В процессе</p>;
        }
      },
      customFilterAndSearch: (term, rowData) => {
        const statusString =
          rowData?.status === 3 ? "Завершено" : "В процессе";
        return statusString.toLowerCase().includes(term.toLowerCase());
      },
    },
    {
      title: "Наименование изделия",
      field: "seam.product.name",
      customFilterAndSearch: (term, rowData) => {
        return rowData?.seam?.product?.name?.toLowerCase().includes(term.toLowerCase()) ||
          rowData?.seam?.product?.number?.toLowerCase().includes(term.toLowerCase())
      },
      render: (rowData) => {
        if (rowData?.seam?.product) {
          return <p>{rowData.seam.product.name} {rowData.seam.product.number}</p>
        } else {
          return <p>-</p>
        }
      }
    },
    {
      title: "Наименование узла",
      field: "seam.knot.name",
      customFilterAndSearch: (term, rowData) => rowData?.seam?.knot?.name?.toLowerCase().includes(term.toLowerCase()),
      render: (rowData) => rowData?.seam?.knot ?
        <p>{`${rowData.seam.knot.name} ${rowData.seam.knot.number}`}</p> :
        <p>-</p>
    },
    {
      title: "Наименование детали",
      field: "seam.detail.name",
      customFilterAndSearch: (term, rowData) => rowData?.seam?.detail?.name?.toLowerCase().includes(term.toLowerCase()),
      render: (rowData) => rowData?.seam?.detail ?
        <p>{`${rowData.seam.detail.name} ${rowData.seam.detail.number}`}</p> :
        <p>-</p>
    },
    {
      title: "Оборудование  ( инвентарный номер )",
      field: "weldingEquipment.factoryNumber",
      customFilterAndSearch: (term, rowData) => rowData?.weldingEquipment?.factoryNumber?.toLowerCase().includes(term.toLowerCase()),
      render: (rowData) => rowData?.weldingEquipment?.factoryNumber ?? "-"
    },
    {
      title: "Исполнитель",
      field: "welder",
      customFilterAndSearch: (term, rowData) => {
        const fullName = `${rowData?.welder?.middleName} ${rowData?.welder?.firstName} ${rowData?.welder?.lastName}`.toLowerCase();
        return fullName.includes(term.toLowerCase());
      },
      render: (rowData) => rowData?.welder ?
        <p>{`${rowData.welder.middleName} ${rowData.welder.firstName} ${rowData.welder.lastName}`}</p> :
        <p>-</p>
    },
    {
      title: "Руководитель сварочных работ",
      field: "master",
      customFilterAndSearch: (term, rowData) => {
        const fullName = `${rowData?.master?.middleName} ${rowData?.master?.firstName} ${rowData?.master?.lastName}`.toLowerCase();
        return fullName.includes(term.toLowerCase());
      },
      render: (rowData) => rowData?.master ?
        <p>{`${rowData.master.middleName} ${rowData.master.firstName} ${rowData.master.lastName}`}</p> :
        <p>-</p>
    },
    {
      title: "Контролер",
      field: "inspector",
      customFilterAndSearch: (term, rowData) => {
        const fullName = `${rowData?.inspector?.middleName} ${rowData?.inspector?.firstName} ${rowData?.inspector?.lastName}`.toLowerCase();
        return fullName.includes(term.toLowerCase());
      },
      render: (rowData) => rowData?.inspector ?
        <p>{`${rowData.inspector.middleName} ${rowData.inspector.firstName} ${rowData.inspector.lastName}`}</p> :
        <p>-</p>
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
  const columnsWelder = [
    {
      title: "№ задания»", field: "number",
    }, 
    {
      title: "Номер шва", field: "seam.number",
    },
    {
      title: "Количество швов", field: "manufacturedAmount",
    },
    {
      title: "Дата ", field: "weldingDate",
    },
    {
      title: "Статус",
      field: "status",
      render: (rowData) => {
        if (rowData?.status === 3) {
          return <p className={styles.Done}>Завершено</p>;
        } else {
          return <p className={styles.InProcess}>В процессе</p>;
        }
      },
      customFilterAndSearch: (term, rowData) => {
        const statusString =
          rowData?.status === 3 ? "Завершено" : "В процессе";
        return statusString.toLowerCase().includes(term.toLowerCase());
      },
    },
    {
      title: "Наименование изделия",
      field: "seam.product.name",
      customFilterAndSearch: (term, rowData) => {
        return rowData?.seam?.product?.name?.toLowerCase().includes(term.toLowerCase()) ||
          rowData?.seam?.product?.number?.toLowerCase().includes(term.toLowerCase())
      },
      render: (rowData) => {
        if (rowData?.seam?.product) {
          return <p>{rowData.seam.product.name} {rowData.seam.product.number}</p>
        } else {
          return <p>-</p>
        }
      }
    },
    {
      title: "Наименование узла",
      field: "seam.knot.name",
      customFilterAndSearch: (term, rowData) => rowData?.seam?.knot?.name?.toLowerCase().includes(term.toLowerCase()),
      render: (rowData) => rowData?.seam?.knot ?
        <p>{`${rowData.seam.knot.name} ${rowData.seam.knot.number}`}</p> :
        <p>-</p>
    },
    {
      title: "Наименование детали",
      field: "seam.detail.name",
      customFilterAndSearch: (term, rowData) => rowData?.seam?.detail?.name?.toLowerCase().includes(term.toLowerCase()),
      render: (rowData) => rowData?.seam?.detail ?
        <p>{`${rowData.seam.detail.name} ${rowData.seam.detail.number}`}</p> :
        <p>-</p>
    },
    {
      title: "Оборудование  ( инвентарный номер )",
      field: "weldingEquipment.factoryNumber",
      customFilterAndSearch: (term, rowData) => rowData?.weldingEquipment?.factoryNumber?.toLowerCase().includes(term.toLowerCase()),
      render: (rowData) => rowData?.weldingEquipment?.factoryNumber ?? "-"
    },
    {
      title: "Исполнитель",
      field: "welder",
      customFilterAndSearch: (term, rowData) => {
        const fullName = `${rowData?.welder?.middleName} ${rowData?.welder?.firstName} ${rowData?.welder?.lastName}`.toLowerCase();
        return fullName.includes(term.toLowerCase());
      },
      render: (rowData) => rowData?.welder ?
        <p>{`${rowData.welder.middleName} ${rowData.welder.firstName} ${rowData.welder.lastName}`}</p> :
        <p>-</p>
    },
    {
      title: "Руководитель сварочных работ",
      field: "master",
      customFilterAndSearch: (term, rowData) => {
        const fullName = `${rowData?.master?.middleName} ${rowData?.master?.firstName} ${rowData?.master?.lastName}`.toLowerCase();
        return fullName.includes(term.toLowerCase());
      },
      render: (rowData) => rowData?.master ?
        <p>{`${rowData.master.middleName} ${rowData.master.firstName} ${rowData.master.lastName}`}</p> :
        <p>-</p>
    },
    {
      title: "Контролер",
      field: "inspector",
      customFilterAndSearch: (term, rowData) => {
        const fullName = `${rowData?.inspector?.middleName} ${rowData?.inspector?.firstName} ${rowData?.inspector?.lastName}`.toLowerCase();
        return fullName.includes(term.toLowerCase());
      },
      render: (rowData) => rowData?.inspector ?
        <p>{`${rowData.inspector.middleName} ${rowData.inspector.firstName} ${rowData.inspector.lastName}`}</p> :
        <p>-</p>
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
  const [modalchangeInfoproductAccount, setmodalchangeInfoproductAccount] = useState(false);
  const [AmountManufactured, setAmountManufactured] = useState(0);
  const [idPlan, setidPlan] = useState("");
  const [valChioseMaster, setvalChioseMaster] = useState(masters[0]?.id);



  function ChangeManufacturedDefective(AmountManufactured, variables) {


    ////Редактирование даты задания 
    api.put(`/WeldingTask/changeDate`, {
      "id": idPlan,
      "date": new Date(variables.date).toLocaleDateString('ru-RU')
    })
      .then((response) => { loadTasks() })
      .catch((error) => { });


    ////Редактирование количества швов 
    api.put(`/WeldingTask/changeSeamAmount`, {
      "id": idPlan,
      "seamAmount": AmountManufactured
    })
      .then((response) => { loadTasks() })
      .catch((error) => { });

    ////Редактирование количества швов 
    api.put(`/WeldingTask/changeSeamAmount`, {
      "id": idPlan,
      "seamAmount": AmountManufactured
    })
      .then((response) => { loadTasks() })
      .catch((error) => { });



    ////Редактирование статуса 
    if (isChecked1===true) {
      api.put(`/WeldingTask/changeStatus`, {
        "id": idPlan,
        "status": 3
       })
         .then((response) => { loadTasks() })
         .catch((error) => { });
    }
    else{
      api.put(`/WeldingTask/changeStatus`, {
        "id": idPlan,
        "status": 1
       })
         .then((response) => { loadTasks() })
         .catch((error) => { });
    } 
  }


  const [isChecked1, setIsChecked1] = useState(false);
  const [isChecked2, setIsChecked2] = useState(false);
  const [dateTask, setdateTask] = useState("");

  const handleCheckboxChange = (checkboxIndex) => {
    if (checkboxIndex === 1) {
      setIsChecked1(true);
      setIsChecked2(false);
    } else if (checkboxIndex === 2) {
      setIsChecked1(false);
      setIsChecked2(true);
    }
  };


  const [deleteTaskModal, setdeleteTaskModal] = useState(false);

  function deleteTaskAjax() {  
    api.remove(`/WeldingTask/${idPlan}`)
      .then((response) => { loadTasks() })
      .catch((error) => { });
  }
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
            columns={userRole === "Admin" || userRole === "Master"?columns:columnsWelder}
            data={combinedArray}
            isLoading={isRequesting}
            actions={
              userRole === "Admin" || userRole === "Master"
                ? [
                  {
                    icon: "edit",
                    tooltip: "Редактировать ",
                    onClick: (event, rowData) => {
                      setAmountManufactured(rowData?.manufacturedAmount)
                      setidPlan(rowData?.id)
                      setmodalchangeInfoproductAccount(true) 
                      if (rowData?.status===3) {
                        setIsChecked1(true)
                        setIsChecked2(false)
                      }
                      else{
                        setIsChecked1(false)
                        setIsChecked2(true)
                      }   
                      setdateTask(rowData?.weldingDate.split(".").reverse().join("-")) 
                    },
                  },
                ]
                : []
            }
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

        {/*Ввод выработки и брака*/}
        <ModalWindow
          isOpen={modalchangeInfoproductAccount}
          headerText="Редактировать"
          setIsOpen={(state) => {
            setmodalchangeInfoproductAccount(false)
          }}
          wrapperStyles={{ width: 420 }}
        >
          <Formik
            initialValues={initialValues}
            enableReinitialize
            onSubmit={(variables) => {
              const { id, ...dataToSend } = variables;
              setmodalchangeInfoproductAccount(false)
              ChangeManufacturedDefective(AmountManufactured, variables)
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
                  <p style={{ padding: "15px 20px 0 30px" }}>Изменение количества продукции из плана  </p>
                  <div className={styles.row}>
                    <Input
                      onChange={(e) => {
                        handleChange(e);
                        setAmountManufactured(e.target.value)
                      }}
                      style={{ height: 40, padding: "0 20px 0 30px", width: "100%" }}
                      value={AmountManufactured}
                      name="AmountManufactured"
                      placeholder="количества продукции из плана"
                      onBlur={handleBlur}
                      autocomplete="off"
                    />
                  </div>

                  <p style={{ padding: "15px 20px 0 30px" }}>Изменение даты задания </p>
                  <div className={styles.row}>

                    <Input
                      onChange={(e) => {
                        handleChange(e);   
                        setdateTask(e.target.value)
                      }}
                      width="200"
                      style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
                      value={dateTask}
                      name="date"
                      placeholder="Дата "
                      type="text"
                      onFocus={(e) => {
                        e.currentTarget.type = "date";
                      }}
                      onBlur={handleBlur}
                      autocomplete="off"
                    />
                  </div>

                  <p style={{ padding: "15px 20px 0 30px" }}>Изменение статус задания </p>
                  <div className={styles.rowCheck}>
                    <div className={styles.row}  onClick={() => handleCheckboxChange(1)}>
                      <input
                        type="checkbox"
                        checked={isChecked1} 
                      />
                      <span className={styles.Done}>Завершено</span>
                    </div>
                    <div className={styles.row} onClick={() => handleCheckboxChange(2)}>
                      <input
                        type="checkbox"
                        checked={isChecked2} 
                      />
                      <span className={styles.InProcess}>В процессе</span>
                    </div>
                  </div>


                  <div className={styles.row}>
                    <Button
                      disabled={
                        values.shiftNumb == ""
                      }
                      type="submit"
                    >
                      Изменить
                    </Button>
                  </div>

                </div>
              </form>
            )}
          </Formik>
        </ModalWindow>
        

        {/*Удаление задания*/}
        <ModalWindow
          isOpen={deleteTaskModal}
          headerText="Удаление"
          setIsOpen={(state) => {
            setdeleteTaskModal(false)
          }}
          wrapperStyles={{ width: 420 }}
        >
          <Formik
            initialValues={initialValues}
            enableReinitialize
            onSubmit={(variables) => {
              const { id, ...dataToSend } = variables;
              setdeleteTaskModal(false) 
              deleteTaskAjax()
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
                  <h4 style={{ padding: "35px 40px" }}>Вы уверены что хотите <span>удалить</span> данное задание ? </h4> 

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