import React, { useEffect, useState, useCallback } from 'react';
import styles from './styles.module.scss';
import ToolTip from 'components/shared/ToolTip';
import { reportsImage } from 'assets/pics';
import { Table } from 'components/shared/Table';
import TableCell from '@material-ui/core/TableCell';
import TableRow from '@material-ui/core/TableRow';
import TableContainer from '@material-ui/core/TableContainer';
import TableHead from '@material-ui/core/TableHead';
import MaterialTable from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import ModalWindow from 'components/shared/ModalWindow';
import { Formik } from 'formik';
import Button from 'components/shared/Button';
import Select from 'components/shared/Select';
import Input from 'components/shared/Input';
import api from 'services/api';
import Paper from '@material-ui/core/Paper';

import {
  LineChart,
  Brush,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
} from 'recharts';

export const Modes = ({
  loadEquipmentRequest,
  loadExecutorsRequest,
  executors,
  equipment,
}) => {
  const [valueData, setvalueData] = useState(null);
  const [valueMess, setvalueMess] = useState(
    'Данные за этот период отсутствуют'
  );

  const [valueDate, setvalueDate] = useState(null);
  const [valueStartTime, setvalueStartTime] = useState(null);
  const [valueEndTime, setvalueEndTime] = useState(null);
  const [valueWelderId, setvalueWelderId] = useState(null);
  const [valueEquipmentId, setvalueEquipmentId] = useState(null);

  function GetAllTok() {
    api
      .get(
        `weldingRecord/full?Date=${new Date(valueDate).toLocaleDateString(
          'ru-RU',
          { dateStyle: 'short' }
        )}&StartTime=${valueStartTime ?? ''}&EndTime=${
          valueEndTime ?? ''
        }&WelderId=${valueWelderId ?? ''}&EquipmentId=${valueEquipmentId ?? ''}`
      )
      .then(response => {
        const weldingCurrentValues = response.data.weldingCurrentValues;
        const arcVoltageValues = response.data.arcVoltageValues;
        const weldingStartTime = response.data.weldingStartTime;
        const weldingEndTime = response.data.weldingEndTime;

        if (response.status === 204) {
          setvalueMess('Данные за этот период отсутствуют');
        }
        if (
          weldingCurrentValues &&
          weldingCurrentValues.length === arcVoltageValues.length &&
          weldingCurrentValues.length > 0
        ) {
          const MAX_DATA_POINTS = 1000; // Максимальное количество точек на графике
          const step = Math.ceil(weldingCurrentValues.length / MAX_DATA_POINTS);

          const sampledData = [];
          const startTime = new Date(`2000-01-01 ${weldingStartTime}`);
          const endTime = new Date(`2000-01-01 ${weldingEndTime}`);
          const timeDiff = endTime - startTime;
          const timeStep = timeDiff / weldingCurrentValues.length;

          for (let i = 0; i < weldingCurrentValues.length; i += step) {
            const currentTime = new Date(startTime.getTime() + i * timeStep);
            const hours = currentTime.getHours().toString().padStart(2, '0');
            const minutes = currentTime
              .getMinutes()
              .toString()
              .padStart(2, '0');
            const timeString = `${hours}:${minutes}`;

            sampledData.push({
              name: timeString,
              weldingCurrent: weldingCurrentValues[i],
              arcVoltage: arcVoltageValues[i],
            });
          }
          setvalueData(sampledData);
        } else {
          setvalueData(null);
        }
      })
      .catch(error => {
        setvalueData(null);
        setvalueMess('Выберите либо оборудование либо сварщика');
      });
  }

  useEffect(() => {
    loadEquipmentRequest();
    loadExecutorsRequest();
  }, [loadEquipmentRequest, loadExecutorsRequest]);

  const optequipment = [
    { value: null, label: 'Не выбрано' },
    ...(equipment[0]?.map(item => ({
      value: item.id,
      label: `${item.name} ${item.factoryNumber}`,
    })) || []),
  ];

  const optionWelder = [
    { value: null, label: 'Не выбрано' },
    ...(executors?.map(item => ({
      value: item.id,
      label: `${item.middleName} ${item.firstName} ${item.lastName}`,
    })) || []),
  ];

  return (
    <div className={styles.innerWrapper}>
      <ToolTip
        title="Режимы сварки"
        toolTipText="Здесь Вы можете просмотреть режимы сварки"
        src={reportsImage}
      />

      <div className={styles.tableWrapper}>
        <div className={styles.tools}>
          <div className={styles.rowTools}>
            <div className={styles.row}>
              <Input
                onChange={event => {
                  setvalueDate(event.target.value);
                }}
                width="100%"
                style={{
                  margin: 0,
                  height: 40,
                  padding: '0 20px 0 30px',
                  width: '100%',
                }}
                value={valueDate}
                name="valueDate"
                placeholder="Дата  "
                type="text"
                onFocus={e => {
                  e.currentTarget.type = 'date';
                }}
                autoComplete="off"
              />
            </div>
            <div className={styles.row}>
              <Select
                name="valueWelderId"
                value={valueWelderId}
                width="100%"
                placeholder="Сварщик"
                onChange={event => {
                  setvalueWelderId(event.value);
                }}
                options={optionWelder}
              />
            </div>
            <div className={styles.row}>
              <Select
                name="valueEquipmentId"
                value={valueEquipmentId}
                width="100%"
                placeholder="Оборудование"
                onChange={event => {
                  setvalueEquipmentId(event.value);
                }}
                options={optequipment}
              />
            </div>
            <div className={styles.row}>
              <Input
                onChange={event => {
                  setvalueStartTime(event.target.value);
                }}
                style={{
                  width: '100%',
                  height: 40,
                  padding: '0px 0px 0px 20px',
                }}
                type="text"
                value={valueStartTime}
                name={`valueStartTime`}
                placeholder="Время начало сварки "
                autoComplete="off"
              />
            </div>
            <div className={styles.row}>
              <Input
                onChange={event => {
                  setvalueEndTime(event.target.value);
                }}
                style={{
                  width: '100%',
                  height: 40,
                  padding: '0px 0px 0px 20px',
                }}
                type="text"
                value={valueEndTime}
                name={`valueEndTime`}
                placeholder="Время окончания сварки  "
                autoComplete="off"
              />
            </div>
          </div>
          <button className={styles.Get} onClick={GetAllTok}>
            Отобразить
          </button>
        </div>

        {valueData ? (
          <ResponsiveContainer className={styles.Chart} height={500}>
            <LineChart data={valueData}>
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis
                dataKey="name"
                label={{
                  value: 'Точки',
                  position: 'insideBottomRight',
                  offset: -10,
                }}
              />
              <YAxis
                label={{
                  value: 'Значение',
                  angle: -90,
                  position: 'insideLeft',
                }}
              />
              <Tooltip />
              <Legend verticalAlign="top" />
              <Line
                type="monotone"
                dataKey="weldingCurrent"
                name="Сварочный ток"
                stroke="#8884d8"
                strokeWidth={2}
                activeDot={{ r: 8 }}
              />
              <Line
                type="monotone"
                dataKey="arcVoltage"
                name="Напряжение на дуге"
                stroke="#82ca9d"
                strokeWidth={2}
                activeDot={{ r: 8 }}
              />
              <Brush
                marginTop={30}
                dataKey="name"
                height={50}
                stroke="#8884d8"
              />
            </LineChart>
          </ResponsiveContainer>
        ) : (
          <div>
            <h1>{valueMess}</h1>
          </div>
        )}
      </div>
    </div>
  );
};
