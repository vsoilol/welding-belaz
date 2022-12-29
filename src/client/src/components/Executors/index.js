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
}) => {
  const [value, setValue] = useState(0);

  useEffect(() => {
    loadExecutors();
    loadMasters();
    loadTechs();
  }, [loadExecutors, loadTechs, loadMasters]);

  const handleChange = (event, newValue) => {
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
      >
        <Tab label="Руководители сварочных работ (мастера)" {...a11yProps(0)} />
        <Tab label="Сварщики" {...a11yProps(1)} />
        <Tab label="Технический надзор" {...a11yProps(2)} /> 
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
          editExecutor={editMaster}
          executors={masters}
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
          masters={masters}
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
          editExecutor={editTech}
          executors={techs}
        />
      </TabPanel>
    </div>
  );
};
