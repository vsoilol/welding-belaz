import Paper from "@material-ui/core/Paper";
import MaterialTable from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import SaveIcon from "@material-ui/icons/Save";
import { equipmentImage } from "assets/pics";
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
import imgcalendar from "assets/icons/calendar.png";
import deleteIcon from "assets/icons/delete.png";

import { Upload } from "components/Upload/index";
import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";
import api from "services/api";

const dateOptions = {
  day: "numeric",
  month: "short",
  year: "numeric",
};

export const Equipment = ({
  loadEquipment,
  loadMasters,
  loadPosts,

  equipment,
  addEquipment,
  deleteEquipment,
  editEquipment,
  isRequesting,
  masters,
  userRole,

  posts,
  value,
  loadWelder,

  addDowntime,
  editDowntime,
  welder,

  reason,
  loadDowntime,
  loadWorkshop,

  assignWelders,
  assignMaster,

  loadArea, 
  workplace,
  loadworkplace,
  workshop,
  area,
}) => {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [modalData, setModalData] = useState(null);
  const [isResultsModalOpen, setIsResultsModalOpen] = useState(false);
  const [activeEquipment, setActiveEquipment] = useState("");
  const [open, setOpen] = useState(false);
  const [valuetPosts, setValuetPosts] = useState();
  const [valuetPostsNumber, setValuetPostsNumber] = useState("");
  const [isModalNumb, setIsModalNumb] = useState(0);

  const [isEquipmentNumb, setEquipmentNumb] = useState(0);

  const [valueReason, setValueReaso] = useState();
  const [valuetEquipment, setValuetEquipment] = useState();
  const [valueDownti, setValueDownti] = useState();
  const [valueTime, setTime] = useState();
  const [valueData, setData] = useState();
 


  const [valueMaster, setvalueMaster] = useState("");
  const [valueWelder, setvalueWelder] = useState("");



  const [valueChoiseWelder, setvalueChoiseWelder] = useState(false);


  //weldingEquipmentId
  const [weldingEquipmentId, setweldingEquipmentId] = useState(null);

  const [deleteTaskModal, setdeleteTaskModal] = useState(false);
  const initialValues = {
    rfidTag: modalData?.rfidTag ?? "",
    name: modalData?.name ?? "",
    marking: modalData?.marking ?? "",
    factoryNumber: modalData?.factoryNumber ?? "",
    height: modalData?.height ?? "",
    width: modalData?.width ?? "",
    lenght: modalData?.lenght ?? "",
    groupNumber: modalData?.groupNumber ?? "",
    manufacturerName: modalData?.manufacturerName ?? "",
 
    nextAttestationDate: modalData?.nextAttestationDate ?? "",
    commissioningDate:  modalData?.commissioningDate ?? "",
   
    weldingProcess: modalData?.weldingProcess ?? "",
    idleVoltage: modalData?.idleVoltage ?? "",
    weldingCurrentMin: modalData?.weldingCurrentMin ?? "",
    weldingCurrentMax: modalData?.weldingCurrentMax ?? "",
    arcVoltageMin: modalData?.arcVoltageMin ?? "",
    arcVoltageMax: modalData?.arcVoltageMax ?? "",


    timeStates: modalData?.startConditionTime ?? "",
    time: modalData?.time ?? "",
    weldingEquipmentId: modalData?.weldingEquipment?.id ?? "",
    date: modalData?.date ?? "",
    Date: modalData?.Date ?? "",

  };
  const [valueWorkplace, setvalueWorkplace] = useState(0);

  useEffect(() => {
    loadEquipment();
    loadMasters();
    loadPosts();
    loadDowntime();
    loadWorkshop();
    loadWelder();

    loadWorkshop();
    loadArea();
    loadworkplace();
  }, [loadEquipment, loadMasters, loadPosts, loadDowntime, loadWorkshop, loadWelder, loadWorkshop, loadArea,loadworkplace]);
 

  const columns = [
    (userRole === "Admin" /* || userRole === "Master" */) && {
      title: "Удаление",
      render: (rowData) => (
        <img
          className={styles.deleteIcon}
          src={deleteIcon}
          onClick={() => {
            setdeleteTaskModal(true);
            setweldingEquipmentId(rowData?.id)
          }}
        />
      ),
    },
    { title: "Наименование", field: "name" },
    { title: "Маркировка", field: "marking" },
    {
      title: "RFID метка",
      render: (rowData) => {
        return <p>{rowData?.rfidTag ?? rowData?.idFromSystem}</p>;
      },

    },
    { title: "Заводской  (инвентарный) номер", field: "factoryNumber" },
    { title: "Дата ввода в эксплуатацию", field: "commissioningDate" },
    { title: "Номер группы оборудования", field: "groupNumber" },
    { title: "Наименование изготовителя", field: "manufacturerName" },
    { title: "Дата очередной аттестации", field: "nextAttestationDate" },

    {
      title: "Наименование цеха", field: "workshop.name"
    },
    {
      title: "Номер цеха", field: "workshop.number"
    },
    {
      title: "Наименование производственного участка", field: "productionArea.name"
    },
    {
      title: "Номер производственного участка", field: "productionArea.number"
    },
    /* {
      title: "Наименование   поста ",
      render: (rowData) => {
        return <span>{DetArea(rowData?.post, "name") ?? "-"}</span>
      },
    },
    {
      title: "Номер поста",
      render: (rowData) => {
        return <span>{DetArea(rowData?.post, "numb") ?? "-"}</span>
      },
    }, */
    /* {
      title: "Закрерить сотрудников",
      render: (rowData) => {
        return <p className={styles.Fix} onClick={e => { setvalueChoiseWelder(true); setweldingEquipmentId(rowData?.id) }}>Закрерить</p>;
      },
    }, */
    {
      title: "Просмотреть календарь",
      render: (rowData) => {
        return <img onClick={e => OpenCalendar(rowData)} className={styles.imgcalendar} src={imgcalendar}></img>;
      },
    }
  ].filter(column => column);

  const columns2 = [
    {
      title: "Дата",
      field: "date"
    },
    {
      title: "Время начала простоя",
      field: "startConditionTime"
    },
    {
      title: "Длительность",
      field: "time"
    },
    {
      title: "Причина простоя",
      field: "downtimeReason"
    },
    {
      title: "Наименование оборудования",
      field: "weldingEquipment.name"
    },
    {
      title: "Номер оборудования",
      field: "weldingEquipment.factoryNumber"
    },
  ]
  function DetArea(params, field) {
    if (field === "name") {
      for (let index = 0; index < posts?.length; index++) {
        if (posts[index]?.id === params) {
          return posts[index].name
        }
      }
    }
    if (field === "numb") {
      for (let index = 0; index < posts?.length; index++) {
        if (posts[index]?.id === params) {
          return posts[index].number
        }
      }
    }


  }
  
  function OpenCalendar(rowData) {
    window.localStorage.removeItem("executor")
    window.localStorage.setItem("equipment", JSON.stringify(rowData)) 
    setTimeout(() => {
      window.location.href = "/calendar"
    }, 500);
  }

  const renderRowChildren = (rowData) => {
    return (
      rowData && (
        <TableContainer component={Paper}>
          <MaterialTable aria-label="simple table">
            <TableHead>
              <TableRow>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                >
                  Процесс сварки
                </TableCell>

                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                >
                  Напряжение холостого хода, В
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                  colSpan={2}
                >
                  Диапазон сварочного тока, А
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                  colSpan={2}
                >
                  Диапазон напряжения на дуге, В
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                >
                  Продолжительность включения/нагрузки, %
                </TableCell>
                {/* <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                  colSpan={3}
                >
                  Габариты
                </TableCell> */}
              </TableRow>
              <TableRow>
                <TableCell />
                <TableCell />
                <TableCell align="center">min</TableCell>
                <TableCell align="center">max</TableCell>
                <TableCell align="center">min</TableCell>
                <TableCell align="center">max</TableCell>
                <TableCell />
                {/* <TableCell align="center">Длина</TableCell>
                <TableCell align="center">Высота</TableCell>
                <TableCell align="center">Ширина</TableCell> */}
              </TableRow>
            </TableHead>
            <TableBody>
              <TableRow>
                <TableCell align="center" component="th" scope="row">
                  {rowData?.weldingProcess ?? "-"}
                </TableCell>
                <TableCell align="center" component="th" scope="row">
                  {rowData?.idleVoltage ?? "-"}
                </TableCell>
                <TableCell align="center">
                  {rowData?.weldingCurrentMin ?? "-"}
                </TableCell>
                <TableCell align="center">
                  {rowData?.weldingCurrentMax ?? "-"}
                </TableCell>
                <TableCell align="center">
                  {rowData?.arcVoltageMin ?? "-"}
                </TableCell>
                <TableCell align="center">
                  {rowData?.arcVoltageMax ?? "-"}
                </TableCell>
                <TableCell align="center" component="th" scope="row">
                  {rowData?.loadDuration ?? "-"}
                </TableCell>
                {/* <TableCell align="center" component="th" scope="row">
                  {rowData?.lenght ?? "-"}
                </TableCell>
                <TableCell align="center" component="th" scope="row">
                  {rowData?.height ?? "-"}
                </TableCell>
                <TableCell align="center" component="th" scope="row">
                  {rowData?.width ?? "-"}
                </TableCell> */}
              </TableRow>
            </TableBody>
          </MaterialTable>
        </TableContainer>
      )
    );
  };


  const [valueWorkshop, setvalueWorkshop] = useState(null);
  const [valueoptArea, setvalueoptArea] = useState(null);
  const optworkshop = workshop?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });
  const optArea = area?.map((item) => {
    return {
      value: item.id,
      label: `№${item.number} ${item.name} `,
    };
  });


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
  //select Посты   
  const optPosts = [
    { value: null, label: "Не выбрано" },
    ...(posts?.map((item) => ({
      value: item.id,
      label: `Пост ${item.number}`,
    })) || []),
  ];
  const reasonOptions = reason?.map((item) => {
    return {
      value: item.id,
      label: item.reason,
    };
  });
  const optequipment = equipment[0]?.map((item) => {
    return {
      value: item.id,
      label: `${item.name} ${item.factoryNumber}`,
    };
  });
  function SendData(variables) {
    let commissioningDate = variables.commissioningDate;
    if (!isNaN(new Date(variables.commissioningDate))) {
      commissioningDate = new Date(variables.commissioningDate).toLocaleDateString('ru-RU', { dateStyle: 'short' });
    } 
    variables.id = isEquipmentNumb;
    variables.postId = valuetPosts;
    variables.postNumber = valuetPostsNumber;
    variables.commissioningDate = commissioningDate;
    variables.nextAttestationDate = new Date(variables.nextAttestationDate).toLocaleDateString('ru-RU', { dateStyle: 'short' });

    variables.workplaceIds = [valueWorkplace]; 

    if (isModalNumb === 0) {
      addEquipment(variables);
    }
    if (isModalNumb === 1) {
      editEquipment(variables);
    }

    variables.downtimeReasonId = valueReason;
    variables.weldingEquipmentId = valuetEquipment;
    variables.Date = new Date(valueData).toLocaleDateString('ru-RU', { dateStyle: 'short' });
    variables.idDownti = valueDownti;
    variables.time = valueTime;
    
    if (isModalNumb === 3) {
      
      const dataReason={
        "id": variables.idDownti,
        "weldingEquipmentId":  variables.weldingEquipmentId,
        "downtimeReasonId": variables.downtimeReasonId,
        "date":   variables.Date,
        "startConditionTime":  variables.timeStates,
        "time":  variables.time
      }
      api.put("/WeldingEquipment/downtime",dataReason)
      .then(()=>{
        loadEquipment()
      })  
    }
  }

  function findReason(params) {
    for (let index = 0; index < reason.length; index++) {
      if (reason[index].reason === params) {
        setValueReaso(reason[index].id)
        break
      }
    }
  }


  const optionMasters = masters?.map((item) => {
    return {
      value: item.id,
      label: `${item.middleName} ${item.firstName} ${item.lastName}`,
    };
  });

  const optionWelder = welder?.map((item) => {
    return {
      value: item.id,
      label: `${item.middleName} ${item.firstName} ${item.lastName}`,
    };
  });



  function assignWeldersFunction(idWelder, idMaster) {

    const ArrayWelders = welder?.filter(obj => obj.active === 1).map(obj => obj.id);
    let dataWelders = {
      weldingEquipmentId: weldingEquipmentId,
      welderIds: ArrayWelders,
    }
    assignWelders(dataWelders)

    let dataMaster = {
      weldingEquipmentIds: weldingEquipmentId,
      masterId: idMaster,
    }
    assignMaster(dataMaster)
  }
  const handleSelectChange = (event) => {
    if (event.active === undefined) {
      event.active = 1
    }
    else if (event.active === 0) {
      event.active = 1
    }
    else if (event.active === 1) {
      event.active = 0
    }
  }; 


  const optWorkPlase = workplace?.map((item) => {
    return {
      value: item.id,
      label: `Рабочее место №${item.number}`,
    };
  });
  ////////////////////////////////////////////////////////////////////
  return (

    <div className={styles.innerWrapper}>
      <ToolTip
        title="Оборудование"
        toolTipText="Здесь Вы можете просмотреть оборудование, его технические характеристики"/* , отчет о работе */
        src={equipmentImage}
        workshop={workshop}
        equipment={equipment}
      />
      {open ? (
        <Modal
          open={open}
          setOpen={setOpen}
          children={<EquipmentMap equipment={equipment} />}
        />
      ) : null}

      <Tabs
        value={value_panel}
        onChange={ChangePanels}
        indicatorColor="primary"
        textColor="primary"
        aria-label="full width tabs example"
      >
        <Tab label="Сварочное оборудование" />
        <Tab label="Простои оборудования " />
      </Tabs>


      <div className={styles.tableWrapper}>
        {/*Сварочное оборудование*/}
        <TabPanel
          value={value_panel}
          indPanel={0}
          style={{ minWidth: "800px", }}
        >
          <Table
            title="Сварочное оборудование "
            columns={columns}
            data={equipment[0]}
            isLoading={isRequesting}
            actions={
              userRole === "Admin" /* || userRole === "Master" */
                ? [
                  {
                    icon: "add",
                    tooltip: "Добавить оборудование",
                    isFreeAction: true,
                    onClick: () => {
                      setIsModalNumb(0);
                      setIsModalOpen(true)
                      api.post(`/eventLog`, {
                        "information": "Открыл модальное окно добавления оборудования "
                      })
                    },
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать оборудование",
                    onClick: (event, rowData) => { 
                      setModalData(rowData);
                      setIsModalOpen(true);
                      setIsModalNumb(1);
                      setEquipmentNumb(rowData?.id)
                      setValuetPosts(rowData?.post?.id)
                      setvalueWorkshop(rowData?.workshop?.id)
                      setvalueoptArea(rowData?.productionArea?.id)
                      setvalueWorkplace(rowData?.workplaces[0]?.id)
                      api.post(`/eventLog`, {
                        "information": "Открыл модальное окно редактирования оборудования "
                      })
                    },
                  },
                ]
                : []
            }
            renderRowChildren={renderRowChildren}
          />
        </TabPanel>
        {/*Простои оборудования*/}
        <TabPanel
          value={value_panel}
          indPanel={1}
          style={{ minWidth: "800px", }}
        >
          <Table
            title="Простои оборудования "
            columns={columns2}
            data={equipment[1]}
            isLoading={isRequesting}
            actions={
              userRole === "Admin" || userRole === "Master"
                ? [
                 /*  {
                    icon: "add",
                    tooltip: "Добавить Простои",
                    isFreeAction: true,
                    onClick: () => { setIsModalOpen(true); setIsModalNumb(2) },
                  }, */
                  {
                    icon: "edit",
                    tooltip: "Редактировать Простои",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                      setIsModalNumb(3);
 
                      setValueDownti(rowData?.id)
                      setValuetEquipment(rowData?.weldingEquipment.id)
                      findReason(rowData?.downtimeReason)
                      setTime(rowData?.time)
                      setData(rowData?.date.split('.').reverse().join('-'))
                    },
                  },
                ]
                : []
            }
          />
        </TabPanel>

      </div>
      <ResultsModal
        type={"EQUIPMENT"}
        activeId={activeEquipment}
        isOpen={isResultsModalOpen}
        setIsOpen={setIsResultsModalOpen}
      />


      {/*Закрерить сотрудников*/}
      <ModalWindow
        isOpen={valueChoiseWelder}
        headerText="Закрерить сотрудников"
        setIsOpen={(state) => {
          setvalueChoiseWelder(false)
        }}
        wrapperStyles={{ width: 420 }}
      >
        <Formik
          initialValues={initialValues}
          enableReinitialize
          onSubmit={(variables) => {
            const { id, ...dataToSend } = variables;

            assignWeldersFunction(valueWelder, valueMaster)
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
                  name="valueMaster"
                  value={valueMaster}
                  width="380px"
                  placeholder="Мастер"
                  onChange={(event) => {
                    setvalueMaster(event.value)
                  }}
                  options={optionMasters}
                />
              </div>
              <p className={styles.titleSelects}>Сварщики</p>
              <div className={styles.equipments} >
                {welder?.map((option) => (
                  <div   >
                    <input
                      type="checkbox"
                      onChange={e => { handleSelectChange(option) }}
                    />
                    <span>{`${option.middleName} ${option.firstName} ${option.lastName}`}</span>
                  </div>
                ))}
              </div>
              {/* <div className={styles.row}>
                  <Select
                    name="valueWelder"
                    value={valueWelder}
                    width="380px"
                    placeholder="Сварщик"
                    onChange={(event) => {
                      setvalueWelder(event.value)
                    }}
                    options={optionWelder}
                  />
                </div>  */}

              <div className={styles.row}>
                <Button
                  disabled={
                    values.shiftNumb == ""
                  }
                  type="submit"
                >
                  Закрепить
                </Button>
              </div>
            </form>
          )}
        </Formik>
      </ModalWindow>


      <ModalWindow
        isOpen={isModalOpen}
        headerText={
          modalData ? "Редактировать " : "Добавить "
        }
        setIsOpen={(state) => {
          setIsModalOpen(state);
          setModalData(null);
        }}
        wrapperStyles={{ width: 420 }}
      >
        {isModalNumb === 0 || isModalNumb === 1
          ? (
            <Formik
              initialValues={initialValues}
              enableReinitialize
              onSubmit={(variables) => {
                const { id, ...dataToSend } = variables;
                SendData(variables)
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
                  {/* <div className={styles.row}>
                    <Select
                      name="postId"
                      value={valuetPosts}
                      width="380px"
                      placeholder="Номер поста"
                      onChange={(event) => {
                        setValuetPosts(event.value);
                        setValuetPostsNumber(event.label)
                      }}
                      options={optPosts}
                    /> 
                  </div> */}
                  <div className={styles.row}>
                    <Select
                      name="valueWorkplace"
                      value={valueWorkplace}
                      width="380px"
                      placeholder="Рабочее место"
                      onChange={(event) => {
                        setvalueWorkplace(event.value)
                      }}
                      options={optWorkPlase}
                    />
                  </div>

                  <div className={styles.row}>
                    <Select
                      name="valueWorkshop"
                      value={valueWorkshop}
                      width="380px"
                      placeholder="Цех"
                      onChange={(event) => {
                        setvalueWorkshop(event.value)
                      }}
                      options={optworkshop}
                    />
                  </div>

                  <div className={styles.row}>
                    <Select
                      name="valueoptArea"
                      value={valueoptArea}
                      width="380px"
                      placeholder="Поизводственный участок"
                      onChange={(event) => {
                        setvalueoptArea(event.value)
                      }}
                      options={optArea}
                    />
                  </div>


                  <div className={styles.row}>
                    <Input
                      onChange={(e) => {
                        if (/^[а-яА-ЯЁё\s]+$/.test(e.target.value)) {
                          handleChange(e);
                        }
                      }}
                      width="200"
                      style={{ height: 40, padding: "0 20px 0 30px" }}
                      value={values.name}
                      name="name"
                      placeholder="Наименовние"
                      onBlur={handleBlur}
                      autocomplete="off"
                    />

                    <Input
                      onChange={(e) => {
                        if (value === "" || /^[A-Za-z0-9-]+$/.test(e.target.value)) {
                          handleChange(e);
                        }
                      }}
                      width="200"
                      style={{ height: 40, padding: "0 20px 0 30px" }}
                      value={values.marking}
                      name="marking"
                      placeholder="Маркировка"
                      onBlur={handleBlur}
                      autocomplete="off"
                    />
                  </div>
                  <div className={styles.row}>
                    <Input
                      onChange={(e) => {
                        const value = e.target.value;
                        if (value === "" || /^[0-9A-Za-z:]+$/.test(value)) {
                          handleChange(e);
                        }
                      }}
                      style={{
                        width: 380,
                        height: 40,
                      }}
                      value={values.rfidTag}
                      name={`rfidTag`}
                      placeholder="RFID метка"
                      autocomplete="off"
                    />
                  </div>

                  <div className={styles.row}>


                    <Input
                      onChange={(e) => {
                        handleChange(e);
                      }}
                      style={{
                        width: 380,
                        height: 40,
                        padding: "0px 0px 0px 20px"
                      }}
                      type="number"
                      min="0"
                      step="1"
                      value={values.factoryNumber}
                      name={`factoryNumber`}
                      placeholder="Заводской  (инвентарный) номер"
                      autocomplete="off"
                    />
                  </div>

                  <div className={styles.row}>

                    <Input
                      onChange={(e) => {
                        handleChange(e);
                      }}
                      width="200"
                      style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
                      value={values.nextAttestationDate}
                      name="nextAttestationDate"
                      placeholder="Дата очередной аттестации (ППР)»"
                      type="text"
                      onFocus={(e) => {
                        e.currentTarget.type = "date";
                      }}
                      onBlur={handleBlur}
                      autocomplete="off"
                    />


                    <Input
                      onChange={(e) => {
                        handleChange(e);
                      }}
                      width="200"
                      style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
                      value={values.commissioningDate}
                      name="commissioningDate"
                      placeholder="Дата ввода в эксплуатацию"
                      type="text"
                      onFocus={(e) => {
                        e.currentTarget.type = "date";
                      }}
                      onBlur={handleBlur}
                      autocomplete="off"
                    />
                  </div>
                  <div className={styles.row}>
                    <Input
                      onChange={(e) => {
                        if (/^[а-яА-ЯЁё\s]+$/.test(e.target.value)) {
                          handleChange(e);
                        }
                      }}
                      style={{
                        width: 280,
                        height: 40,
                        paddingLeft: 20,
                      }}
                      value={values.weldingProcess}
                      name={`weldingProcess`}
                      placeholder="Процесс сварки"
                      autocomplete="off"
                    />
                    <Input
                      onChange={(e) => {
                        handleChange(e);
                      }}
                      style={{
                        width: 280,
                        height: 40,
                        paddingLeft: 20,
                      }}
                      type="number"
                      min="0"
                      step="1"
                      value={values.idleVoltage}
                      name={`idleVoltage`}
                      placeholder="Напряжение холостого хода"
                      autocomplete="off"
                    />
                  </div>
                  <div className={styles.row}>

                    {/* <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{
                      width: 380,
                      height: 40,
                      paddingLeft: 20,
                    }}
                    value={values.loadPercentage}
                    name={`loadPercentage`}
                    placeholder="Продолжительность нагрузки, %"
                  /> */}
                    <Input
                      onChange={(e) => {
                        handleChange(e);
                      }}
                      style={{
                        width: 380,
                        height: 40,
                        paddingLeft: 20,
                      }}
                      value={values.manufacturerName}
                      name={`manufacturerName`}
                      placeholder="Наименование изготовителя"
                      autocomplete="off"
                    />
                  </div>
                  <p className={styles.text} >Габариты</p>
                  <div className={styles.row}>
                    <Input
                      onChange={(e) => {
                        handleChange(e);
                      }}
                      style={{
                        width: 280,
                        height: 40,
                        paddingLeft: 20,
                      }}
                      type="number"
                      min="0"
                      step="1"
                      value={values.height}
                      name={`height`}
                      autocomplete="off"
                      placeholder="Высота"
                    />
                    <Input
                      onChange={(e) => {
                        handleChange(e);
                      }}
                      style={{
                        width: 280,
                        height: 40,
                        paddingLeft: 20,
                      }}
                      type="number"
                      min="0"
                      step="1"
                      value={values.width}
                      name={`width`}
                      placeholder="Ширина"
                      autocomplete="off"
                    />
                    <Input
                      onChange={(e) => {
                        handleChange(e);
                      }}
                      style={{
                        width: 280,
                        height: 40,
                        paddingLeft: 20,
                      }}
                      type="number"
                      min="0"
                      step="1"
                      value={values.lenght}
                      name={`lenght`}
                      placeholder="Длина"
                      autocomplete="off"
                    />

                  </div>
                  <div className={styles.row}>
                    <Input
                      onChange={(e) => {
                        handleChange(e);
                      }}
                      style={{
                        width: 280,
                        height: 40,
                        paddingLeft: 20,
                      }}
                      autocomplete="off"
                      value={values.groupNumber}
                      name={`groupNumber`}
                      placeholder="Номер группы оборудования"
                    />


                  </div>


                  <p className={styles.text}>Диапазон сварочного тока:</p>
                  <div className={styles.row}>
                    <Input
                      onChange={(e) => {
                        const re = /^[0-9]+([,.][0-9]*)?$/;
                        if (e.target.value === '' || re.test(e.target.value)) {
                          handleChange(e);
                        }
                      }}
                      style={{
                        width: 180,
                        height: 40,
                        paddingLeft: 20,
                      }}
                      type="number"
                      min="0"
                      value={values.weldingCurrentMin}
                      name={`weldingCurrentMin`}
                      placeholder="min"
                      onBlur={handleBlur}
                      autocomplete="off"
                    />
                    <Input
                      onChange={(e) => {
                        const re = /^[0-9]+([,.][0-9]*)?$/;
                        if (e.target.value === '' || re.test(e.target.value)) {
                          handleChange(e);
                        }
                      }}
                      style={{
                        width: 180,
                        height: 40,
                        paddingLeft: 20,
                      }}
                      type="number"
                      min="0"
                      value={values.weldingCurrentMax}
                      name={`weldingCurrentMax`}
                      placeholder="max"
                      autocomplete="off"

                    />
                  </div>
                  <p className={styles.text}>Диапазон напряжения на дуге:</p>
                  <div className={styles.row}>
                    <Input
                      onChange={(e) => {
                        const re = /^[0-9]+([,.][0-9]*)?$/;
                        if (e.target.value === '' || re.test(e.target.value)) {
                          handleChange(e);
                        }
                      }}
                      style={{
                        width: 180,
                        height: 40,
                        paddingLeft: 20,
                      }}
                      type="number"
                      min="0"
                      value={values.arcVoltageMin}
                      name={`arcVoltageMin`}
                      placeholder="min"
                      autocomplete="off"
                    />
                    <Input
                      onChange={(e) => {
                        const re = /^[0-9]+([,.][0-9]*)?$/;
                        if (e.target.value === '' || re.test(e.target.value)) {
                          handleChange(e);
                        }
                      }}
                      style={{
                        width: 180,
                        height: 40,
                        paddingLeft: 20,
                      }}
                      type="number"
                      min="0"
                      value={values.arcVoltageMax}
                      name={`arcVoltageMax`}
                      placeholder="max"
                      autocomplete="off"
                    />
                  </div>

                  {/* {userRole === "Admin" || userRole === "Master"
                    ?<Upload ></Upload>
                    :null
                  } */}
                  <div className={styles.row}>
                    <Button
                      disabled={
                        values.name == "" || values.marking == "" || values.rfidTag == "" || values.factoryNumber == "" ||
                        values.nextAttestationDate == "" || values.commissioningDate == "" || values.weldingProcess == "" || values.idleVoltage == "" ||
                        values.loadPercentage == "" || values.manufacturerName == "" || values.height == "" || values.width == "" || values.lenght == "" ||
                        values.weldingCurrentMin == "" || values.weldingCurrentMax == "" || values.arcVoltageMin == "" || values.arcVoltageMax == ""
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
                    <Select
                      name="valueReason"
                      value={valueReason}
                      width="380px"
                      placeholder="Причина простоя"
                      onChange={(event) => {
                        setValueReaso(event.value)
                      }}
                      options={reasonOptions}
                    />
                  </div>
                  <div className={styles.row}>
                    <Select
                      name="valuetEquipment"
                      width="380px"
                      value={valuetEquipment}
                      placeholder="Оборудование"
                      onChange={(event) => setValuetEquipment(event.value)}
                      options={optequipment}
                    />
                  </div>

                  <div className={styles.row}> 
                    <Input
                      onChange={(e) => {
                        setData(e.target.value);
                      }}
                      style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
                      value={valueData}
                      name="Date"
                      placeholder="Дата"
                      type="text"
                      onFocus={(e) => {
                        e.currentTarget.type = "date";
                      }}
                      onBlur={handleBlur}
                    />
                  </div>

                  <div className={styles.row}>
                    <Input
                      onChange={(e) => {
                        handleChange(e);
                      }}
                      style={{ width: 380, height: 40, padding: "0 20px 0 30px" }}
                      value={values.timeStates}
                      name="timeStates"
                      placeholder="Время изменения состояния"
                      onBlur={handleBlur}
                    />

                    <Input
                      onChange={(e) => {
                        setTime(e.target.value);
                      }}
                      style={{ width: 380, height: 40, padding: "0 20px 0 30px" }}
                      value={valueTime}
                      name="valueTime"
                      placeholder="Время"
                      onBlur={handleBlur}
                    />
                  </div>




                  <div className={styles.row}>
                    <Button
                      type="submit"
                      disabled={
                        values.number == ""
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

      {/*Удаление оборудования*/}
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
            deleteEquipment(weldingEquipmentId)
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
                <h4 style={{ padding: "35px 40px" }}>Вы уверены что хотите <span>удалить</span> оборудование ? </h4>

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
  );
};
