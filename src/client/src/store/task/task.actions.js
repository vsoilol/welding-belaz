import { createActions } from 'reduxsauce';

const { Types, Creators } = createActions(
  {
    loadTasksRequest: null,
    loadTasksSuccess: ['tasks'],
    loadTasksFailure: ['error'],
    loadTasksCancel: null,

    deleteTaskRequest: ['taskId'],
    deleteTaskSuccess: ['taskId'],
    deleteTaskFailure: ['error'],

    setSelectedTaskId: ['taskId'],

    editTaskRequest: ['id', 'newDate', 'taskStatus'],
    editTaskSuccess: ['id', 'newDate', 'taskStatus'],
    editTaskFailure: ['error'],

    getFullTaskPassportRequest: ['taskId', 'sequenceNumber'],
    getFullTaskPassportSuccess: null,
    getFullTaskPassportFailure: ['error'],

    getShortTaskPassportRequest: [
      'taskId',
      'sequenceNumber',
      'averageIntervalSeconds',
      'secondsToIgnoreBetweenGraphs',
    ],
    getShortTaskPassportSuccess: null,
    getShortTaskPassportFailure: ['error'],
  },
  {}
);

export const taskActionTypes = Types;
export const taskActionCreators = Creators;
