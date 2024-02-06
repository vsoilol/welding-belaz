import * as sagas from './sagas';

const watchers = [
  ...sagas.loadAllDatesByProductionAreaIdWatchers,
  ...sagas.loadProductAccountByDateWatchers,
  ...sagas.generateTasksWatchers,
  ...sagas.generateProductAccountsEmptyWatchers,
  ...sagas.deleteProductAccountWatchers,
  ...sagas.editProductAccountWatchers,
  ...sagas.uploadProductAccountFileWatchers,
  ...sagas.getProductAccountReportWatchers,
];

export default watchers;
