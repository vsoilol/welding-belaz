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
  user,
  isRequesting,

  loadEquipment,
  loadWorkshop,
  loadArea,
  equipment,
  workshop,
  area, 
  workplace,
  loadPlace
}) => {
  const [value, setValue] = useState(0);

  useEffect(() => {
    loadExecutors();
    loadMasters();
    loadTechs();
    loadEquipment();
    loadWorkshop();
    loadArea();
    loadPlace();
  }, [loadExecutors, loadTechs, loadMasters,loadEquipment,loadWorkshop,loadArea,loadPlace]);

  const handleChange = (event, newValue) => {
    localStorage.removeItem("VkladkaExecutors")
    setValue(newValue);
  };


  if (Object.keys(user).length>4) {    
     localStorage.setItem("USERID",user.id)  
     localStorage.setItem("USER_productionAreaId",user.productionAreaId)  
  }
 

 
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
        toolTipText="Здесь Вы можете просмотреть профиль сотрудников" /*, отчет о работе сварщика*/
        src={executorsImage}
        workshop={workshop}
        equipment={equipment}
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

          value={value}
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
          workplace={workplace}

          value={value}
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
          value={value}
          equipment={equipment}
          workshop={workshop}
          area={area}
        />
      </TabPanel>
    </div>
  );
};
