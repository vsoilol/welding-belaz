export const selectTasksIsLoading = state => state.task.isLoading;

export const selectIsLoadingPassport = state => state.task.isLoadingPassport;

export const selectTasks = state => state.task.tasks;

export const selectTaskById = (state, taskId) =>
  state.task.tasks.find(task => task.id === taskId);

export const selectSelectedTask = state =>
  state.task.tasks.find(task => task.id === state.task.selectedTaskId);

export const selectSelectedTaskId = state => state.task.selectedTaskId;
