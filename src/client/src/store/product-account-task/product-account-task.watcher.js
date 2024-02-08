import * as sagas from './sagas';

const watchers = [
  ...sagas.loadProductAccountTasksWatchers,
  ...sagas.assignWeldingEquipmentsWatchers,
  ...sagas.changeDefectiveAmountWatchers,
  ...sagas.changeEndWeldingDateWatchers,
  ...sagas.changeManufacturedAmountWatchers,
  ...sagas.editProductAccountTaskWatchers,
  ...sagas.updateWeldingMaterialInfoWatchers,
  ...sagas.getFullProductAccountTaskPassportWatchers,
  ...sagas.getShortProductAccountTaskPassportWatchers,
];

export default watchers;
