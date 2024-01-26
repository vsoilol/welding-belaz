import Tab from "@material-ui/core/Tab";
import Tabs from "@material-ui/core/Tabs";
import { instructionsImage } from "assets/pics";
import { InstructionsTable } from "components/Instructions/components/Instructions";
import ToolTip from "components/shared/ToolTip";
import React, { useEffect, useState } from "react";
import styles from "./styles.module.scss";

export const Instructions = ({
  instructions,
  wpsInstructions,

  // loadInstructions,
  addInstruction,
  deleteInstruction,
  editInstruction,

  loadWpsInstructions,
  addWpsInstruction,
  deleteWpsInstruction,
  editWpsInstruction,

  userRole,
  isRequesting,
}) => {
  const [value, setValue] = useState(0);

  useEffect(() => {
    // loadInstructions();
    loadWpsInstructions();
  }, [, /* loadInstructions */ loadWpsInstructions]);

  const wpsSelectInstructions = wpsInstructions.length
    ? wpsInstructions?.map(({ id, wpsName }) => ({
        value: id,
        label: wpsName,
      }))
    : [];

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

  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  return (
    <div className={styles.innerWrapper}>
      <ToolTip
        title="Инструкции на тех.процесс сварки"
        toolTipText="Здесь Вы сможете просмотреть инструкции на технологические процессы, операционные технологические карты, добавить новые, отредактировать имеющиеся"
        src={instructionsImage}
      />
      <Tabs
        value={value}
        onChange={handleChange}
        indicatorColor="primary"
        textColor="primary"
        variant="fullWidth"
        aria-label="full width tabs example"
      >
        <Tab label="ОТК" {...a11yProps(0)} />
        <Tab label="ИТП" {...a11yProps(1)} />
      </Tabs>
      <TabPanel
        value={value}
        index={0}
        style={{
          minWidth: "60%",
        }}
      >
        <InstructionsTable
          tableType="OTK"
          isRequesting={isRequesting}
          instructions={instructions}
          addInstruction={addInstruction}
          deleteInstruction={deleteInstruction}
          editInstruction={editInstruction}
          wpsSelectInstructions={wpsSelectInstructions}
          wpsInstructions={wpsInstructions}
          userRole={userRole}
        />
      </TabPanel>
      <TabPanel
        value={value}
        index={1}
        style={{
          minWidth: "60%",
        }}
      >
        <InstructionsTable
          tableType="WPS"
          isRequesting={isRequesting}
          instructions={wpsInstructions}
          addInstruction={addWpsInstruction}
          deleteInstruction={deleteWpsInstruction}
          editInstruction={editWpsInstruction}
          wpsSelectInstructions={wpsSelectInstructions}
          userRole={userRole}
        />
      </TabPanel>
    </div>
  );
};
