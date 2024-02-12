import { useState } from 'react';

import IconButton from '@material-ui/core/IconButton';
import SaveIcon from '@material-ui/icons/Save';
import AddIcon from '@material-ui/icons/Add';

import { Table } from 'components/shared/Table';
import { ExpandProductAccountTaskRow } from './expand-product-account-task-row';
import { useProductAccountTaskStore } from 'store/product-account-task';
import { useAuthStore } from 'store/auth';

import {
  EditProductAccountTaskEquipmentModal,
  EditProductAccountTaskModal,
} from 'components/Tasks/modals';

import { isMaster, isMasterOrInspector } from 'core/constants';
import { LoadingSpinner } from 'components/shared';

import styles from 'components/Tasks/styles.module.scss';

export const ProductAccountTaskTable = () => {
  const { userRole } = useAuthStore();
  const {
    isLoading,
    productAccountTasks,
    setSelectedProductAccountTaskId,
    selectedProductAccountTaskId,
    getFullProductAccountTaskPassport,
    getShortProductAccountTaskPassport,
    isLoadingPassport,
  } = useProductAccountTaskStore();

  const [
    isEditProductAccountTaskModalOpen,
    setIsEditProductAccountTaskModalOpen,
  ] = useState(false);

  const [isEditWeldingEquipmentModalOpen, setIsEditWeldingEquipmentModalOpen] =
    useState(false);

  const getTableDateColumnValue = rowData => {
    const { dateFromPlan, endDateFromPlan } = rowData;

    if (endDateFromPlan && dateFromPlan !== endDateFromPlan) {
      return `С ${dateFromPlan} по ${endDateFromPlan}`;
    }

    return dateFromPlan;
  };

  const getTableProductInfoColumnValue = rowData => {
    const { product } = rowData;

    return product ? `${product.name} ${product.number}` : '-';
  };

  const getTableSeamsColumnValue = rowData => {
    const { seams } = rowData;

    return seams && seams.length > 0 ? seams.join(', ') : '-';
  };

  const getTableEquipmentsColumnValue = rowData => {
    const { weldingEquipments } = rowData;

    return weldingEquipments && weldingEquipments.length > 0
      ? weldingEquipments.map(equipment => `${equipment.factoryNumber}`)
      : '-';
  };

  const getTableEquipmentsColumnValueView = rowData => {
    const values = getTableEquipmentsColumnValue(rowData);

    return Array.isArray(values)
      ? values.map(value => <div>{value}</div>)
      : values;
  };

  const getTableStatusColumnValue = rowData => {
    const { isDone } = rowData;

    return isDone ? 'Выполнено' : 'В процессе';
  };

  const getTableStatusColumnValueView = rowData => {
    const { isDone } = rowData;

    const value = getTableStatusColumnValue(rowData);

    const className = isDone ? styles.Done : styles.InProcess;

    return <span className={className}>{value}</span>;
  };

  const getColumns = () => {
    const columns = [
      {
        align: 'center',
        title: '№ задания',
        field: 'number',
        width: '10%',
      },
      {
        align: 'center',
        title: 'Порядковый номер изделия',
        field: 'sequenceNumber',
        width: '10%',
      },
      {
        align: 'center',
        title: 'Наименование/номер изделия',
        render: rowData => getTableProductInfoColumnValue(rowData),
        customFilterAndSearch: (term, rowData) => {
          const value = getTableProductInfoColumnValue(rowData);
          return value.toLowerCase().includes(term.toLowerCase());
        },
        customSort: (a, b) => {
          const valueA = getTableProductInfoColumnValue(a);
          const valueB = getTableProductInfoColumnValue(b);
          return valueA.localeCompare(valueB);
        },
        width: '10%',
      },
      {
        align: 'center',
        width: '10%',
        title: 'Дата',
        render: rowData => getTableDateColumnValue(rowData),
        customFilterAndSearch: (term, rowData) => {
          const value = getTableDateColumnValue(rowData);

          return value.toLowerCase().includes(term.toLowerCase());
        },
        customSort: (a, b) => {
          const valueA = getTableDateColumnValue(a);
          const valueB = getTableDateColumnValue(b);
          return valueA.localeCompare(valueB);
        },
      },
      {
        align: 'center',
        title: 'Швы',
        sorting: false,
        render: rowData => getTableSeamsColumnValue(rowData),
        customFilterAndSearch: (term, rowData) => {
          const value = getTableSeamsColumnValue(rowData);

          return value.toLowerCase().includes(term.toLowerCase());
        },
        width: '10%',
      },
      {
        align: 'center',
        width: '10%',
        title: 'Статус',
        render: rowData => getTableStatusColumnValueView(rowData),
        customFilterAndSearch: (term, rowData) => {
          const value = getTableStatusColumnValue(rowData);

          return value.toLowerCase().includes(term.toLowerCase());
        },
        customSort: (a, b) => {
          const valueA = getTableStatusColumnValue(a);
          const valueB = getTableStatusColumnValue(b);
          return valueA.localeCompare(valueB);
        },
      },
      {
        align: 'center',
        width: '10%',
        title: 'Оборудование',
        sorting: false,
        render: rowData => getTableEquipmentsColumnValueView(rowData),
        customFilterAndSearch: (term, rowData) => {
          const value = getTableEquipmentsColumnValue(rowData);

          return (
            Array.isArray(value) &&
            value.join(' ').toLowerCase().includes(term.toLowerCase())
          );
        },
      },
    ];

    const passportsDownloadColumns = [
      {
        align: 'center',
        width: '10%',
        sorting: false,
        title: 'Скачать краткий паспорт',
        render: rowData => (
          <div>
            <IconButton
              onClick={() => {
                getShortProductAccountTaskPassport(rowData.id);
              }}>
              <SaveIcon style={{ color: '#000000' }} />
            </IconButton>
          </div>
        ),
      },
      {
        title: 'Скачать паспорт',
        width: '10%',
        align: 'center',
        sorting: false,
        render: rowData => (
          <div>
            <IconButton
              onClick={() => {
                getFullProductAccountTaskPassport(rowData.id);
              }}>
              <SaveIcon style={{ color: '#000000' }} />
            </IconButton>
          </div>
        ),
      },
    ];

    const assignEquipmentColumn = {
      title: 'Закрепить оборудование',
      width: '10%',
      align: 'center',
      sorting: false,
      render: rowData => (
        <div>
          <IconButton
            onClick={() => {
              setSelectedProductAccountTaskId(rowData.id);
              setIsEditWeldingEquipmentModalOpen(true);
            }}>
            <AddIcon style={{ color: '#000000' }} />
          </IconButton>
        </div>
      ),
    };

    return isMaster(userRole)
      ? [...columns, assignEquipmentColumn, ...passportsDownloadColumns]
      : [...columns, ...passportsDownloadColumns];
  };

  const getActions = userRole => {
    const actions = [
      {
        icon: 'edit',
        tooltip: 'Редактировать',
        onClick: (event, rowData) => {
          setSelectedProductAccountTaskId(rowData.id);
          setIsEditProductAccountTaskModalOpen(true);
        },
      },
    ];

    return isMasterOrInspector(userRole) ? actions : [];
  };

  return (
    <>
      {isLoadingPassport && <LoadingSpinner isFullScreenMode={true} />}

      {productAccountTasks && (
        <Table
          title="Сменные задания на сварку"
          columns={getColumns()}
          data={productAccountTasks}
          isLoading={isLoading}
          actions={getActions(userRole)}
          renderRowChildren={ExpandProductAccountTaskRow}
        />
      )}

      {selectedProductAccountTaskId && (
        <EditProductAccountTaskModal
          isOpen={isEditProductAccountTaskModalOpen}
          toggleModal={setIsEditProductAccountTaskModalOpen}
        />
      )}

      {selectedProductAccountTaskId && (
        <EditProductAccountTaskEquipmentModal
          isOpen={isEditWeldingEquipmentModalOpen}
          toggleModal={setIsEditWeldingEquipmentModalOpen}
        />
      )}
    </>
  );
};
