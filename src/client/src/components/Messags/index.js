import { instructionsImage } from "assets/pics";
import { RecordsTable } from "./components/Table";
import ToolTip from "components/shared/ToolTip";
import React, { useEffect } from "react";
import styles from "./styles.module.css";

export const Messags = ({ records, loadRecords, isRequesting, deleteRecords , userRole}) => {
  useEffect(() => {
    loadRecords();
  }, [loadRecords]);
 
  return (
    <div className={styles.innerWrapper}>
      <ToolTip
        title="Сообщения"
        toolTipText="Здесь Вы можете просмотреть данные,полученные при выходе параметров режимов сварки за нормативные пределы"
        src={instructionsImage}
      />
      <RecordsTable
        tableType="OTK"
        isRequesting={isRequesting}
        records={records}
        userRole={userRole}
        deleteRecords={deleteRecords}
      />
    </div>
  );
};
