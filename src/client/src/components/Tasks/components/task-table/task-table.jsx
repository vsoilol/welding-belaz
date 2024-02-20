import React from 'react';

import IconButton from '@material-ui/core/IconButton';
import SaveIcon from '@material-ui/icons/Save';
import DeleteIcon from '@material-ui/icons/Delete';

import { Table } from 'components/shared/Table';
import { ExpandTaskRow } from './expand-task-row';

import { useTaskStore } from 'store/task';
import { useAuthStore } from 'store/auth';
import { weldingTaskStatus, weldingTaskStatusText } from 'core/constants';
import { userRoles } from 'core/constants';

import styles from 'components/Tasks/styles.module.scss';

const statusStyles = {
  [weldingTaskStatus.notStarted]: styles.NotStarted,
  [weldingTaskStatus.executionAccepted]: styles.InProcess,
  [weldingTaskStatus.completed]: styles.Done,
};

export const TaskTable = ({
  handleToggleDeleteTaskModal,
  handleToggleShortPassportModal,
  handleToggleFullPassportModal,
  handleToggleEditTaskModal,
}) => {
  const { userRole } = useAuthStore();
  const { isLoading, tasks, setSelectedTaskId } = useTaskStore();

  const getActions = userRole => {
    // Define actions for 'Admin' or 'Master' roles
    const adminOrMasterActions = [
      {
        icon: 'edit',
        tooltip: 'Редактировать',
        onClick: (event, rowData) => {
          setSelectedTaskId(rowData.id);
          handleToggleEditTaskModal(true);
        },
      },
    ];

    // Return actions based on the user role
    return userRole === userRoles.admin || userRole === userRoles.master
      ? adminOrMasterActions
      : [];
  };

  const getColumns = () => {
    const columns = [
      {
        title: '№ задания',
        field: 'number',
        align: 'center',
      },
      {
        title: 'Номер шва',
        field: 'seamNumber',
        align: 'center',
      },
      {
        title: 'Количество швов',
        field: 'manufacturedAmount',
        align: 'center',
      },
      {
        title: 'Дата ',
        field: 'weldingDate',
        align: 'center',
      },
      {
        title: 'Статус',
        field: 'status',
        align: 'center',
        render: rowData => {
          const className = statusStyles[rowData?.status] || null;
          const text = weldingTaskStatusText[rowData?.status] || '-';

          return className ? (
            <span className={className}>{text}</span>
          ) : (
            <p>{text}</p>
          );
        },
        customFilterAndSearch: (term, rowData) => {
          const statusString = weldingTaskStatusText[rowData?.status];
          return statusString.toLowerCase().includes(term.toLowerCase());
        },
      },
      {
        field: 'url',
        align: 'center',
        sorting: false,
        title: 'Скачать краткий паспорт',
        render: rowData => (
          <div>
            <IconButton
              onClick={() => {
                handleToggleShortPassportModal(true);
                setSelectedTaskId(rowData?.id);
              }}>
              <SaveIcon style={{ color: '#000000' }} />
            </IconButton>
          </div>
        ),
        width: 20,
      },
      {
        field: 'url',
        title: 'Скачать паспорт',
        align: 'center',
        sorting: false,
        render: rowData => (
          <div>
            <IconButton
              onClick={() => {
                handleToggleFullPassportModal(true);
                setSelectedTaskId(rowData?.id);
              }}>
              <SaveIcon style={{ color: '#000000' }} />
            </IconButton>
          </div>
        ),
        width: 20,
      },
    ];

    const deleteTaskColumn = {
      title: 'Удаление',
      align: 'center',
      width: 20,
      sorting: false,
      render: rowData => (
        <IconButton
          aria-label="delete"
          onClick={() => {
            handleToggleDeleteTaskModal(true);
            setSelectedTaskId(rowData?.id);
          }}>
          <DeleteIcon style={{ color: '#000000' }} />
        </IconButton>
      ),
    };

    return userRole === userRoles.admin || userRole === userRoles.master
      ? [deleteTaskColumn, ...columns]
      : columns;
  };

  return (
    <>
      {tasks && (
        <Table
          title="Сменные задания на сварку"
          columns={getColumns()}
          data={tasks}
          isLoading={isLoading}
          actions={getActions(userRole)}
          renderRowChildren={ExpandTaskRow}
        />
      )}
    </>
  );
};
