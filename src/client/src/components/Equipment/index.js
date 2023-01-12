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

  posts
}) => {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [modalData, setModalData] = useState(null);
  const [isResultsModalOpen, setIsResultsModalOpen] = useState(false);
  const [activeEquipment, setActiveEquipment] = useState("");
  const [open, setOpen] = useState(false);
  const [valuetPosts, setValuetPosts] = useState("id"); 
  const [isModalNumb, setIsModalNumb] = useState(0);

  const [isEquipmentNumb, setEquipmentNumb] = useState(0);


  const initialValues = {
     rfidTag: modalData?.rfidTag?? "", 
     name: modalData?.name?? "", 
     marking:  modalData?.marking?? "", 
     factoryNumber: modalData?.factoryNumber?? "", 
     commissioningDate:  modalData?.commissioningDate?? "", 
     height:  modalData?.height?? "", 
     width:  modalData?.width?? "", 
     lenght:  modalData?.lenght?? "", 
     groupNumber:  modalData?.groupNumber?? "", 
     manufacturerName:  modalData?.manufacturerName?? "", 
     nextAttestationDate:  modalData?.nextAttestationDate?? "", 
     weldingProcess:  modalData?.weldingProcess?? "", 
     idleVoltage: modalData?.idleVoltage?? "", 
     weldingCurrentMin:  modalData?.weldingCurrentMin?? "", 
     weldingCurrentMax:  modalData?.weldingCurrentMax?? "", 
     arcVoltageMin:  modalData?.arcVoltageMin?? "", 
     arcVoltageMax:  modalData?.arcVoltageMax?? "", 
     postId:  valuetPosts?? "", 
 

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
  }, [loadEquipment, loadMasters,loadPosts]);

  // {
  //   title: "Ф.И.О ответственного",
  //   render: (rowData) => {
  //     return (
  //       <p>{`
  //       ${rowData.responsiblePerson.middleName} 
  //       ${rowData.responsiblePerson.firstName} 
  //       ${rowData.responsiblePerson.lastName}
  //         `}
  //       </p>
  //     );
  //   },

  // },

  const columns = [
    { title: "Наименование", field: "name" },
    { title: "Маркировка", field: "marking" },
    { title: "RFID метка", field: "rfidTag" },
    { title: "Заводской  (инвентарный) номер", field: "factoryNumber" },
    { title: "Дата ввода в эксплуатацию", field: "commissioningDate" },
    { title: "Габариты", field: "width" },
    { title: "Номер группы оборудования", field: "groupNumber" },
    { title: "Наименование изготовителя", field: "manufacturerName" },
    { title: "Дата очередной аттестации", field: "nextAttestationDate" },
    
    { title: "Процесс (способ) сварки", field: "weldingProcess" },
    { title: "Напряжение холостого хода", field: "idleVoltage" },
    {
      title: "Допустимые диапазоны сварочного тока и напряжения на дуге (min и max)",
      render: (rowData) => {
        return (
          <p>
            {`${rowData.arcVoltageMin} -  ${rowData.arcVoltageMax}`}
          </p>
        );
      },
    },
    { title: "Продолжительность включения (нагрузки)", field: "activationDuration" },
    { title: "Номер поста", field: "post.number" },
    {
      field: "link",
      title: "Отчет",
      render: (rowData) => (
        <div
          onClick={() => {
            setIsResultsModalOpen(true);
            setActiveEquipment(rowData?.machineId);
          }}
        >
          <SaveIcon />
        </div>
      ),
      width: 54,
    },
  ];

  const columns2 = [
    {
      title: "Время изменения состояния",
      field: "changeConditionTime"
    },
    {
      title: "Текущее состояние",
      field: "weldingEquipment.currentCondition"
    },
    {
      title: "Причина простоя",
      field: "downtimeReason"
    },
  ]

  const requiredKeys = ["name", "nextInspectionDate"];

  const handleOpen = () => {
    setOpen(true);
  };



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
                  Способ сварки
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
              </TableRow>
              <TableRow>
                <TableCell />
                <TableCell />
                <TableCell />
                <TableCell align="center">min</TableCell>
                <TableCell align="center">max</TableCell>
                <TableCell align="center">min</TableCell>
                <TableCell align="center">max</TableCell>
                <TableCell />
              </TableRow>
            </TableHead>
            <TableBody>
              <TableRow>
                <TableCell align="center" component="th" scope="row">
                  {rowData?.weldingProcess ?? "-"}
                </TableCell>
                <TableCell align="center" component="th" scope="row">
                  {rowData?.weldingMethod ?? "-"}
                </TableCell>
                <TableCell align="center" component="th" scope="row">
                  {rowData?.noLoadVoltage ?? "-"}
                </TableCell>
                <TableCell align="center">
                  {rowData?.minCurrentValue ?? "-"}
                </TableCell>
                <TableCell align="center">
                  {rowData?.maxCurrentValue ?? "-"}
                </TableCell>
                <TableCell align="center">
                  {rowData?.minVoltageValue ?? "-"}
                </TableCell>
                <TableCell align="center">
                  {rowData?.maxVoltageValue ?? "-"}
                </TableCell>
                <TableCell align="center" component="th" scope="row">
                  {rowData?.loadPercentage ?? "-"}
                </TableCell>
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
  function SendData(variables) {  
    variables["id"]=isEquipmentNumb 
    variables["postId"]=valuetPosts 
    //Добавить Оборудование 
    if (isModalNumb == 0) {
      addEquipment(variables)
    }
    //Редактировать Оборудование
    if (isModalNumb == 1) {
      editEquipment(variables)
    }
 
  }
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
                    onClick: () => { setIsModalNumb(0);setIsModalOpen(true)},
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать оборудование",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                      setIsModalNumb(1);
                      setEquipmentNumb(rowData.id)

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
              userRole === "admin"
                ? [
                  {
                    icon: "add",
                    tooltip: "Добавить оборудование",
                    isFreeAction: true,
                    onClick: () => setIsModalOpen(true),
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать оборудование",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
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
          modalData ? "Редактировать оборудование" : "Добавить оборудование"
        }
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
                  onChange={(event) => setValuetPosts(event.value)}
                  options={optPosts}
                />
                
                
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
                 
                <Input
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
                />
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
  );
};
