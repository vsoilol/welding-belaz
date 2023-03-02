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



import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";


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
  loadWorkshop
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


  const [valueMaster, setvalueMaster] = useState("");
  const [valueWelder, setvalueWelder] = useState("");



  const initialValues = {
    rfidTag: modalData?.rfidTag ?? "",
    name: modalData?.name ?? "",
    marking: modalData?.marking ?? "",
    factoryNumber: modalData?.factoryNumber ?? "",
    commissioningDate: modalData?.commissioningDate ?? "",
    height: modalData?.height ?? "",
    width: modalData?.width ?? "",
    lenght: modalData?.lenght ?? "",
    groupNumber: modalData?.groupNumber ?? "",
    manufacturerName: modalData?.manufacturerName ?? "",

    nextAttestationDate: modalData?.nextAttestationDate ?? "",
    commissioningDate: modalData?.commissioningDate ?? "",


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

  const formattedMasters = masters?.map((item) => {
    return {
      value: item.masterId,
      label: `${item.surname} ${item.name}`,
    };
  });

  useEffect(() => {
    loadEquipment();
    loadMasters();
    loadPosts();
    loadDowntime();
    loadWorkshop();
    loadWelder();
  }, [loadEquipment, loadMasters, loadPosts, loadDowntime,loadWorkshop,loadWelder]);


  const columns = [
    { title: "Наименование", field: "name" },
    { title: "Маркировка", field: "marking" },
    { 
      title: "RFID метка", 
      render: (rowData) => {
        return <p>{rowData?.rfidTag ??rowData?.idFromSystem}</p>;
      }, 
  
    },
    { title: "Заводской  (инвентарный) номер", field: "factoryNumber" },
    { title: "Дата ввода в эксплуатацию", field: "commissioningDate" },
    { title: "Номер группы оборудования", field: "groupNumber" },
    { title: "Наименование изготовителя", field: "manufacturerName" },
    { title: "Дата очередной аттестации", field: "nextAttestationDate" },

    { 
      title: "Наименование цеха", 
      render: (rowData) => {
        return <span>-</span>
      },
    },
    { 
      title: "Номер цеха", 
      render: (rowData) => {
        return <span>-</span>
      },
    },
    { 
      title: "Наименование производственного участка", 
      render: (rowData) => {
        return <span>{SetArea(rowData.post, "name")??"-"}</span>
      },
    },
    { 
      title: "Номер производственного участка", 
      render: (rowData) => {
        return <span>{SetArea(rowData.post, "name")??"-"}</span>
      },
    },  
    {
      title: "Наименование   поста ",
      render: (rowData) => {
        return <span>{DetArea(rowData.post, "name")??"-"}</span>
      },
    },
    {
      title: "Номер поста",
      render: (rowData) => {
        return <span>{DetArea(rowData.post, "numb")??"-"}</span>
      },
    },
    {
      title:"Просмотреть календарь",
      render: (rowData) => {
        return <img onClick={e=>OpenCalendar(rowData)} className={styles.imgcalendar} src={imgcalendar}></img>;
      },
    }
  ];

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


  function SetArea(params, field) { 
    if (field === "name") { 
      for (let index = 0; index < posts?.length; index++) {
        if (posts[index]?.id === params) {
          return posts[index].productionArea.name
        }
      }
    }
    if (field === "numb") { 
      for (let index = 0; index < posts?.length; index++) {
        if (posts[index]?.id === params) {
          return posts[index].productionArea.name
        }
      }
    }
     

  }
  const requiredKeys = ["name", "nextInspectionDate"];

  const handleOpen = () => {
    setOpen(true);
  };

  function OpenCalendar(rowData){
    window.localStorage.removeItem("executorId")  
    window.localStorage.setItem("equipment",`Оборудование: ${rowData.name}  `)  
    window.localStorage.setItem("equipmentId",rowData.id)   
    setTimeout(() => {
      window.location.href="/calendar"
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
                  {rowData?.activationDuration ?? "-"}
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
  const optPosts = posts?.map((item) => {
    return {
      value: item.id,
      label: `Пост ${item.number}`,
    };
  });
  const reasonOptions = reason?.map((item) => {
    return {
      value: item.id,
      label: item.reason,
    };
  });
  const optequipment = equipment[0]?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });
  function SendData(variables) {
    variables["id"] = isEquipmentNumb
    variables["postId"] = valuetPosts
    variables["postNumber"] = valuetPostsNumber
    variables["commissioningDate"] = variables.commissioningDate
    variables["nextAttestationDate"] = new Date(variables.nextAttestationDate).toLocaleDateString()
    //Добавить Оборудование 
    if (isModalNumb == 0) {
      addEquipment(variables)
    }
    //Редактировать Оборудование
    if (isModalNumb == 1) {
      editEquipment(variables)
    }

    variables["downtimeReasonId"] = valueReason
    variables["weldingEquipmentId"] = valuetEquipment
    variables["Date"] = new Date(variables.Date).toLocaleDateString()
    variables["idDownti"] = valueDownti

    //Добавить простоя 
    if (isModalNumb == 2) {
      addDowntime(variables)
    }
    //Редактировать простоя
    if (isModalNumb == 3) {
      editDowntime(variables)
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
  
  ////////////////////////////////////////////////////////////////////
  return (

    <div className={styles.innerWrapper}>
      <ToolTip
        title="Оборудование"
        toolTipText="Здесь Вы можете просмотреть оборудование, его технические характеристики, отчет о работе"
        src={equipmentImage}
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
              userRole === "Admin"
                ? [
                  {
                    icon: "add",
                    tooltip: "Добавить оборудование",
                    isFreeAction: true,
                    onClick: () => { setIsModalNumb(0); setIsModalOpen(true) },
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать оборудование",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                      setIsModalNumb(1);  
                      setEquipmentNumb(rowData.id)
                      setValuetPosts(rowData.post?.id)
                    },
                  },
                ]
                : []
            }
            renderRowChildren={renderRowChildren}
            deleteAction={userRole === "admin" ? deleteEquipment : null}
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
              userRole === "Admin"
                ? [
                  {
                    icon: "add",
                    tooltip: "Добавить Простои",
                    isFreeAction: true,
                    onClick: () => { setIsModalOpen(true); setIsModalNumb(2) },
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать Простои",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                      setIsModalNumb(3);  
 
                      setValueDownti(rowData.id)
                      setValuetEquipment(rowData.weldingEquipment.id)
                      findReason(rowData.downtimeReason)
                    },
                  },
                ]
                : []
            }
            deleteAction={userRole === "admin" ? deleteEquipment : null}
          />
        </TabPanel>

      </div>
      <ResultsModal
        type={"EQUIPMENT"}
        activeId={activeEquipment}
        isOpen={isResultsModalOpen}
        setIsOpen={setIsResultsModalOpen}
      />
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
                  <div className={styles.row}>
                    <Select
                      name="postId"
                      value={valuetPosts}
                      width="380px"
                      placeholder="Номер поста"
                      onChange={(event) => {
                        setValuetPosts(event.value); setValuetPostsNumber(event.label)
                      }}
                      options={optPosts}
                    />


                  </div>
             
                  <div className={styles.row}>

                    <div> 
                       <Select
                        name="valueMaster"
                        value={valueMaster}
                        width="180px"
                        placeholder="Мастер"
                        onChange={(event) => {
                          setvalueMaster(event.value)
                        }}
                        options={optionMasters}
                      /> 
                    </div>
                    <div> 
                       <Select
                        name="valueWelder"
                        value={valueWelder}
                        width="180px"
                        placeholder="Сварщик"
                        onChange={(event) => {
                            setvalueWelder(event.value)
                        }}
                        options={optionWelder}
                      /> 
                    </div>
                    

                  </div>
                  <div className={styles.row}>
                    <Input
                      onChange={(e) => {
                        handleChange(e);
                      }}
                      width="200"
                      style={{ height: 40, padding: "0 20px 0 30px" }}
                      value={values.name}
                      name="name"
                      placeholder="Наименовние"
                      onBlur={handleBlur}
                    />

                    <Input
                      onChange={(e) => {
                        handleChange(e);
                      }}
                      width="200"
                      style={{ height: 40, padding: "0 20px 0 30px" }}
                      value={values.marking}
                      name="marking"
                      placeholder="Маркировка"
                      onBlur={handleBlur}
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
                      }}
                      value={values.rfidTag}
                      name={`rfidTag`}
                      placeholder="RFID метка"
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
                      value={values.factoryNumber}
                      name={`factoryNumber`}
                      placeholder="Заводской  (инвентарный) номер"
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
                      value={values.weldingProcess}
                      name={`weldingProcess`}
                      placeholder="Процесс сварки"
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
                      value={values.idleVoltage}
                      name={`idleVoltage`}
                      placeholder="Напряжение холостого хода"
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
                      value={values.height}
                      name={`height`}
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
                      value={values.width}
                      name={`width`}
                      placeholder="Ширина"
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
                      value={values.lenght}
                      name={`lenght`}
                      placeholder="Длина"
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
                      value={values.groupNumber}
                      name={`groupNumber`}
                      placeholder="Номер группы оборудования"
                    />


                  </div>


                  <p className={styles.text}>Диапазон сварочного тока:</p>
                  <div className={styles.row}>
                    <Input
                      onChange={(e) => {
                        handleChange(e);
                      }}
                      style={{
                        width: 180,
                        height: 40,
                        paddingLeft: 20,
                      }}
                      value={values.weldingCurrentMin}
                      name={`weldingCurrentMin`}
                      placeholder="min"
                      onBlur={handleBlur}
                    />
                    <Input
                      onChange={(e) => {
                        handleChange(e);
                      }}
                      style={{
                        width: 180,
                        height: 40,
                        paddingLeft: 20,
                      }}
                      value={values.weldingCurrentMax}
                      name={`weldingCurrentMax`}
                      placeholder="max"

                    />
                  </div>
                  <p className={styles.text}>Диапазон напряжения на дуге:</p>
                  <div className={styles.row}>
                    <Input
                      onChange={(e) => {
                        handleChange(e);
                      }}
                      style={{
                        width: 180,
                        height: 40,
                        paddingLeft: 20,
                      }}
                      value={values.arcVoltageMin}
                      name={`arcVoltageMin`}
                      placeholder="min"
                    />
                    <Input
                      onChange={(e) => {
                        handleChange(e);
                      }}
                      style={{
                        width: 180,
                        height: 40,
                        paddingLeft: 20,
                      }}
                      value={values.arcVoltageMax}
                      name={`arcVoltageMax`}
                      placeholder="max"
                    />
                  </div>


                  <div className={styles.row}>
                    <Button
                      disabled={
                        values.name == "" || valuetPosts == undefined || values.marking == "" || values.rfidTag == "" || values.factoryNumber == "" ||
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
                        handleChange(e);
                      }}
                      style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
                      value={values.Date}
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
                        handleChange(e);
                      }}
                      style={{ width: 380, height: 40, padding: "0 20px 0 30px" }}
                      value={values.time}
                      name="time"
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


    </div>
  );
};
