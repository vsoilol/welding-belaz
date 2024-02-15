import React, { useState, useContext } from 'react';
import store from 'store';
import MaterialTable from 'material-table';
import { LOCALIZATION_TABLE } from 'components/shared/Table/localization';
import MobileContext from 'context/MobileContext';

import { useWeldingRecordStore } from 'store/welding-record';
import { ExpandRecordRow } from './expand-record-row';

import styles from './style.module.scss';

export const FilteredRecordsTable = () => {
  const isMobile = useContext(MobileContext);
  const { getFilteredRecords } = useWeldingRecordStore();

  const [pageSize, setPageSize] = useState(5);

  const columns = [
    {
      title: 'Порядковый номер изделия',
      align: 'center',
      field: 'sequencenumber',
      render: ({ sequenceNumber }) => (sequenceNumber ? sequenceNumber : '-'),
    },
    { title: 'Дата', field: 'date', align: 'center' },
    {
      title: 'Номер шва',
      render: ({ seamNumber }) => (seamNumber ? seamNumber : '-'),
      align: 'center',
      field: 'seamnumber',
    },
    {
      title: 'Длительность сварки',
      field: 'weldingDuration',
      align: 'center',
    },
    {
      title: 'Сварочный ток (среднее)',
      field: 'weldingCurrentAverage',
      align: 'center',
    },
    {
      title: 'Напряжение на дуге (среднее)',
      field: 'arcVoltageAverage',
      align: 'center',
    },
    {
      title: 'Время начала сварки',
      field: 'weldingstarttime',
      align: 'center',
      render: ({ weldingStart }) => weldingStart,
    },
    {
      title: 'Номер задания (ссылка)',
      render: ({ weldingTaskNumber }) =>
        weldingTaskNumber ? (
          <a href="/tasks" target="_blank">
            {weldingTaskNumber}
          </a>
        ) : (
          '-'
        ),
      align: 'center',
      field: 'weldingtask',
    },
    {
      title: 'Сварщик',
      render: rowData => (
        <div>
          <span>{rowData?.welder?.middleName} </span>
          <span>{rowData?.welder?.firstName} </span>
          <span>{rowData?.welder?.lastName} </span>
        </div>
      ),
      align: 'center',
      field: 'welder',
    },
    {
      title: 'Оборудование (номер)',
      render: rowData => (
        <div>
          <span>{rowData?.weldingEquipment?.factoryNumber}</span>
          <span> {rowData?.weldingEquipment?.marking}</span>
        </div>
      ),
      align: 'center',
      field: 'weldingequipment',
    },
    {
      title: 'Руководитель сварочных работ (мастер)',
      render: rowData => (
        <div>
          <span>{rowData?.master?.middleName} </span>
          <span>{rowData?.master?.firstName} </span>
          <span>{rowData?.master?.lastName}</span>
        </div>
      ),
      align: 'center',
      field: 'master',
    },
  ];

  const getFilteredRecordsPromiseResolver = (resolve, query) => {
    const request = {
      pageNumber: query.page + 1,
      pageSize: query.pageSize,
      searchTerm: query.search,
      sortColumn: query.orderBy?.field,
      sortOrder: query.orderDirection,
    };

    getFilteredRecords(request);

    const unsubscribe = store.subscribe(() => {
      const state = store.getState();
      const data = state.weldingRecord.records;

      if (data) {
        unsubscribe();

        resolve({
          data: data.items,
          page: data.pageNumber,
          totalCount: data.totalCount,
        });
      }
    });
  };

  const rowStyle = rowData => ({
    backgroundColor: rowData?.areDeviations ? 'rgb(249 81 81)' : 'white',
  });

  return (
    <div className={styles.recordTableContainer}>
      <MaterialTable
        localization={LOCALIZATION_TABLE}
        title={!isMobile && 'Записи'}
        columns={columns}
        onChangeRowsPerPage={currentPageSize => {
          setPageSize(currentPageSize);
        }}
        options={{
          pageSize: pageSize,
          rowStyle: rowStyle,
        }}
        data={query =>
          new Promise((resolve, reject) => {
            getFilteredRecordsPromiseResolver(resolve, query);
          })
        }
        detailPanel={ExpandRecordRow}
      />
    </div>
  );
};
