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

import {
  LineChart,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  Brush,
  AreaChart,
  Area,
  ReferenceLine,
  ResponsiveContainer,
  Layer,
} from "recharts";
import styles from "../styles.module.css";

import "../style.css";
const dateOptions = {
  day: "numeric",
  month: "short",
  year: "numeric",
};
const StyleNewTable = {
  width: "calc(100% - 80px)",
  margin: "0 auto"
}


export const RecordsTable = ({ records, isRequesting, deleteRecords, userRole }) => {
  const [deleteRecordsModal, setdeleteRecordsModal] = useState(false);
  const [idRecords, setidRecords] = useState("");
  console.clear()
  console.log(records)
  const columns = [
    (userRole === "Admin" /*|| userRole === "Master"*/) && {
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
    },
    { title: "Номер шва", field: "seamNumber" },
    { title: "Длительность сварки", field: "weldingDuration" }, 
    {  title: "Сварочный ток (среднее)",  field: "weldingCurrentAverage",  },
    {  title: "Напряжение на дуге (среднее)",   field: "arcVoltageAverage",  },


    { title: "Дата", field: "date" },
    { title: "Время начала сварки", field: "weldingStart" },
    {
      title: "Номер задания ( ссылка )",
      render: (rowData) => {
        if (rowData?.weldingTaskNumber != null) {
          return (
            <a href="/tasks" target="_blank">{rowData.weldingTaskNumber ?? "-"}</a>
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
  const renderRowChildren = (rowData) => {
    console.log(rowData)
    let time = rowData.startTime
    let Endtime = rowData.date
    let dateObject = new Date(time);
    let dateObjectEnd = new Date(Endtime);
    Array.prototype.max = function () {
      return Math.max.apply(null, this);
    };
    Array.prototype.min = function () {
      return Math.min.apply(null, this);
    };
    let ArrayVoltageValues = []
    let ArrayweldingCurrentValues = []
    for (let index = 0; index < rowData.arcVoltageValues.length; index++) {
      ArrayVoltageValues.push({ id: 0, value: rowData.arcVoltageValues[index] })
    }
    for (let index = 0; index < rowData.weldingCurrentValues.length; index++) {
      ArrayweldingCurrentValues.push({ id: 0, value: rowData.weldingCurrentValues[index] })
    }
    const formatYAxis = (value) => Math.round(value / 10);
    return (
      <TableContainer className={styles.border} component={Paper}>
        <div className={styles.AxisBlocks}>
          <p>Сварочный ток, А</p>
          <ResponsiveContainer width="100%" height={250}>
            <LineChart
              data={ArrayweldingCurrentValues}
              syncId="anyId"
              margin={{
                top: 10,
                right: 30,
                left: 0,
                bottom: 20,
              }}
            >
              <CartesianGrid strokeDasharray="3 3" />
              <YAxis
                label={{
                  value: 'Ток ',
                  angle: -90,
                  offset: 6,
                  position: 'insideLeft',
                }}
                labelOffset={-80}
              />
              <XAxis
                interval={9}
                tickFormatter={formatYAxis}
                label={{ value: 'Время сварки ( секунды )', position: 'insideBottom', offset: -4 }}
              />
              <Tooltip />
              <Line
                type="monotone"
                dataKey="value"
                strokeWidth={3}
                stroke="#8884d8"
                fill="#8884d8"
                dot={false}
              />
              {rowData.weldingCurrentMin !== undefined && (
                <ReferenceLine
                  y={rowData.weldingCurrentMin}
                  stroke="red"
                  strokeDasharray="3 3"
                  label="минимальная сила тока"
                  strokeWidth={2}
                />
              )}
              {rowData.weldingCurrentMax !== undefined && (
                <ReferenceLine
                  y={rowData.weldingCurrentMax}
                  stroke="green"
                  strokeDasharray="3 3"
                  label="максимальная сила тока"
                  strokeWidth={2}
                />
              )}
            </LineChart>
          </ResponsiveContainer>
        </div>
        <div className={styles.AxisBlocks}>
          <p>Напряжение на дуге, В</p>
          <ResponsiveContainer width="100%" height={250}>
            <LineChart
              data={ArrayVoltageValues}
              syncId="anyId"
              margin={{
                top: 10,
                right: 30,
                left: 0,
                bottom: 20,
              }}
            >
              <CartesianGrid strokeDasharray="3 3" />
              <YAxis
                label={{
                  value: 'Напряжение ',
                  angle: -90,
                  offset: 10,
                  position: 'insideLeft',
                }}
                labelOffset={-80}
              />
              <XAxis
                interval={9}
                tickFormatter={formatYAxis}
                label={{ value: 'Время сварки ( секунды )', position: 'insideBottom', offset: -2 }}
                style={{ marginBottom: 45 }}
              />
              <Tooltip />
              <Line
                type="monotone"
                dataKey="value"
                strokeWidth={3}
                stroke="#82ca9d"
                fill="#82ca9d"
                dot={false}
              />
              {rowData.arcVoltageMin !== undefined && (
                <ReferenceLine
                  y={rowData.arcVoltageMin}
                  stroke="red"
                  strokeDasharray="3 3"
                  label="минимальное напряжение"
                  strokeWidth={2}
                />
              )}
              {rowData.arcVoltageMax !== undefined && (
                <ReferenceLine
                  y={rowData.arcVoltageMax}
                  stroke="green"
                  strokeDasharray="3 3"
                  label="максимальное напряжение"
                  strokeWidth={2}
                />
              )}
            </LineChart>
          </ResponsiveContainer>
        </div>
        <div className={styles.AxisBlocks}  >
          <ResponsiveContainer width="100%" height={50}>
            <LineChart
              data={ArrayweldingCurrentValues}
              syncId="anyId"
            >
              <Brush interval={9} tickFormatter={formatYAxis} height={45} marginTop={30} />
            </LineChart>
          </ResponsiveContainer>
        </div>
      </TableContainer>
    );
  };

  return (
    <div className={styles.tableWrapper}>
      <Table
        title="Записи"
        actions={[]}
        columns={columns}
        renderRowChildren={renderRowChildren}
        data={records}
        isLoading={isRequesting}
        deleteAction={null}
      />
      {/*Удаление записи*/}
      <ModalWindow
        isOpen={deleteRecordsModal}
        headerText="Удаление"
        setIsOpen={(state) => {
          setdeleteRecordsModal(false)
        }}
        wrapperStyles={{ width: 420 }}
      >
        <Formik
          initialValues={{}}
          enableReinitialize
          onSubmit={(variables) => {
            const { id, ...dataToSend } = variables;
            setdeleteRecordsModal(false)
            deleteRecords(idRecords)
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

              <div>
                <h4 style={{ padding: "35px 40px" }}>Вы уверены что хотите <span>удалить</span> запись ? </h4>

                <div className={styles.row}>
                  <Button
                    type="submit"
                  >
                    Удалить
                  </Button>
                </div>

              </div>
            </form>
          )}
        </Formik>
      </ModalWindow>
    </div>
  );
};
