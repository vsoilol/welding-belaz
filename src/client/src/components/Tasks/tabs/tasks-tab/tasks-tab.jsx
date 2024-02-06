import React, { useEffect, useState } from 'react';

import { useTaskStore } from 'store/task';

import { Button, ModalWindow, LoadingSpinner } from 'components/shared';
import { EditTaskModal, GetSeamPassportModal } from 'components/Tasks/modals';
import { TaskTable } from 'components/Tasks/components';

import styles from 'components/Tasks/styles.module.scss';

export const TasksTab = () => {
  const {
    loadTasks,
    isLoadingPassport,
    cancelLoadTask,
    selectedTaskId,
    deleteTask,
  } = useTaskStore();

  const [isDeleteTaskModalOpen, setIsDeleteTaskModalOpen] = useState(false);
  const [isShortPassportModalOpen, setIsShortPassportModalOpen] =
    useState(false);
  const [isFullPassportModalOpen, setIsFullPassportModalOpen] = useState(false);
  const [isEditTaskModalOpen, setIsEditTaskModalOpen] = useState(false);

  useEffect(() => {
    loadTasks();
    return () => cancelLoadTask();
  }, [loadTasks, cancelLoadTask]);

  return (
    <>
      {isLoadingPassport && <LoadingSpinner isFullScreenMode={true} />}

      <TaskTable
        handleToggleDeleteTaskModal={setIsDeleteTaskModalOpen}
        handleToggleShortPassportModal={setIsShortPassportModalOpen}
        handleToggleFullPassportModal={setIsFullPassportModalOpen}
        handleToggleEditTaskModal={setIsEditTaskModalOpen}
      />

      <ModalWindow
        isOpen={isDeleteTaskModalOpen}
        headerText="Удаление"
        setIsOpen={() => {
          setIsDeleteTaskModalOpen(false);
        }}
        wrapperStyles={{ width: 420 }}>
        <div>
          <h4 style={{ padding: '35px 40px' }}>
            Вы уверены что хотите <span>удалить</span> данное задание ?{' '}
          </h4>

          <div
            className={styles.row}
            onClick={() => {
              setIsDeleteTaskModalOpen(false);
              deleteTask(selectedTaskId);
            }}>
            <Button type="submit">Удалить</Button>
          </div>
        </div>
      </ModalWindow>

      {selectedTaskId && (
        <EditTaskModal
          isOpen={isEditTaskModalOpen}
          toggleModal={setIsEditTaskModalOpen}
        />
      )}

      {selectedTaskId && (
        <GetSeamPassportModal
          isFullPassport={false}
          isOpen={isShortPassportModalOpen}
          toggleModal={setIsShortPassportModalOpen}
        />
      )}

      {selectedTaskId && (
        <GetSeamPassportModal
          isFullPassport={true}
          isOpen={isFullPassportModalOpen}
          toggleModal={setIsFullPassportModalOpen}
        />
      )}
    </>
  );
};
