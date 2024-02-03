export const weldingTaskStatus = {
  notStarted: 1,
  executionAccepted: 2, // Принят к исполнению
  completed: 3,
};

export const weldingTaskStatusText = {
  [weldingTaskStatus.notStarted]: 'Не начато',
  [weldingTaskStatus.executionAccepted]: 'Принято к исполнению',
  [weldingTaskStatus.completed]: 'Завершено',
};
