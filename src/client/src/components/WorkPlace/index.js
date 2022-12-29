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
 

  

import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";
import api from "services/api";


const dateOptions = {
  day: "numeric",
  month: "short",
  year: "numeric",
};

export const WorkPlace = ({
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
    const columns = {
        workshops:[
          {
            title: "Наименование цеха",
            field: "id",
            render: (rowData) => (
              <span>{rowData.name_workshops}</span>
            ),
          },
          {
            title: "Номер  цеха",
            field: "id",
            render: (rowData) => (
              <span>{rowData.numb_workshops}</span>
            ),
          },
        ],
        production_sites:[
          {
            title: "Наименование производственного участка ",
            field: "id",
            render: (rowData) => (
              <span>{rowData.name_production_sites}</span>
            ),
          },
          {
            title: "Номер  производственного участка ",
            field: "id",
            render: (rowData) => (
              <span>{rowData.numb_production_sites}</span>
            ),
          },
        ],
        posts:[
          {
            title: "Наименование поста ",
            field: "id",
            render: (rowData) => (
              <span>{rowData.name_posts}</span>
            ),
          },
          {
            title: "Номер  поста ",
            field: "id",
            render: (rowData) => (
              <span>{rowData.numb_posts}</span>
            ),
          },
        ],
        jobs_place:[
          {
            title: "Наименование рабочего места ",
            field: "id",
            render: (rowData) => (
              <span>{rowData.name_jobs_place}</span>
            ),
          },
          {
            title: "Номер  рабочего места ",
            field: "id",
            render: (rowData) => (
              <span>{rowData.numb_jobs_place}</span>
            ),
          },
        ],

        goods:[
          {
            title: "Наименование изделия ", 
            render: (rowData) => (
              <span>{rowData.name_goods}</span>
            ),
          },
          {
            title: "Номер  изделия ", 
            render: (rowData) => (
              <span>{rowData.numb_goods}</span>
            ),
          },



          {
            title: "Номер  цеха ", 
            render: (rowData) => (
              <span>{rowData.numb_workshops}</span>
            ),
          },
          {
            title: "Номер  производственного участка ", 
            render: (rowData) => (
              <span>{rowData.numb_production_sites}</span>
            ),
          },
          {
            title: "Номер  рабочего места  ", 
            render: (rowData) => (
              <span>{rowData.numb_jobs_place}</span>
            ),
          },
          {
            title: "Наименование   технологического процесса  ", 
            render: (rowData) => (
              <span>{rowData.name_technological_process}</span>
            ),
          },
          {
            title: "Номер  технологического процесса  ", 
            render: (rowData) => (
              <span>{rowData.numb_technological_process}</span>
            ),
          },
        ],
        node:[
          {
            title: "Наименование узла ", 
            render: (rowData) => (
              <span>{rowData.name_node}</span>
            ),
          },
          {
            title: "Номер  узла ", 
            render: (rowData) => (
              <span>{rowData.numb_node}</span>
            ),
          },

          {
            title: "Номер  цеха ",  
            render: (rowData) => (
              <span>{rowData.numb_workshops}</span>
            ),
          },
          {
            title: "Номер  производственного участка ", 
            render: (rowData) => (
              <span>{rowData.numb_production_sites}</span>
            ),
          },
          {
            title: "Номер  рабочего места  ", 
            render: (rowData) => (
              <span>{rowData.numb_jobs_place}</span>
            ),
          },
          {
            title: "Наименование   технологического процесса  ", 
            render: (rowData) => (
              <span>{rowData.name_technological_process}</span>
            ),
          },
          {
            title: "Номер  технологического процесса  ", 
            render: (rowData) => (
              <span>{rowData.numb_technological_process}</span>
            ),
          },
        ],
        details:[
          {
            title: "Наименование детали ", 
            render: (rowData) => (
              <span>{rowData.name_details}</span>
            ),
          },
          {
            title: "Номер  детали ", 
            render: (rowData) => (
              <span>{rowData.numb_details}</span>
            ),
          },


          {
            title: "Номер  цеха ", 
            render: (rowData) => (
              <span>{rowData.numb_workshops}</span>
            ),
          },
          {
            title: "Номер  производственного участка ", 
            render: (rowData) => (
              <span>{rowData.numb_production_sites}</span>
            ),
          },
          {
            title: "Номер  рабочего места  ", 
            render: (rowData) => (
              <span>{rowData.numb_jobs_place}</span>
            ),
          },
          {
            title: "Наименование   технологического процесса  ", 
            render: (rowData) => (
              <span>{rowData.name_technological_process}</span>
            ),
          },
          {
            title: "Номер  технологического процесса  ", 
            render: (rowData) => (
              <span>{rowData.numb_technological_process}</span>
            ),
          },
        ],
        welding_seam:[
          {
            title: "Наименование сварного шва ", 
            render: (rowData) => (
              <span>{rowData.name_welding_seam}</span>
            ),
          },
          {
            title: "Номер  сварного шва ", 
            render: (rowData) => (
              <span>{rowData.numb_welding_seam}</span>
            ),
          },



          {
            title: "Номер  цеха ", 
            render: (rowData) => (
              <span>{rowData.numb_workshops}</span>
            ),
          },
          {
            title: "Номер  производственного участка ", 
            render: (rowData) => (
              <span>{rowData.numb_production_sites}</span>
            ),
          },
          {
            title: "Номер  рабочего места  ", 
            render: (rowData) => (
              <span>{rowData.numb_jobs_place}</span>
            ),
          },
          {
            title: "Наименование   технологического процесса  ", 
            render: (rowData) => (
              <span>{rowData.name_technological_process}</span>
            ),
          },
          {
            title: "Номер  технологического процесса  ", 
            render: (rowData) => (
              <span>{rowData.numb_technological_process}</span>
            ),
          },
        ]
    } 

    const columns_data={
      workshops:[
        // { 
        //   name_workshops:"Наименование цеха",
        //   numb_workshops:"Номер цеха", 
        // }
      ],
      production_sites:[
        // { 
        //   name_production_sites:"Наименование производственного участка",
        //   numb_production_sites:"Номер производственного участка", 
        // },  
      ],
      posts:[ 
        // { 
        //   name_posts:"Наименование поста",
        //   numb_posts:"Номер поста", 
        // }, 
      ],
      jobs_place:[
        // { 
        //   name_jobs_place:"Наименование рабочего места",
        //   numb_jobs_place:"Номер рабочего места", 
        // }, 
        
      ],

      goods:[
        // { 
        //   name_goods:"",
        //   numb_goods:"",
        //   numb_workshops:"",
        //   numb_production_sites:"",
        //   numb_jobs_place:"",
        //   name_technological_process:"",
        //   numb_technological_process:""
        // },
        
      ],
      node:[
        // {
        //   name_node:"",
        //   numb_node:"",
        //   numb_workshops:"",
        //   numb_production_sites:"",
        //   numb_jobs_place:"",
        //   name_technological_process:"",
        //   numb_technological_process:""
        // },
        
      ],
      details:[
        // {
        //   name_details:"",
        //   numb_details:"",
        //   numb_workshops:"",
        //   numb_production_sites:"",
        //   numb_jobs_place:"",
        //   name_technological_process:"",
        //   numb_technological_process:""
        // }, 
      ],
      welding_seam:[
        // {
        //   name_welding_seam:"",
        //   numb_welding_seam:"",
        //   numb_workshops:"",
        //   numb_production_sites:"",
        //   numb_jobs_place:"",
        //   name_technological_process:"",
        //   numb_technological_process:""
        // },
        
      ],
    }


    for (let index = 0; index < 17; index++) {
        
        columns_data.workshops.push( 
          { 
          name_workshops:`Цех ${index+1}`,
          numb_workshops:` 34${index}-38-01${index}-86`, 
        }
        ) 
        columns_data.production_sites.push(
          { 
            name_production_sites:`Производственного участка ${index+1}`,
            numb_production_sites:`${index+1}3:F${index+1}:AA:${index+1}8`, 
          },  
        ) 
        columns_data.posts.push(
          { 
            name_posts:`Пост ${index+1}`,
            numb_posts:`34${index}-38-01${index}-86`, 
          },  
        ) 
        columns_data.jobs_place.push(
          { 
            name_jobs_place:`Рабочее место ${index+1}`,
            numb_jobs_place:`${index+1}3:F${index+1}:AA:${index+1}8`, 
          },  
        )


        columns_data.goods.push( { 
            name_goods:`Изделие${index+1}`,
            numb_goods:`${index+1}`,
            numb_workshops:`34${index}-38-01${index}-86`,
            numb_production_sites: `${index+1}3:F${index+1}:AA:${index+1}8`,
            numb_jobs_place:`7${index}7-38-01${index}-86`,
            name_technological_process:`Технологический процесс  ${index} `,
            numb_technological_process:`${index}-3886`
          }
        ) 
        columns_data.node.push( { 
          name_node:`Узел ${index+1}`,
          numb_node:`${index+1}`,
          numb_workshops:`38:${index}45:01${index}-76`,
          numb_production_sites:`7${index}7-38-01${index}-86` ,
          numb_jobs_place:`${index+1}3:F${index+1}:AA:${index+1}8`,
          name_technological_process:`Технологический процесс  ${index+1} `,
          numb_technological_process:`3886:${index}`
        }
         )
        columns_data.details.push( { 
          name_details:`Деталь ${index+1}`,
          numb_details:`${index+1}`,
          numb_workshops:`34${index}-38-01${index}-86`,
          numb_production_sites: `${index+1}3:F${index+1}:AA:${index+1}8`,
          numb_jobs_place:`7${index}7-38-01${index}-86`,
          name_technological_process:`Технологический процесс  ${index} `,
          numb_technological_process:`${index}-3886`
        }
        )
        columns_data.welding_seam.push( { 
          name_welding_seam:`Шов ${index+1}`,
          numb_welding_seam:`${index+1}`,
          numb_workshops:`38:${index}45:01${index}-76`,
          numb_production_sites:`7${index}7-38-01${index}-86` ,
          numb_jobs_place:`${index+1}3:F${index+1}:AA:${index+1}8`,
          name_technological_process:`Технологический процесс  ${index+1} `,
          numb_technological_process:`3886:${index}`
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
        title="Производство"
        toolTipText="Здесь Вы можете просмотреть цеха, производственные участки, посты, рабочие места,изделия, узлы, детали, сварные швы, подлежащие проверке УКК"
        src={workPlaceImage} 
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
          <Tab   label="Цеха"  />
          <Tab   label="Производственные участки"  />
          <Tab   label="Посты"  />
          <Tab   label="Рабочие места"  />

          <Tab   label="Изделия"  />
          <Tab   label="Узлы"  />
          <Tab   label="Детали"  />
          <Tab   label="Сварные швы"  /> 
        </Tabs>


      <div className={styles.tableWrapper}>
        
        {/*Цеха*/}
        <TabPanel 
          value={value_panel}
          indPanel={0}
          style={{  minWidth: "800px", }}
        >
            <Table 
                title="Цеха"
                columns={columns.workshops}
                value={0}
                data={columns_data.workshops}
                isLoading={isRequesting}
                actions={
                  userRole === "admin"
                    ? [
                      {
                        icon: "add",
                        tooltip: "Добавить цех",
                        isFreeAction: true,
                        onClick: () => setIsModalOpen(true),
                      },
                      {
                        icon: "edit",
                        tooltip: "Редактировать цех",
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
        {/*Производственные участки*/}
        <TabPanel 
          value={value_panel}
          indPanel={1}
          style={{  minWidth: "800px", }}
        >
            <Table 
                title="Производственные участки"
                columns={columns.production_sites}
                value={1} 
                className="workshops"
                data={columns_data.production_sites}
                isLoading={isRequesting}  
                actions={
                  userRole === "admin"
                    ? [
                      {
                        icon: "add",
                        tooltip: "Добавить производственный участок",
                        isFreeAction: true,
                        onClick: () => setIsModalOpen(true),
                      },
                      {
                        icon: "edit",
                        tooltip: "Редактировать производственный участок",
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
        {/*Посты*/}
        <TabPanel 
          value={value_panel}
          indPanel={2}
          style={{  minWidth: "800px", }}
        >
            <Table 
                title="Посты"
                columns={columns.posts}
                value={2} 
                className="workshops"
                data={columns_data.posts}
                isLoading={isRequesting}  
                actions={
                  userRole === "admin"
                    ? [
                      {
                        icon: "add",
                        tooltip: "Добавить пост",
                        isFreeAction: true,
                        onClick: () => setIsModalOpen(true),
                      },
                      {
                        icon: "edit",
                        tooltip: "Редактировать пост",
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
        {/*Рабочие места */}
        <TabPanel 
          value={value_panel}
          indPanel={3}
          style={{  minWidth: "800px", }}
        >
            <Table 
                title="Рабочие места"
                columns={columns.jobs_place}
                value={3} 
                className="workshops"
                data={columns_data.jobs_place}
                isLoading={isRequesting}  
                actions={
                  userRole === "admin"
                    ? [
                      {
                        icon: "add",
                        tooltip: "Добавить рабочее место",
                        isFreeAction: true,
                        onClick: () => setIsModalOpen(true),
                      },
                      {
                        icon: "edit",
                        tooltip: "Редактировать рабочее место",
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

        {/*Изделия*/}
        <TabPanel 
          value={value_panel}
          indPanel={4}
          style={{  minWidth: "800px", }}
        >
            <Table 
                title="Изделия"
                columns={columns.goods}
                value={4}
                data={columns_data.goods}
                isLoading={isRequesting}
                actions={
                  userRole === "admin"
                    ? [
                      {
                        icon: "add",
                        tooltip: "Добавить изделие",
                        isFreeAction: true,
                        onClick: () => setIsModalOpen(true),
                      },
                      {
                        icon: "edit",
                        tooltip: "Редактировать изделие",
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
        {/*Узлы*/}
        <TabPanel 
          value={value_panel}
          indPanel={5}
          style={{  minWidth: "800px", }}
        >
            <Table 
                title="Узлы"
                columns={columns.node}
                value={5}
                data={columns_data.node}
                isLoading={isRequesting}
                actions={
                  userRole === "admin"
                    ? [
                      {
                        icon: "add",
                        tooltip: "Добавить узел",
                        isFreeAction: true,
                        onClick: () => setIsModalOpen(true),
                      },
                      {
                        icon: "edit",
                        tooltip: "Редактировать узел",
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
        {/*Детали*/}
        <TabPanel 
          value={value_panel}
          indPanel={6}
          style={{  minWidth: "800px", }}
        >
            <Table 
                title="Детали"
                columns={columns.details}
                value={6}
                data={columns_data.details}
                isLoading={isRequesting}
                actions={
                  userRole === "admin"
                    ? [
                      {
                        icon: "add",
                        tooltip: "Добавить деталь",
                        isFreeAction: true,
                        onClick: () => setIsModalOpen(true),
                      },
                      {
                        icon: "edit",
                        tooltip: "Редактировать деталь",
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
        {/*Сварные швы*/}
        <TabPanel 
          value={value_panel}
          indPanel={7}
          style={{  minWidth: "800px", }}
        >
            <Table 
                title="Сварные швы"
                columns={columns.welding_seam}
                value={7}
                data={columns_data.welding_seam}
                isLoading={isRequesting}
                actions={
                  userRole === "admin"
                    ? [
                      {
                        icon: "add",
                        tooltip: "Добавить шов",
                        isFreeAction: true,
                        onClick: () => setIsModalOpen(true),
                      },
                      {
                        icon: "edit",
                        tooltip: "Редактировать шва",
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
