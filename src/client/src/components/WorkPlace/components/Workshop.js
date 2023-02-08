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
import styles from "components/WorkPlace/styles.module.css";



import axios from "axios";
import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";
import api from "services/api";




const dateOptions = {
  day: "numeric",
  month: "short",
  year: "numeric",
};


export const Workshop = ({
  workshop,
  area,
  userRole,


  value_panel,
  value_panel2
}) => {





  const columns = [
    {
      title: "Наименование цеха",
      field: "name",
    },
    {
      title: "Номер  цеха",
      field: "number",
    },
    {
      title: "Перерейти к",
      render: (rowData) => {
        return <p className={styles.goOver} onClick={e => { GoTo( "Производственные участки", rowData.id) }}>Производственный участок</p>;
      },
    }
  ]

  const [value_goToTitle, setValuegoToTitle] = useState("");
  const [value_goToHeadTable, setValuegoToHeadTable] = useState(columns);
  const [value_goToBodyTable, setValuegoToBodyTable] = useState(workshop);
  const [value_goTo, setValuegoTo] = useState(0);


  const [, setValue] = useState(value_panel);
  const [, setValue2] = useState(value_panel2);




  function GoTo(title, id) {
    setValuegoToTitle(title)
    setValuegoTo(1)


    setValue(0);
    setValue2(0);

    setValuegoToHeadTable(columns)
    //Вывод Производственный участок для цеха
    let areaNew = []
    for (let index = 0; index < area.length; index++) {
      if (area[index].workshop.id === id) {
        areaNew.push(area[index])
      }
    }
    setValuegoToBodyTable(areaNew)

  }

  const TabPanel = (props_panel) => {
    const { children, value, indPanel } = props_panel;
    return <div hidden={value !== indPanel}>{children}</div>;
  };

  ////////////////////////////////////////////////////////////////////
  return (
    <div className={styles.innerWrapper}>

      <div className={styles.tableWrapper}>
        {/*Цеха*/}
        <TabPanel
          style={{ minWidth: "800px" }}
        >
          <Table
            title="Цеха"
            columns={columns}
            data={workshop}
            actions={
              userRole === "Admin"
                ? [
                  {
                    icon: "add",
                    tooltip: "Добавить цех",
                    isFreeAction: true,
                    onClick: () => {
                      // setIsModalOpen(true); setIsModalNumb(8) 
                    },
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать цех",
                    onClick: (event, rowData) => {
                      // setModalData(rowData);
                      // setIsModalOpen(true);
                      // setIsModalNumb(0);

                    },
                  },
                ]
                : []
            }
          />
        </TabPanel>


        {/*Перейти к */}
        <div className="TableToGo">
          <TabPanel
            value={value_goTo}
            indPanel={1}
            style={{ minWidth: "800px" }}
          >
            <Table
              title={value_goToTitle}
              columns={value_goToHeadTable}
              value={3}
              data={value_goToBodyTable}

            />
          </TabPanel>
        </div>



      </div>
    </div>
  );
};
