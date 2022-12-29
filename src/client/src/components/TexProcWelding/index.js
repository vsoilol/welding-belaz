import Paper from "@material-ui/core/Paper";
import MaterialTable from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import SaveIcon from "@material-ui/icons/Save";
import { TechProcWeldImage } from "assets/pics";
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

export const TexProcWelding = ({
  loadEquipment,
  loadMasters,
  equipment,
  addEquipment,
  deleteEquipment,
  editEquipment,
  isRequesting,
  masters,
  userRole,
}) => {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [modalData, setModalData] = useState(null);
  const [isResultsModalOpen, setIsResultsModalOpen] = useState(false);
  const [activeEquipment, setActiveEquipment] = useState("");
  const [open, setOpen] = useState(false);

  const initialValues = {
    machineId: modalData?.machineId ?? "",
    name: modalData?.name ?? "",
    serialNum: modalData?.serialNum ?? "",
    photoName: modalData?.photoName ?? "",
    nextInspectionDate: modalData?.nextInspectionDate ?? "",
    weldingProcess: modalData?.weldingProcess ?? "",
    weldingMethod: modalData?.weldingMethod ?? "",
    noLoadVoltage: modalData?.noLoadVoltage ?? "",
    minCurrentValue: modalData?.minCurrentValue ?? "",
    maxCurrentValue: modalData?.maxCurrentValue ?? "",
    minVoltageValue: modalData?.minVoltageValue ?? "",
    maxVoltageValue: modalData?.maxVoltageValue ?? "",
    loadPercentage: modalData?.loadPercentage ?? "",
    masterId: modalData?.master?.masterId ?? "",
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
  }, [loadEquipment, loadMasters]);

 




   ////////////////////////////////////////////////////////////////////
    const columns = [
      {
        title: "Наименование", 
        render: (rowData) => (
          <span>{rowData.name}</span>
        ),
      },
      {
        title: "Номер технологического процесса", 
        render: (rowData) => (
          <span>{rowData.numb}</span>
        ),
      },
      {
        title: "Ссылка на PDF-файл ", 
        render: (rowData) => (
          <span>{rowData.ref}</span>
        ),
      },
      {
        title: "Изделие", 
        render: (rowData) => (
          <span>{rowData.goods}</span>
        ),
      },
      {
        title: "Сборочные узлы", 
        render: (rowData) => (
          <span>{rowData.node}</span>
        ),
      },
      {
        title: "Детали", 
        render: (rowData) => (
          <span>{rowData.details}</span>
        ),
      },
      {
        title: "Швы", 
        render: (rowData) => (
          <span>{rowData.seam}</span>
        ),
      },
      {
        title: "Диапазоны допустимых значений контролируемых параметров (сварочный ток, напряжение на дуге)", 
        render: (rowData) => (
          <span>{rowData.diapazone}</span>
        ),
      },
      {
        title: "Размеры шва", 
        render: (rowData) => (
          <span>{rowData.size}</span>
        ),
      },
      {
        title: "Количество проходов", 
        render: (rowData) => (
          <span>{rowData.count}</span>
        ),
      },
    ]
  

    const columns_data= [
       
    ]

    for (let index = 0; index < 17; index++) {
        
      columns_data.push(
        {
          name:`Процесс сборки ${index+1}`,
          numb:` 34${index}-38-01${index}-86`,
          ref:`http://localhost:3000/tex-proc-welding/34${index}-38-01${index}-86`,
          goods:`Изделие${index+1}`,
          node:`Узел ${index+1}`,
          details:`Деталь ${index+1}`,
          seam:`Шов ${index+1}`,
          diapazone:`7${index+1} - 8${index+2}`,
          size:`12${index+3}`,
          count:`${index+2}`
        }
      )
      
  }
  

    const requiredKeys = ["name", "nextInspectionDate"];

    const handleOpen = () => {
      setOpen(true);
    };
 
  
  
    const [value_panel, setValue] = useState(0);
    const ChangePanels = (event, newValue) => { 
      setValue(newValue); 
    }; 
    const TabPanel = (props_panel) => { 
      const { children, value, indPanel} = props_panel; 
      return (
        <div  hidden={value !== indPanel}  >
          {children}
        </div>
      );
    };

  ////////////////////////////////////////////////////////////////////
  return (

    <div className={styles.innerWrapper}>



      <ToolTip
        title="Технологические процессы сборки и сварки"
        toolTipText="Здесь Вы можете просмотреть технологические процессы сборки и сварки"
        src={TechProcWeldImage} 
      />
      {open ? (
        <Modal
          open={open}
          setOpen={setOpen}
          children={<EquipmentMap equipment={equipment} />}
        />
      ) : null} 
  


      <div className={styles.tableWrapper}>
        
        {/*Технологические процессы сборки и сварки */}
        <TabPanel 
          value={value_panel}
          indPanel={0}
          style={{  minWidth: "800px", }}
          className="TableTech"
        >
            <Table 
                title="Технологические процессы сборки и сварки"
                columns={columns}
                value={0}
                data={columns_data}
                isLoading={isRequesting}
                actions={
                  userRole === "admin"
                    ? [
                      {
                        icon: "add",
                        tooltip: "Добавить ",
                        isFreeAction: true,
                        onClick: () => setIsModalOpen(true),
                      },
                      {
                        icon: "edit",
                        tooltip: "Редактировать ",
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
          modalData ? "Редактировать " : "Добавить "
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
            modalData
              ? editEquipment({ ...variables })
              : addEquipment({ ...dataToSend });
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
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }} 
                  style={{width:380, height: 40, padding: "0 20px 0 30px" }}
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
                  style={{ width:380, height: 40, padding: "0 20px 0 30px" }}
                  value={values.serialNum}
                  name="serialNum"
                  placeholder="Номер ( цеха, участка, поста, рабочего места) "
                  onBlur={handleBlur}
                />
              </div> 
              <div className={styles.row}>
                <Select
                  name="masterId"
                  value={values.masterId}
                  width="380px"
                  placeholder="Мастер"
                  onChange={(e) => {
                    setFieldValue("masterId", e.value);
                  }}
                  options={formattedMasters}
                />
              </div> 
              {!modalData && (
                <div className={styles.row}>
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{
                      width: 380,
                      height: 40,
                    }}
                    value={values.machineId}
                    name={`machineId`}
                    placeholder="RFID метка"
                  />
                </div>
              )}
              <div className={styles.row}>
                <Button
                  disabled={requiredKeys.some((key) => !values[key])}
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
