import { useDispatch, useSelector } from 'react-redux';
import { useCallback, useMemo } from 'react';
import { taskActionCreators } from 'store/task';
import {
  selectTaskById,
  selectTasks,
  selectTasksIsLoading,
  selectSelectedTask,
  selectSelectedTaskId,
  selectIsLoadingPassport,
} from './task.selectors';

export const useTaskById = taskId => {
  const taskSelector = useMemo(
    () => state => selectTaskById(state, taskId),
    [taskId]
  );

  const task = useSelector(taskSelector);
  return task;
};

export const useTaskStore = () => {
  const dispatch = useDispatch();

  // Selectors
  const tasks = useSelector(selectTasks);
  const isLoading = useSelector(selectTasksIsLoading);
  const selectedTask = useSelector(selectSelectedTask);
  const selectedTaskId = useSelector(selectSelectedTaskId);
  const isLoadingPassport = useSelector(selectIsLoadingPassport);

  // Actions
  const loadTasks = useCallback(
    () => dispatch(taskActionCreators.loadTasksRequest()),
    [dispatch]
  );

  const deleteTask = useCallback(
    taskId => dispatch(taskActionCreators.deleteTaskRequest(taskId)),
    [dispatch]
  );

  const cancelLoadTask = useCallback(
    () => dispatch(taskActionCreators.loadTasksCancel()),
    [dispatch]
  );

  const setSelectedTaskId = useCallback(
    taskId => dispatch(taskActionCreators.setSelectedTaskId(taskId)),
    [dispatch]
  );

  const editTask = useCallback(
    (id, newDate, taskStatus) =>
      dispatch(taskActionCreators.editTaskRequest(id, newDate, taskStatus)),
    [dispatch]
  );

  const getFullTaskPassport = useCallback(
    (taskId, sequenceNumber) =>
      dispatch(
        taskActionCreators.getFullTaskPassportRequest(taskId, sequenceNumber)
      ),
    [dispatch]
  );

  const getShortTaskPassport = useCallback(
    (
      taskId,
      sequenceNumber,
      averageIntervalSeconds = null,
      secondsToIgnoreBetweenGraphs = null
    ) =>
      dispatch(
        taskActionCreators.getShortTaskPassportRequest(
          taskId,
          sequenceNumber,
          averageIntervalSeconds,
          secondsToIgnoreBetweenGraphs
        )
      ),
    [dispatch]
  );

  return {
    tasks,
    isLoading,
    isLoadingPassport,
    selectedTask,
    selectedTaskId,
    loadTasks,
    deleteTask,
    editTask,
    cancelLoadTask,
    setSelectedTaskId,
    getFullTaskPassport,
    getShortTaskPassport,
  };
};
