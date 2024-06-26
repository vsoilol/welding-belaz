import React, { useState, useEffect } from "react";
import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";
import styles from "./styles.module.css";
import ToolTip from "components/shared/ToolTip";
import { ExecutorsTable } from "components/Executors/components";
import { executorsImage } from "assets/pics";

export const Executors = ({
  loadExecutors,
  addExecutor,
  deleteExecutor,
  editExecutor,
  loadTechs,
  addTech,
  deleteTech,
  editTech,
  loadMasters,
  addMaster,
  deleteMaster,
  editMaster,
  executors,
  masters,
  techs,
  userRole,
  isRequesting,

  loadEquipment,
  loadWorkshop,
  loadArea,
  equipment,
  workshop,
  area, 
}) => {
  const [value, setValue] = useState(0);

  useEffect(() => {
    loadExecutors();
    loadMasters();
    loadTechs();
    loadEquipment();
    loadWorkshop();
    loadArea();
  }, [loadExecutors, loadTechs, loadMasters,loadEquipment,loadWorkshop,loadArea]);

  const handleChange = (event, newValue) => {
    localStorage.removeItem("VkladkaExecutors")
    setValue(newValue);
  };



 
  const a11yProps = (index) => {
    return {
      id: `full-width-tab-${index}`,
      "aria-controls": `full-width-tabpanel-${index}`,
    };
  };

  const TabPanel = (props) => {
    const { children, value, index, ...other } = props;
    if (localStorage.getItem("VkladkaExecutors")!=null) {  
      setValue(Number(localStorage.getItem("VkladkaExecutors"))) 
    } 
    return (
      <div
        role="tabpanel"
        hidden={value !== index}
        id={`full-width-tabpanel-${index}`}
        aria-labelledby={`full-width-tab-${index}`}
        {...other}
      >
        {value === index && children}
      </div>
    );
  };

  return (
    <div className={styles.innerWrapper}>
      <ToolTip
        title="Сотрудники"
        toolTipText="Здесь Вы можете просмотреть профиль сотрудников, отчет о работе сварщика"
        src={executorsImage}
      />
      <Tabs
        value={value}
        onChange={handleChange}
        indicatorColor="primary"
        textColor="primary"
        variant="fullWidth"
        aria-label="full width tabs example"
        className={styles.Tabs}
      >
        <Tab label="Руководители сварочных работ (мастера)" {...a11yProps(0)} />
        <Tab label="Сварщики" {...a11yProps(1)} />
        <Tab label="Контролеры УКК" {...a11yProps(2)} />
      </Tabs>
      <TabPanel
        value={value}
        index={0}
        style={{
          minWidth: "60%",
        }}
      >
        <ExecutorsTable
          type="master"
          isRequesting={isRequesting}
          userRole={userRole}
          addExecutor={addMaster}
          deleteExecutor={deleteMaster}
          editMaster={editMaster}
          executors={masters} 

          equipment={equipment}
          workshop={workshop}
          area={area}
        />
      </TabPanel>
      <TabPanel
        value={value}
        index={1}
        style={{
          minWidth: "60%",
        }}
      >
        <ExecutorsTable
          type="executor"
          isRequesting={isRequesting}
          userRole={userRole}
          addExecutor={addExecutor}
          deleteExecutor={deleteExecutor}
          editExecutor={editExecutor}
          executors={executors} 

          equipment={equipment}
          workshop={workshop}
          area={area}
        />
      </TabPanel>
      <TabPanel
        value={value}
        index={2}
        style={{
          minWidth: "60%",
        }}
      >
        <ExecutorsTable
          type="controller"
          isRequesting={isRequesting}
          userRole={userRole}
          addExecutor={addTech}
          deleteExecutor={deleteTech}
          editTech={editTech}
          executors={techs}

          equipment={equipment}
          workshop={workshop}
          area={area}
        />
      </TabPanel>
    </div>
  );
};
