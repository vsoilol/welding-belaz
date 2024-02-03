import * as sagas from './sagas';

const watchers = [
  ...sagas.loadTasksWatchers,
  ...sagas.deleteTaskWatchers,
  ...sagas.editTaskWatchers,
  ...sagas.getFullTaskPassportWatchers,
  ...sagas.getShortTaskPassportWatchers,
];

export default watchers;
