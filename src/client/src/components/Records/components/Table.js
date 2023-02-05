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
} from "recharts";
import styles from "../styles.module.css";

import  "../style.css";

const dateOptions = {
  day: "numeric",
  month: "short",
  year: "numeric",
};

const StyleNewTable = {
  width:"calc(100% - 80px)",
  margin:"0 auto"
}

export const RecordsTable = ({ records, isRequesting }) => { 
  const columns = [
    { title: "Наименование", field: "weldingConnectionName" },
    { title: "Исполнитель", field: "executorName" },
    {
      title: "Дата",
      field: "startTime",
      render: (rowData) => (
        <span>
          {new Date(rowData?.startTime).toLocaleDateString(
            "ru-RU",
            dateOptions
          )}
        </span>
      ), 
    },
    { 
      title: "Оборудование", 
      field: "machineName",
      render: (rowData) => {  
        return (
        <p>
          {rowData.machineName} <br></br>
          Маркировка : {rowData.mark}<br></br>
          Инвентарный номер : {rowData.instruction.otkName}
        </p>
        )
        
      },
     },
    { title: "Руководитель сварочных работ", field: "masterName" },
    {
      title: "Инструкция",
      field: "instruction",
      render: (rowData) =>
        rowData?.instruction?.otkName && (
          <p>
            <a
              className={styles.link}
              target="_blank"
              rel="noopener noreferrer"
              href={rowData?.instruction?.otkUrl}
              key={rowData?.instruction?.otkName}
            >
              {rowData?.instruction?.otkName + " "}
            </a>
          </p>
        ),
    },
    { 
      title: "Регистратор (номер)", 
      field: "masterName" ,
      render: (rowData) =>{ 
        return (
        <p>
           
        </p>
        )
      },
    }
  ];

  const renderRowChildren = (rowData) => { 
 
    let time = rowData.startTime
    let Endtime = rowData.date

    let  dateObject = new Date(time);  
    let  dateObjectEnd = new Date(Endtime);  


    Array.prototype.max = function() {
      return Math.max.apply(null, this);
    };
    Array.prototype.min = function() {
      return Math.min.apply(null, this);
    };

    let Arrayvoltages = []
 
    for (let index = 0; index < rowData.voltages.length; index++) {
       Arrayvoltages.push(rowData.voltages[index].value)  
    } 
    /* rowData.startTime */
    return (
      <TableContainer component={Paper}>
        <MaterialTable aria-label="simple table">
          <TableHead>
            <TableRow>
              <TableCell
                style={{
                  borderBottom: 0,
                }}
                align="center"
              >
                Объект
              </TableCell>
              <TableCell
                style={{
                  borderBottom: 0,
                }}
                align="center"
              >
                Участок/цех
              </TableCell>
              <TableCell
                style={{
                  borderBottom: 0,
                }}
                align="center"
              >
                Тех.надзор
              </TableCell>
              <TableCell
                style={{
                  borderBottom: 0,
                }}
                align="center"
              >
                Материал
              </TableCell>
              <TableCell
                style={{
                  borderBottom: 0,
                }}
                align="center"
              >
                Электрод
              </TableCell>
              <TableCell
                style={{
                  borderBottom: 0,
                }}
                align="center"
              >
                Сварочная проволока
              </TableCell>
              <TableCell
                style={{
                  borderBottom: 0,
                }}
                align="center"
              >
                Продолжительность, мин
              </TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            <TableRow key={rowData.id}>
              <TableCell align="center" component="th" scope="row">
                {rowData.object}
              </TableCell>
              <TableCell align="center" component="th" scope="row">
                {rowData.sector}
              </TableCell>
              <TableCell align="center" component="th" scope="row">
                {rowData.techControllerName}
              </TableCell>
              <TableCell align="center" component="th" scope="row">
                {rowData.generalMaterial}
              </TableCell>
              <TableCell align="center" component="th" scope="row">
                {rowData.weldingElectrodes}
              </TableCell>
              <TableCell align="center" component="th" scope="row">
                {rowData.weldingWire}
              </TableCell>
              <TableCell align="center" component="th" scope="row">
                {parseFloat(rowData.weldingDuringMin).toFixed(2)}
              </TableCell>
            </TableRow>
          </TableBody>
        </MaterialTable>
        <p>Сварочный ток, А</p>

        <ResponsiveContainer width="100%" height={200}>
          <LineChart
            width={500}
            height={200}
            data={rowData?.amperages}
            syncId="anyId"
            margin={{
              top: 10,
              right: 30,
              left: 0,
              bottom: 0,
            }}
          >
            <CartesianGrid strokeDasharray="3 3" />
            <XAxis />
            <YAxis />
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
        <p>Напряжение на дуге, В</p>

        <ResponsiveContainer width="100%" height={200}>
          <LineChart
            width={500}
            height={200}
            data={rowData.voltages}
            syncId="anyId"
            margin={{
              top: 10,
              right: 30,
              left: 0,
              bottom: 0,
            }}
          >
            <CartesianGrid strokeDasharray="3 3" />
            <XAxis />
            <YAxis />
            <Tooltip />
            <Line
              type="monotone"
              dataKey="value"
              stroke="#82ca9d"
              fill="#82ca9d"
              dot={false}
            />
            <Brush />
          </LineChart>
        </ResponsiveContainer>
        <p></p>


        <p className="DeapTime">
            <span>Диапазон времени: </span>&nbsp;
            {dateObjectEnd.toLocaleDateString()}
            &nbsp;
            {dateObjectEnd.toLocaleTimeString()}
            
            &nbsp;
            -
            &nbsp;
            {dateObject.toLocaleDateString()}
            &nbsp;
            {dateObject.toLocaleTimeString()}
        </p>

        <p className="DeapGranic">
          <span>Границы допусков: </span>&nbsp;
          {Arrayvoltages.min()}  
          &nbsp;
            -
            &nbsp;
          {Arrayvoltages.max()}  
        </p>


        {/*Новая Таблица 1  */}
        <MaterialTable aria-label="simple table" style={StyleNewTable} >
          <TableHead>
            <TableRow>
              <TableCell
                style={{
                  borderBottom: 0,
                }}
                align="left"
                rowspan="2"
              >
                 
              </TableCell>
              <TableCell
                style={{
                  borderBottom: 0,
                }}
                align="center"
                colspan="3"
              >
                <strong>Значения</strong>
              </TableCell>
              <TableCell
                style={{
                  borderBottom: 0,
                }}
                align="right"
                rowspan="2"
              >
                <strong>Обеспечение допуска</strong>
                
              </TableCell>
               
            </TableRow>
             
          </TableHead>
          <TableBody>
              
            <TableRow key={rowData.id}>
                
              
                 <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="left"
                  colspan="1"
                >
                   
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                  colspan="1"
                >
                  <strong>Минимальнове</strong>
                  
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                  colspan="1"
                >
                  <strong>Максимальное</strong>
                  
                </TableCell>
                <TableCell
                  style={{
                    borderBottom:0,
                  }}
                  align="center"
                  colspan="1"
                >
                  <strong>Среднее</strong>
                  
                </TableCell> 
            </TableRow>
              
            <TableRow key={rowData.id}>
                
              

              <TableCell align="left" component="th" scope="row">
                  Сварочный ток, А
              </TableCell>
              <TableCell align="center" component="th" scope="row">
                   {rowData.instruction.allowances[0].minAmp }
              </TableCell>
              <TableCell align="center" component="th" scope="row">
                   {rowData.instruction.allowances[0].maxAmp }
              </TableCell>
              <TableCell align="center" component="th" scope="row">
                   {
                    ( rowData.instruction.allowances[0].maxAmp - rowData.instruction.allowances[0].minAmp )/2
                   }
              </TableCell> 
              <TableCell align="right" component="th" scope="row">
                   Да
              </TableCell> 
              
            </TableRow>
            <TableRow key={rowData.id}>
              <TableCell align="left" component="th" scope="row">
                 Напряжение на дуге, В
              </TableCell>
              <TableCell align="center" component="th" scope="row">
                   {rowData.instruction.allowances[0].minVolt }
              </TableCell>
              <TableCell align="center" component="th" scope="row">
                   {rowData.instruction.allowances[0].maxVolt }
              </TableCell>
              <TableCell align="center" component="th" scope="row">
                   {
                    ( rowData.instruction.allowances[0].maxVolt - rowData.instruction.allowances[0].minVolt )/2
                   }
              </TableCell> 
              <TableCell align="right" component="th" scope="row">
                   Да
              </TableCell> 
              
            </TableRow>
            <TableRow key={rowData.id}>
              <TableCell align="left" component="th" scope="row">
                 Оценка
              </TableCell>
              <TableCell align="center" component="th" scope="row">
                  
              </TableCell>
              <TableCell align="center" component="th" scope="row">
                   
              </TableCell>
              <TableCell align="center" component="th" scope="row">
                   0
              </TableCell> 
              <TableCell align="right" component="th" scope="row">
                 
              </TableCell> 
              
            </TableRow>
          </TableBody>
        </MaterialTable>
           

           <br></br> 

        {/*Новая Таблица 2  */}
        <MaterialTable aria-label="simple table" style={StyleNewTable} > 
          <TableBody>  
            <TableRow key={rowData.id}> 
              <TableCell align="left" component="th" scope="row"  >
                  Температура окружающей среды ℃
              </TableCell>
              <TableCell align="right" component="th" scope="row"  >
                    16.9
              </TableCell> 
            </TableRow>
            <TableRow key={rowData.id}> 
                <TableCell align="left" component="th" scope="row"  >
                    Влажность %
                </TableCell>
                <TableCell align="right" component="th" scope="row"  >
                      47.2
                </TableCell> 
              </TableRow>
          </TableBody>
        </MaterialTable>

        <br></br> 

        {/*Новая Таблица 3  */}
        <MaterialTable aria-label="simple table" style={StyleNewTable}  >
          <TableHead>
            <TableRow>
              <TableCell align="left" component="th" scope="row"  >
                   
              </TableCell>
              <TableCell align="right" component="th" scope="row"  >
                    <strong>Значение</strong>
              </TableCell>
              <TableCell align="right" component="th" scope="row"  >
                    <strong> Обеспечение допуска</strong>  
              </TableCell>
               
            </TableRow>
             
          </TableHead>
          <TableBody> 
              
            <TableRow key={rowData.id}>
                
              

              <TableCell align="left" component="th" scope="row"  >
                    Межслойная температура, ℃
              </TableCell>
              <TableCell align="right" component="th" scope="row"  >
                    0
              </TableCell>
              <TableCell align="right" component="th" scope="row"  >
                    Да
              </TableCell>
              
            </TableRow>
            <TableRow key={rowData.id}> 
              <TableCell align="left" component="th" scope="row"  >
                    МТемпература предварителього подогрева, ℃
              </TableCell>
              <TableCell align="right" component="th" scope="row"  >
                    -
              </TableCell>
              <TableCell align="right" component="th" scope="row"  >
                   -
              </TableCell>
              </TableRow>
          </TableBody>
        </MaterialTable>

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
