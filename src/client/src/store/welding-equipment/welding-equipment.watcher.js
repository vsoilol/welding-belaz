import * as sagas from './sagas';

const watchers = [
  ...sagas.getWeldingEquipmentByIdWatchers,
  ...sagas.getAllWeldingEquipmentsWatchers,
];

export default watchers;
