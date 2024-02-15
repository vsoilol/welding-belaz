import Paper from '@material-ui/core/Paper';
import MaterialTable from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableContainer from '@material-ui/core/TableContainer';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import { Table } from 'components/shared/Table';
import deleteIcon from 'assets/icons/delete.png';
import React, { useEffect, useState } from 'react';
import ModalWindow from 'components/shared/ModalWindow';
import { Formik } from 'formik';
import Button from 'components/shared/Button';
import Input from 'components/shared/Input';

import api from 'services/api';

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
} from 'recharts';
import styles from '../styles.module.scss';

import '../style.scss';

export const RecordsTable = ({
  records,
  isRequesting,
  deleteRecords,
  userRole,
  loadRecords,
}) => {
  const [deleteRecordsModal, setdeleteRecordsModal] = useState(false);
  const [idRecords, setidRecords] = useState('');

  const [updatedRecords, setUpdatedRecords] = useState(records);

  const [dateStart, setdateStart] = useState('');
  const [dateEnd, setdataEnd] = useState('');

  const [valueDisplay, setvalueDisplay] = useState(false);
  const [arrayIdRecords, setarrayIdRecords] = useState([]);

  const handleCheckboxChange = id => {
    if (arrayIdRecords.includes(id)) {
      // Если id уже есть в массиве, удаляем его
      setarrayIdRecords(arrayIdRecords.filter(itemId => itemId !== id));
    } else {
      // Если id отсутствует в массиве, добавляем его
      setarrayIdRecords([...arrayIdRecords, id]);
    }
  };
  const columns = [
    userRole === 'Admin' /*|| userRole === "Master"*/ && {
      title: 'Удаление',
      render: rowData => (
        <img
          className={styles.deleteIcon}
          src={deleteIcon}
          onClick={() => {
            setdeleteRecordsModal(true);
            setidRecords(rowData?.id);
          }}
        />
      ),
    },
    valueDisplay && {
      title: 'Выбор',
      render: rowData => (
        <input
          type="checkbox"
          value={rowData?.id}
          checked={arrayIdRecords.includes(rowData?.id)}
          onChange={() => handleCheckboxChange(rowData?.id)}
        />
      ),
    },
    {
      title: 'Порядковый номер изделия',
      render: rowData =>
        rowData?.sequenceNumber !== null &&
        rowData.sequenceNumber.length > 0 ? (
          rowData.sequenceNumber
        ) : (
          <p>{`  -   `} </p>
        ),
    },
    { title: 'Дата', field: 'date' },
    {
      title: 'Номер шва',
      render: rowData =>
        rowData?.seamNumber !== null && rowData.seamNumber.length > 0 ? (
          rowData.seamNumber
        ) : (
          <p>{`  -   `} </p>
        ),
    },
    { title: 'Длительность сварки', field: 'weldingDuration' },
    { title: 'Сварочный ток (среднее)', field: 'weldingCurrentAverage' },
    { title: 'Напряжение на дуге (среднее)', field: 'arcVoltageAverage' },
    { title: 'Время начала сварки', field: 'weldingStart' },
    {
      title: 'Номер задания ( ссылка )',
      render: rowData => {
        if (rowData?.weldingTaskNumber != null) {
          return (
            <a href="/tasks" target="_blank">
              {rowData?.weldingTaskNumber ?? '-'}
            </a>
          );
        } else {
          return <p>{`  -   `} </p>;
        }
      },
    },
    {
      title: 'Сварщик',
      render: rowData => (
        <div>
          <span> {rowData?.welder?.middleName} </span>
          <span> {rowData?.welder?.firstName}</span>
          <span> {rowData?.welder?.lastName} </span>
        </div>
      ),
    },
    {
      title: 'Оборудование ( номер )',
      render: rowData => (
        <div>
          <span> {rowData?.weldingEquipment?.factoryNumber}</span>
          <span> {rowData?.weldingEquipment?.marking} </span>
        </div>
      ),
    },
    {
      title: 'Руководитель сварочных работ (мастер): ',
      render: rowData => (
        <div>
          <span> {rowData?.master?.middleName} </span>
          <span> {rowData?.master?.firstName}</span>
          <span> {rowData?.master?.lastName} </span>
        </div>
      ),
    },
  ].filter(column => column);
  const renderRowChildren = rowData => {
    let time = rowData?.startTime;
    let Endtime = rowData?.date;
    let dateObject = new Date(time);
    let dateObjectEnd = new Date(Endtime);
    Array.prototype.max = function () {
      return Math.max.apply(null, this);
    };
    Array.prototype.min = function () {
      return Math.min.apply(null, this);
    };
    let ArrayVoltageValues = [];
    let ArrayweldingCurrentValues = [];
    for (let index = 0; index < rowData?.arcVoltageValues.length; index++) {
      ArrayVoltageValues.push({
        id: 0,
        value: rowData?.arcVoltageValues[index],
      });
    }
    for (let index = 0; index < rowData?.weldingCurrentValues.length; index++) {
      ArrayweldingCurrentValues.push({
        id: 0,
        value: rowData?.weldingCurrentValues[index],
      });
    }
    const formatYAxis = value => Math.round(value / 10);
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
              }}>
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
                label={{
                  value: 'Время сварки ( секунды )',
                  position: 'insideBottom',
                  offset: -4,
                }}
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
              {rowData?.weldingCurrentMin !== undefined && (
                <ReferenceLine
                  y={rowData?.weldingCurrentMin}
                  stroke="red"
                  strokeDasharray="3 3"
                  label="минимальная сила тока"
                  strokeWidth={2}
                />
              )}
              {rowData?.weldingCurrentMax !== undefined && (
                <ReferenceLine
                  y={rowData?.weldingCurrentMax}
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
              }}>
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
                label={{
                  value: 'Время сварки ( секунды )',
                  position: 'insideBottom',
                  offset: -2,
                }}
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
              {rowData?.arcVoltageMin !== undefined && (
                <ReferenceLine
                  y={rowData?.arcVoltageMin}
                  stroke="red"
                  strokeDasharray="3 3"
                  label="минимальное напряжение"
                  strokeWidth={2}
                />
              )}
              {rowData?.arcVoltageMax !== undefined && (
                <ReferenceLine
                  y={rowData?.arcVoltageMax}
                  stroke="green"
                  strokeDasharray="3 3"
                  label="максимальное напряжение"
                  strokeWidth={2}
                />
              )}
            </LineChart>
          </ResponsiveContainer>
        </div>
        <div className={styles.AxisBlocks}>
          <ResponsiveContainer width="100%" height={50}>
            <LineChart data={ArrayweldingCurrentValues} syncId="anyId">
              <Brush
                interval={9}
                tickFormatter={formatYAxis}
                height={45}
                marginTop={30}
              />
            </LineChart>
          </ResponsiveContainer>
        </div>
      </TableContainer>
    );
  };

  ////Отобразить с отклонениями / без отклонений
  const [selectedOption, setSelectedOption] = useState('all');
  function handleOptionChange(option) {
    setSelectedOption(option);
    handleShowRecords(option);
  }

  function handleShowRecords(option) {
    if (option === 'withViolations') {
      setUpdatedRecords(records.filter(item => item.areDeviations === true));
    } else if (option === 'withoutViolations') {
      setUpdatedRecords(records.filter(item => item.areDeviations === false));
    } else {
      setUpdatedRecords(records);
    }
  }

  function showRecordsPeriod() {
    let StartDate = new Date(dateStart).toLocaleDateString('ru-RU', {
      dateStyle: 'short',
    });
    let EndDate = new Date(dateEnd).toLocaleDateString('ru-RU', {
      dateStyle: 'short',
    });
    api
      .get(
        `weldingRecord/period?StartDate=${StartDate}&EndDate=${EndDate}&SeamNumber=&WeldingTaskNumber=&WelderId=&MasterId=&EquipmentId=`
      )
      .then(response => {
        setSelectedOption('Period');
        setUpdatedRecords(response.data);
      })
      .catch(error => {});
  }

  const [serialnumber, setserialnumber] = useState('');
  const [serchOnserialnumber, setserchOnserialnumber] = useState('');

  function Setserialnumber() {
    api
      .post(`/weldingRecord/set-sequence-number`, {
        weldingRecordIds: arrayIdRecords,
        sequenceNumber: serialnumber,
      })
      .then(response => {
        loadRecords();
        setvalueDisplay(false);
      })
      .catch(error => {});
  }

  function FindTask() {
    if (serchOnserialnumber) {
      let ListTask = records.filter(
        item => item.sequenceNumber === serchOnserialnumber
      );
      setSelectedOption('task');
      setUpdatedRecords(ListTask);
    } else {
      setSelectedOption('all');
    }
  }

  return (
    <div className={styles.tableWrapper}>
      <div className={styles.tools}>
        <div className={styles.datePeriod}>
          <label>Вывод записей за период </label>
          <div className={`${styles.period}`}>
            <label>Начало </label> <br></br>
            <Input
              onChange={e => {
                setdateStart(e.target.value);
              }}
              width="200"
              style={{ height: 40, padding: '0 20px 0 30px', width: 200 }}
              value={dateStart}
              name="dateStart"
              placeholder="Дата"
              type="text"
              onFocus={e => {
                e.currentTarget.type = 'date';
              }}
              autoComplete="off"
            />
            <br></br>
            <br></br>
            <label>Конец </label> <br></br>
            <Input
              onChange={e => {
                setdataEnd(e.target.value);
              }}
              width="200"
              style={{ height: 40, padding: '0 20px 0 30px', width: 200 }}
              value={dateEnd}
              name="dateEnd"
              placeholder="Дата"
              type="text"
              onFocus={e => {
                e.currentTarget.type = 'date';
              }}
              autoComplete="off"
            />
          </div>
          <button className={styles.sort} onClick={showRecordsPeriod}>
            Отобразить
          </button>
        </div>

        <div className={styles.datePeriod}>
          <label>
            Вывод записей <br></br>без нарушений / с нарушениями{' '}
          </label>
          <div className={styles.period}>
            <label className={styles.labelradio}>
              <input
                type="radio"
                value="withViolations"
                checked={selectedOption === 'withViolations'}
                onChange={() => handleOptionChange('withViolations')}
              />
              С нарушениями
            </label>
            <label className={styles.labelradio}>
              <input
                type="radio"
                value="withoutViolations"
                checked={selectedOption === 'withoutViolations'}
                onChange={() => handleOptionChange('withoutViolations')}
              />
              Без нарушений
            </label>
            <label className={styles.labelradio}>
              <input
                type="radio"
                value="all"
                checked={selectedOption === 'all'}
                onChange={() => handleOptionChange('all')}
              />
              Все записи
            </label>
          </div>
        </div>

        {userRole === 'Admin' || userRole === 'Master' ? (
          <div className={styles.datePeriod}>
            <label>
              Установить порядковый <br></br>номер для записей{' '}
            </label>
            {valueDisplay ? (
              <div>
                <div className={styles.row}>
                  <Input
                    onChange={e => {
                      setserialnumber(e.target.value);
                    }}
                    style={{
                      width: 150,
                      height: 40,
                      padding: '0px 0px 0px 20px',
                    }}
                    type="text"
                    value={serialnumber}
                    name={`serialnumber`}
                    placeholder="Порядковый номер"
                    autoComplete="off"
                  />
                </div>
                <button
                  className={styles.sort}
                  onClick={() => {
                    Setserialnumber();
                  }}>
                  Установить
                </button>
              </div>
            ) : null}

            <div className={styles.period}>
              <button
                className={styles.sort}
                onClick={e => {
                  setvalueDisplay(!valueDisplay);
                }}>
                {!valueDisplay ? 'Установить' : 'Отменить'}
              </button>
            </div>
          </div>
        ) : null}

        <div className={styles.datePeriod}>
          <label>
            Поиск задания по <br></br>порядковому номеру изделия
          </label>
          <div>
            <div className={styles.row}>
              <Input
                onChange={e => {
                  setserchOnserialnumber(e.target.value);
                }}
                style={{
                  width: 150,
                  height: 40,
                  padding: '0px 0px 0px 20px',
                }}
                type="text"
                value={serchOnserialnumber}
                name={`serchOnserialnumber`}
                placeholder="Порядковый номер"
                autoComplete="off"
              />
            </div>
            <button
              className={styles.sort}
              onClick={() => {
                FindTask();
              }}>
              Найти
            </button>
          </div>
        </div>
      </div>

      <Table
        title="Записи"
        actions={[]}
        columns={columns}
        renderRowChildren={renderRowChildren}
        data={selectedOption === 'all' ? records : updatedRecords}
        isLoading={isRequesting}
        deleteAction={null}
      />
      {/*Удаление записи*/}
      <ModalWindow
        isOpen={deleteRecordsModal}
        headerText="Удаление"
        setIsOpen={state => {
          setdeleteRecordsModal(false);
        }}
        wrapperStyles={{ width: 420 }}>
        <Formik
          initialValues={{}}
          enableReinitialize
          onSubmit={variables => {
            const { id, ...dataToSend } = variables;
            setdeleteRecordsModal(false);
            deleteRecords(idRecords);
          }}>
          {({
            handleSubmit,
            handleChange,
            values,
            setFieldValue,
            handleBlur,
          }) => (
            <form onSubmit={handleSubmit}>
              <div>
                <h4 style={{ padding: '35px 40px' }}>
                  Вы уверены что хотите <span>удалить</span> запись ?{' '}
                </h4>

                <div className={styles.row}>
                  <Button type="submit">Удалить</Button>
                </div>
              </div>
            </form>
          )}
        </Formik>
      </ModalWindow>
    </div>
  );
};
