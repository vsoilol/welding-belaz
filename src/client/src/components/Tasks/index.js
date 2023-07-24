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

import TableCell from "@material-ui/core/TableCell";
import TableRow from "@material-ui/core/TableRow";
import MaterialTable from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";

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
  const [modalData, setModalData] = useState(null);
  const dispatch = useDispatch();

  const [modalDataPasport, setmodalDataPasport] = useState(false);
  const [SequenceNumber, setSequenceNumber] = useState("");
  const [NumberTask, setNumberTask] = useState(null);


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
  const getDocument = () => {

    const number = tasks?.tasks.find(task => task.number === NumberTask).id;
    api.get(`file/seamPassport?TaskId=${number}&SequenceNumber=${SequenceNumber ?? ""}`, {
      responseType: "arraybuffer",
      dataType: "blob",
    })
      .then((response) => {
        const file = new Blob([response["data"]], {
          type: "application/pdf",
        });
        const fileURL = URL.createObjectURL(file);
        window.open(fileURL);
        setSequenceNumber(null)
      })
      .catch((error) => dispatch(setError(error?.response?.data?.title ?? "")));
  };



  const columns = [
    (userRole === "Admin" || userRole === "Master") && {
      title: "Удаление",
      render: (rowData) => (
        <img
          className={styles.deleteIcon}
          src={deleteIcon}
          onClick={() => {
            setdeleteTaskModal(true);
            setidPlan(rowData?.id)
          }}
        />
      ),
    },
    {
      title: "№ задания»", field: "number",
    },
    {
      title: "Номер шва", field: "seamNumber",
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
    /* {
      title: "Наименование изделия",
      field: "product.name",
      customFilterAndSearch: (term, rowData) => {
        return rowData?.product?.name?.toLowerCase().includes(term.toLowerCase()) ||
          rowData?.product?.number?.toLowerCase().includes(term.toLowerCase())
      },
      render: (rowData) => {
        if (rowData?.product) {
          return <p>{rowData.product.name} {rowData.product.number}</p>
        } else {
          return <p>-</p>
        }
      }
    }, */
    /* {
      title: "Уникальный номер",
      field: "uniqueNumber",
      customFilterAndSearch: (term, rowData) => {
        return rowData?.uniqueNumber?.toLowerCase().includes(term.toLowerCase()) ||
          rowData?.uniqueNumber?.toLowerCase().includes(term.toLowerCase())
      },
      render: (rowData) => {
        if (rowData?.uniqueNumber) {
          return <p>{rowData?.uniqueNumber}</p>
        } else {
          return <p>-</p>
        }
      }
    }, */
    /* {
      title: "Наименование узла",
      field: "knot.name",
      customFilterAndSearch: (term, rowData) => rowData?.knot?.name?.toLowerCase().includes(term.toLowerCase()),
      render: (rowData) => rowData?.knot ?
        <p>{`${rowData.knot.name} ${rowData.knot.number}`}</p> :
        <p>-</p>
    },
    {
      title: "Наименование детали",
      field: "detail.name",
      customFilterAndSearch: (term, rowData) => rowData?.detail?.name?.toLowerCase().includes(term.toLowerCase()),
      render: (rowData) => rowData?.detail ?
        <p>{`${rowData.detail.name} ${rowData.detail.number}`}</p> :
        <p>-</p>
    }, */
    /* {
      title: "Оборудование  ( инвентарный номер )",
      field: "weldingEquipments.factoryNumber",
      customFilterAndSearch: (term, rowData) => rowData?.weldingEquipments?.factoryNumber?.toLowerCase().includes(term.toLowerCase()),
      render: (rowData) => {
        if (rowData?.weldingEquipments) {
          return (
            <ul>
              {rowData.weldingEquipments.map(equipment => (
                <li key={equipment.factoryNumber}>
                  {`${equipment.name} ${equipment.factoryNumber}`}
                </li>
              ))}
            </ul>
          );
        } else {
          return <p>-</p>
        }
      }
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
    }, */
    {
      field: "url",
      title: "Скачать краткий паспорт",
      render: (rowData) => (
        <div
          onClick={() => { setgetFailebasedPassport(true); setBasedPassportId(rowData.id) }}
          className={styles.downloadButton}
        >
          <SaveIcon />
        </div>
      ),
      width: 54,
    },
    {
      field: "url",
      title: "Скачать паспорт",
      render: (rowData) => (
        <div
          onClick={() => { setmodalDataPasport(true); setNumberTask(rowData?.number) }}
          className={styles.downloadButton}
        >
          <SaveIcon />
        </div>
      ),
      width: 54,
    },
  ].filter(column => column);
  const columnsWelder = [
    {
      title: "№ задания»", field: "number",
    },
    {
      title: "Номер шва", field: "seamNumber",
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
      field: "product.name",
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
      field: "knot.name",
      customFilterAndSearch: (term, rowData) => rowData?.seam?.knot?.name?.toLowerCase().includes(term.toLowerCase()),
      render: (rowData) => rowData?.seam?.knot ?
        <p>{`${rowData.seam.knot.name} ${rowData.seam.knot.number}`}</p> :
        <p>-</p>
    },
    {
      title: "Наименование детали",
      field: "detail.name",
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
          onClick={() => { setmodalDataPasport(true); setNumberTask(rowData?.number) }}
          className={styles.downloadButton}
        >
          <SaveIcon />
        </div>
      ),
      width: 54
    },
  ];


  const renderRowChildren = (rowData) => {

    return (
      <TableContainer >
        <MaterialTable aria-label="simple table">
          <TableHead>
            <TableRow>
              <TableCell
                style={{
                  borderBottom: 0,
                }}
                align="center"
              >
                Наименование изделия
              </TableCell>
              <TableCell
                style={{
                  borderBottom: 0,
                }}
                align="center"
              >
                Наименование узла
              </TableCell>
              <TableCell
                style={{
                  borderBottom: 0,
                }}
                align="center"
              >
                Наименование детали
              </TableCell>


              <TableCell
                style={{
                  borderBottom: 0,
                }}
                align="center"
              >
                Оборудование  ( инвентарный номер )
              </TableCell>
              <TableCell
                style={{
                  borderBottom: 0,
                }}
                align="center"
              >
                Исполнитель
              </TableCell>
              <TableCell
                style={{
                  borderBottom: 0,
                }}
                align="center"
              >
                Руководитель сварочных работ
              </TableCell>
              <TableCell
                style={{
                  borderBottom: 0,
                }}
                align="center"
              >
                Контролер
              </TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            <TableRow  >
              <TableCell align="center">
                {rowData?.product?.name ?? "-"}
              </TableCell>
              <TableCell align="center">
                {rowData?.knot?.name && rowData?.knot?.number ? `${rowData?.knot?.name} ${rowData?.knot?.number}` : "-"}
              </TableCell>
              <TableCell align="center">
                {rowData?.detail?.name && rowData?.detail?.number ? `${rowData.detail.name} ${rowData.detail.number}` : "-"}
              </TableCell>
              <TableCell align="center">
                {rowData?.weldingEquipments.map(equipment => (
                  <li key={equipment.factoryNumber}>
                    {`${equipment.name} ${equipment.factoryNumber}`}
                  </li>
                ))}
              </TableCell>

              <TableCell align="center">
                {rowData?.welder?.middleName && rowData?.welder?.firstName && rowData?.welder?.lastName ? `${rowData.welder.middleName} ${rowData.welder.firstName} ${rowData.welder.lastName}` : "-"}
              </TableCell>

              <TableCell align="center">
                {rowData?.master?.middleName && rowData?.master?.firstName && rowData?.master?.lastName ? `${rowData.master.middleName} ${rowData.master.firstName} ${rowData.master.lastName}` : "-"}
              </TableCell>

              <TableCell align="center">
                {rowData?.inspector?.middleName && rowData?.inspector?.firstName && rowData?.inspector?.lastName ? `${rowData.inspector.middleName} ${rowData.inspector.firstName} ${rowData.inspector.lastName}` : "-"}
              </TableCell>


            </TableRow>
          </TableBody>
        </MaterialTable>
      </TableContainer>
    );
  };




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



  function ChangeManufacturedDefective(AmountManufactured, variables) {
    const promises = [];
    // Редактирование даты задания
    const datePromise = api.put(`/WeldingTask/changeDate`, {
      "id": idPlan,
      "date": new Date(variables.date).toLocaleDateString('ru-RU')
    })
      .then((response) => {
        loadTasks();
      })
      .catch((error) => {
        console.error(error);
      });
    promises.push(datePromise);
    // Редактирование количества швов 
    const seamAmountPromise = api.put(`/WeldingTask/changeSeamAmount`, {
      "id": idPlan,
      "seamAmount": AmountManufactured
    })
      .then((response) => {
        loadTasks();
      })
      .catch((error) => {
        console.error(error);
      });
    promises.push(seamAmountPromise);
    // Редактирование статуса
    const statusPromise = isChecked1
      ? api.put(`/WeldingTask/changeStatus`, { "id": idPlan, "status": 3 })
        .then((response) => {
          loadTasks();
        })
        .catch((error) => {
          console.error(error);
        })
      : api.put(`/WeldingTask/changeStatus`, { "id": idPlan, "status": 1 })
        .then((response) => {
          loadTasks();
        })
        .catch((error) => {
          console.error(error);
        });
    promises.push(statusPromise);
    Promise.all(promises)
      .then(() => {
        console.log('All requests have been completed.');
      })
      .catch((error) => {
        console.error(error);
      });
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

  
 


  const [getFailebasedPassport, setgetFailebasedPassport] = useState(false);
  const [BasedPassportId, setBasedPassportId] = useState("");

  const initialValuesbasedPassport = {
    SequenceNumber: "",
    AverageIntervalSeconds: "",
    SecondsToIgnoreBetweenGraphs: "",
  }

  function GetFailebasedPassport(params) {
    api.get(`file/based-seam-passport?TaskId=${BasedPassportId}&SequenceNumber=${params.SequenceNumber ?? ""}&AverageIntervalSeconds=&SecondsToIgnoreBetweenGraphs=`,
      {
        responseType: "arraybuffer",
        dataType: "blob",
      })
      .then((response) => {
        const file = new Blob([response["data"]], {
          type: "application/pdf",
        });
        const fileURL = URL.createObjectURL(file);
        window.open(fileURL);
        params.SequenceNumber = null
      })
      .catch((error) => { });

  }


  const [serchOnserialnumber, setserchOnserialnumber] = useState("");


  return (
    <div className={styles.innerWrapper}>
      <ToolTip
        title="Задания"
        toolTipText="Здесь Вы можете назначить задания на сварку, посмотреть паспорт сварного стыка"
        src={tasksImage}
      />

      {userRole === "Admin" || userRole === "Master" || userRole === "Inspector"
        ? (
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
        )
        : null
      }


      <div className={styles.tableWrapper}>
        <div className={styles.datePeriod}>
          <label>Поиск задания по <br></br>порядковому номеру изделия</label>
          <div>
            <div className={styles.row}>
              <Input
                onChange={(e) => {
                  setserchOnserialnumber(e.target.value);
                }}
                style={{
                  width: 280,
                  height: 40, 
                }}
                type="number"
                min="0"
                step="1"
                value={serchOnserialnumber}
                name={`serchOnserialnumber`}
                placeholder="Порядковый номер "
                autocomplete="off"
              />
            </div>
            <button className={styles.sort} onClick={() => { /* FindTask()  */}} >
              Найти
            </button>
          </div>
        </div>
        {/*Сменные задания на сварку*/}
        <TabPanel
          value={value_panel}
          indPanel={0}
          style={{ minWidth: "1200px", }}
        >
          <Table
            title="Сменные задания на сварку"
            columns={userRole === "Admin" || userRole === "Master" ? columns : columnsWelder}
            data={tasks?.tasks}
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
                      if (rowData?.status === 3) {
                        setIsChecked1(true)
                        setIsChecked2(false)
                      }
                      else {
                        setIsChecked1(false)
                        setIsChecked2(true)
                      }
                      setdateTask(rowData?.weldingDate.split(".").reverse().join("-"))
                    },
                  },
                ]
                : []
            }
            renderRowChildren={renderRowChildren}
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
              loadTasks={loadTasks}
            />
          )
          : null
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
                    <div className={styles.row} onClick={() => handleCheckboxChange(1)}>
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

        {/*Получение краткого паспорта */}
        <ModalWindow
          isOpen={getFailebasedPassport}
          headerText="Получение паспорта"
          setIsOpen={(state) => {
            setgetFailebasedPassport(false)
          }}
          wrapperStyles={{ width: 420 }}
        >
          <Formik
            initialValues={initialValuesbasedPassport}
            enableReinitialize
            onSubmit={(variables) => {
              const { id, ...dataToSend } = variables;
              setgetFailebasedPassport(false)
              GetFailebasedPassport(variables, id)
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
                  {/* <div className={styles.row}>
                    <Input
                      onChange={(e) => {
                        handleChange(e);
                      }}
                      style={{ height: 40, padding: "0 20px 0 30px", width: "100%" }}
                      value={values.SequenceNumber}
                      name="SequenceNumber"
                      placeholder="Интервал времени в секундах"
                      onBlur={handleBlur}
                      autocomplete="off"
                    />
                  </div> */}

                  <div className={styles.row}>
                    <Input
                      onChange={(e) => {
                        handleChange(e);
                      }}
                      style={{ height: 40, padding: "0 20px 0 30px", width: "100%" }}
                      value={values.AverageIntervalSeconds}
                      name="AverageIntervalSeconds"
                      placeholder="Порядковый номер"
                      onBlur={handleBlur}
                      autocomplete="off"
                    />
                  </div>

                  {/* <div className={styles.row}>
                    <Input
                      onChange={(e) => {
                        handleChange(e);
                      }}
                      style={{ height: 40, padding: "0 20px 0 30px", width: "100%" }}
                      value={values.SecondsToIgnoreBetweenGraphs}
                      name="SecondsToIgnoreBetweenGraphs"
                      placeholder="Интервал времени"
                      onBlur={handleBlur}
                      autocomplete="off"
                    />
                  </div> */}

                  <div className={styles.row}>
                    <Button
                      type="submit"
                    >
                      Получить
                    </Button>
                  </div>

                </div>
              </form>
            )}
          </Formik>
        </ModalWindow>

        {/*Получение паспорта */}
        <ModalWindow
          isOpen={modalDataPasport}
          headerText="Получение паспорта"
          setIsOpen={(state) => {
            setmodalDataPasport(false)
          }}
          wrapperStyles={{ width: 420 }}
        >
          <Formik
            initialValues={initialValuesbasedPassport}
            enableReinitialize
            onSubmit={(variables) => {
              const { id, ...dataToSend } = variables;
              setmodalDataPasport(false)
              getDocument()
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


                  <div className={styles.row}>
                    <Input
                      onChange={(e) => {
                        setSequenceNumber(e.target.value);
                      }}
                      style={{ height: 40, padding: "0 20px 0 30px", width: "100%" }}
                      value={SequenceNumber}
                      name="SequenceNumber"
                      placeholder="Порядковый номер"
                      onBlur={handleBlur}
                      autocomplete="off"
                    />
                  </div>



                  <div className={styles.row}>
                    <Button
                      type="submit"
                    >
                      Получить
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

