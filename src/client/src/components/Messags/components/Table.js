import Paper from "@material-ui/core/Paper";
import MaterialTable from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import { Table } from "components/shared/Table";
import deleteIcon from "assets/icons/delete.png";
import React, { useEffect, useState } from "react";
import ModalWindow from "components/shared/ModalWindow";
import { Formik } from "formik";
import Button from "components/shared/Button";
 
import styles from "../styles.module.css";

import "../style.css";
 


export const RecordsTable = ({ records, isRequesting, deleteRecords ,userRole}) => {
 
  const columns = [
    /* (userRole === "Admin" || userRole === "Master") && {
      title: "Удаление",
      render: (rowData) => (
        <img
          className={styles.deleteIcon}
          src={deleteIcon}
          onClick={() => {
            setdeleteRecordsModal(true);
          setidRecords(rowData?.id)
          }}
        />
      ),
    },    */
    { title: "Дата", field: "date" },
    { title: "Время начала сварки", field: "weldingStart" },
    {
      title: "Номер задания ( ссылка )",
      render: (rowData) => {
        if (rowData?.weldingTaskNumber  != null) {
          return (
            <a href="/tasks" target="_blank">{rowData.weldingTaskNumber  ?? "-"}</a>
          );
        }
        else {
          return (
            <p>{`  -   `} </p>
          );
        }


      }
    },

    {
      title: "Сварщик", render: (rowData) => (
        <div>
          <span> {rowData.welder?.middleName}  </span>
          <span> {rowData.welder?.firstName}</span>
          <span>  {rowData.welder?.lastName}  </span>
        </div>
      ),
    },

    {
      title: "Оборудование ( номер )", render: (rowData) => (
        <div>
          <span> {rowData.weldingEquipment?.marking}  </span>
          <span> {rowData.weldingEquipment?.factoryNumber}</span>
        </div>
      ),
    },

    {
      title: "Руководитель сварочных работ (мастер): ", render: (rowData) => (
        <div>
          <span> {rowData.master?.middleName}  </span>
          <span> {rowData.master?.firstName}</span>
          <span>  {rowData.master?.lastName}  </span>
        </div>
      ),
    },  
  ].filter(column => column);
  

  ///Объединение по датам
  const result = records.filter(obj => obj.areDeviations === true).reduce((result, obj) => {
    const { date, ...rest } = obj;
    if (!result[date]) {
      result[date] = { date, values: [] };
    }
    result[date].values.push(rest);
    return result;
  }, {});
 

  return (
    <div className={styles.tableWrapper}>
      <Table
        title="Сообщения"
        actions={[]}
        columns={columns} 
        data={records.filter(obj => obj.areDeviations === true)}
        isLoading={isRequesting}
        deleteAction={null}
        messags={true}
      />
       
    </div>
  );
};
