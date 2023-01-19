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
  loadMasters,
  loadTexprocwelding,
  loadInstructions,
  loadSeam,
  addInst,
  editInst,


  equipment, 
  deleteEquipment, 
  isRequesting,
  masters,
  userRole,


  texprocwelding,
  instructions,

  seam,



}) => {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [isModalOpenNumb, setIsModalOpenNumb] = useState(0);

  const [modalData, setModalData] = useState(null);
  const [isResultsModalOpen, setIsResultsModalOpen] = useState(false);
  const [activeEquipment, setActiveEquipment] = useState("");
  const [open, setOpen] = useState(false);

  const [valuetSeam, setValuetSeam] = useState(0); 
  const [valuetVkladka, setValuetVkladka] = useState(0); 

  const initialValues = {

    id:modalData?.weldPassages.id??"",
    name: modalData?.name ?? "",
    number: modalData?.number ?? "",
    weldPassagesName: modalData?.weldPassages[0].name ?? "",
    weldingCurrentMin:modalData?.weldPassages[0].weldingCurrentMin ?? "",
    weldingCurrentMax:modalData?.weldPassages[0].weldingCurrentMax ?? "",
    arcVoltageMin:modalData?.weldPassages[0].arcVoltageMin ?? "",
    arcVoltageMax:modalData?.weldPassages[0].arcVoltageMax ?? "",
    preheatingTemperatureMin:modalData?.weldPassages[0].preheatingTemperatureMin ?? "",
    preheatingTemperatureMax:modalData?.weldPassages[0].preheatingTemperatureMax ?? "",
    weldPassagesId:modalData?.weldPassages[0].id ?? "",
  }; 

  const formattedMasters = masters?.map((item) => {
    return {
      value: item.masterId,
      label: `${item.surname} ${item.name}`,
    };
  });

  useEffect(() => {
    loadTexprocwelding();
    loadInstructions();
    loadSeam();
  }, [
    loadMasters,
    loadTexprocwelding,
    loadInstructions,
    loadSeam
  ]);




  ////////////////////////////////////////////////////////////////////
  const columns = [
    {
      title: "Наименование", field: "name",
    },
    {
      title: "Номер технологического процесса", field: "number",
    },
    {
      title: "Ссылка на PDF-файл ", field: "pdmSystemFileLink",
    },
    {
      title: "Изделие", field: "technologicalInstructions[0].seam.product.name",
    },
    {
      title: "Сборочные узлы",
      render: (rowData) => (
        <span>Сборочный узел {rowData.technologicalInstructions[0].seam.product.number}</span>
      ),
    },
    {
      title: "Детали", field: "technologicalInstructions[0].seam.product.name",
    },
    {
      title: "Швы", field: "technologicalInstructions[0].seam.product.productType",
    },
    {
      title: "Диапазоны допустимых значений контролируемых параметров (сварочный ток, напряжение на дуге)",
      render: (rowData) => (
        <span>{rowData.technologicalInstructions[0].weldPassages[0].arcVoltageMin} - {rowData.technologicalInstructions[0].weldPassages[0].arcVoltageMax}</span>
      ),
    },
    {
      title: "Размеры шва", field: "technologicalInstructions[0].seam.product.productType",
    },
    {
      title: "Количество проходов", field: "technologicalInstructions[0].seam.product.productType",
    },
  ]
  const colinstructions = [
    {
      title: "Наименование", field: "name",
    },
    {
      title: "Номер технологического процесса", field: "number",
    },
    {
      title: "Шов",
      render: (rowData) => {
        return (
          <p>
            Cварочный шов {rowData.seam.number}
          </p>
        );
      }
    },
    {
      title: "Наименование прохода", 
      field: "weldPassages[0].name",   
    },
    {
      title: "Время сварки ",
      render: (rowData) => {
        return (
          <p>
            {`${rowData.weldPassages[0].weldingCurrentMin} - ${rowData.weldPassages[0].weldingCurrentMax}`}
          </p>
        );
      },
    },
    {
      title: "Напряжение дуги  ",
      render: (rowData) => {
        return (
          <p>
            {`${rowData.weldPassages[0].arcVoltageMin} - ${rowData.weldPassages[0].arcVoltageMax}`}
          </p>
        );
      },
    },
    {
      title: "Температура предварительного нагрева ",
      render: (rowData) => {
        return (
          <p>
            {`${rowData.weldPassages[0].preheatingTemperatureMin} - ${rowData.weldPassages[0].preheatingTemperatureMax}`}
          </p>
        );
      },
    }
  ]
 
  //select Сварочный шов  
  const SeamOptions = seam?.map((item) => {
    return {
      value: item.id,
      label: `Cварочный шов ${item.number}`,
    };
  });


  const requiredKeys = ["name", "nextInspectionDate"];

  const handleOpen = () => {
    setOpen(true);
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
 
    //Запрос на редактирование или добавление
    function SendData(variables) { 
      variables["seamId"] = valuetSeam;
      variables["technologicalProcessId"] = texprocwelding[0].id;
      
      if (isModalOpenNumb===0) {  
         addInst(variables)  
      }
      if (isModalOpenNumb===1) {  
         variables["id"] = modalData.id;
         variables["weldPassagesId"]=modalData?.weldPassages[0].id
         editInst(variables) 
      }    
    }
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

      <Tabs
        value={value_panel}
        onChange={ChangePanels}
        indicatorColor="primary"
        textColor="primary"
      >
        <Tab label="Технологические процессы" />
        <Tab label="Технологические инструкции" />
      </Tabs>

      <div className={styles.tableWrapper}>




        {/*Технологические процессы сборки и сварки */}
        <TabPanel
          value={value_panel}
          indPanel={0}
          style={{ minWidth: "800px", }}
          className="TableTech"
        >
          <Table
            title="Технологические процессы сборки и сварки"
            columns={columns}
            value={0}
            data={texprocwelding} 
            isLoading={isRequesting}
            actions={
              userRole === "admin"
                ? [
                  {
                    icon: "add",
                    tooltip: "Добавить ",
                    isFreeAction: true,
                    onClick: () => {
                      setIsModalOpen(true);
                      
                    },
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

        {/*Технологические инструкции*/}
        <TabPanel
          value={value_panel}
          indPanel={1}
          style={{ minWidth: "800px", }}
          className="TableTech"
        >
          <Table
            title="Технологические инструкции"
            columns={colinstructions}
            value={0}
            data={instructions} 
            isLoading={isRequesting}
            actions={
              userRole === "Admin"
                ? [
                  {
                    icon: "add",
                    tooltip: "Добавить ",
                    isFreeAction: true,
                    onClick: () => {
                      setIsModalOpen(true);
                      setIsModalOpenNumb(0);
                      setValuetVkladka(1)
                    },
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать ",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                      setIsModalOpenNumb(1) 
                      setValuetSeam(rowData.seam.id)
                      setValuetVkladka(1)
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
            SendData(variables,id) 
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
                  placeholder="Номер технологического процесса"
                  onBlur={handleBlur}
                />
              </div>
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
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{ width: 380, height: 40, padding: "0 20px 0 30px" }}
                  value={values.weldPassagesName}
                  name="weldPassagesName"
                  placeholder="Наименование прохода"
                  onBlur={handleBlur}
                />
              </div>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  width="200"
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.weldingCurrentMin}
                  name="weldingCurrentMin"
                  placeholder="Время сварки min"
                  onBlur={handleBlur}
                />

                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  width="200"
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.weldingCurrentMax}
                  name="weldingCurrentMax"
                  placeholder="Время сварки max"
                  onBlur={handleBlur}
                />
              </div>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  width="200"
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.arcVoltageMin}
                  name="arcVoltageMin"
                  placeholder="Напряжение дуги min"
                  onBlur={handleBlur}
                />

                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  width="200"
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.arcVoltageMax}
                  name="arcVoltageMax"
                  placeholder="Напряжение дуги max"
                  onBlur={handleBlur}
                />
              </div>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  width="200"
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.preheatingTemperatureMin}
                  name="preheatingTemperatureMin"
                  placeholder="Температура предварительного нагрева min"
                  onBlur={handleBlur}
                />

                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  width="200"
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.preheatingTemperatureMax}
                  name="preheatingTemperatureMax"
                  placeholder="Температура предварительного нагрева max"
                  onBlur={handleBlur}
                />
              </div>
              {!modalData && (
                <div className={styles.row}>

                </div>
              )}
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
