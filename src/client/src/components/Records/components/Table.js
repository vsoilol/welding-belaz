import Paper from "@material-ui/core/Paper";
import MaterialTable from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import { Table } from "components/shared/Table";
import React from "react";
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
  ResponsiveContainer,
  Layer 
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

export const RecordsTable = ({ records, isRequesting }) => {
  const columns = [
    { title: "Дата", field: "date" },
    { title: "Время начала сварки", field: "weldingStart" },
    {
      title: "Номер задания ( ссылка )",
      render: (rowData) => {
        if (rowData?.weldingTask?.number != null) {
          return (
            <a href="/tasks" target="_blank">{rowData.weldingTask?.number ?? "-"}</a>
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
      title: "Оборудование", render: (rowData) => (
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


  ];

  const renderRowChildren = (rowData) => {

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
      <TableContainer className={styles.border} component={Paper} >

        <p>Сварочный ток, А</p>
        <div className={styles.AxisBlocks}> 
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
                  value: 'Ток ',
                  angle: -90,
                  offset: 6,
                  position: 'insideLeft', 
                }} 
                labelOffset={-80}
              /> 
              <XAxis interval={9} tickFormatter={formatYAxis}  label={{ value: 'Время сварки ( секунды )', position: 'insideBottom', offset: -4 }}/>
              <Tooltip />
              <Line
                type="monotone"
                dataKey="value"
                stroke="#8884d8"
                fill="#8884d8"
                dot={false}
              />
            </LineChart>
          </ResponsiveContainer> 
        </div>

        <p>Напряжение на дуге, В</p>

        <div className={styles.AxisBlocks}> 
          <ResponsiveContainer width="100%" height={250}>
       
            <LineChart width={500} height={400}  
             data={ArrayweldingCurrentValues}
             syncId="anyId"
             margin={{
               top: 10,
               right: 30,
               left: 0,
               bottom: 0,
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
                  stroke="#82ca9d"
                  fill="#82ca9d"
                  dot={false}
                />  
              <Brush interval={9} tickFormatter={formatYAxis}  height={45}  marginTop={20} /> 
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
    </div>
  );
};
