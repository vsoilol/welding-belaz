import { tasksImage } from "assets/pics"; 
import ToolTip from "components/shared/ToolTip";
import React, { useEffect } from "react";
import styles from "./styles.module.css";

export const Production_calendar = ({ records, loadRecords, isRequesting, deleteRecords , userRole}) => {
  useEffect(() => {
 
  }, []);
 
  return (
    <div className={styles.innerWrapper}>
      <ToolTip
        title="Производственный календарь "
        toolTipText="Здесь Вы можете просмотреть производственный календарь "
        src={tasksImage}
      />
       
    </div>
  );
};
