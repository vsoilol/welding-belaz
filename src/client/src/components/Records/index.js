import { instructionsImage } from "assets/pics";
import { RecordsTable } from "./components/Table";
import ToolTip from "components/shared/ToolTip";
import React, { useEffect } from "react";
import styles from "./styles.module.css";

export const Records = ({ records, loadRecords, isRequesting, deleteRecords , userRole}) => {
  useEffect(() => {
    loadRecords();
  }, [loadRecords]);

  console.log(userRole)
  return (
    <div className={styles.innerWrapper}>
      <ToolTip
        title="Записи"
        toolTipText="Здесь Вы можете просмотреть данные, полученные с регистратора сварочных процессов"
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
