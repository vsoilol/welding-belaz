import { all } from 'redux-saga/effects';

import executorWatchers from 'store/executors/sagas';
import calendarWatchers from 'store/calendar/calendar.watcher';
import authWatchers from 'store/auth/sagas';
import workplaceWatchers from 'store/workplace/sagas';
import texprocweldingWatchers from 'store/texprocwelding/sagas';
import tasksWatchers from 'store/tasks/sagas';
import recordsWatchers from 'store/records/sagas';
import instructionsWatchers from 'store/instructions/sagas';
import equipmentWatchers from 'store/equipment/sagas';
import welderWatchers from 'store/welder/welder.watcher';
import { weldingEquipmentWatchers } from 'store/welding-equipment';

export default function* () {
  const sagas = [
    ...executorWatchers,
    ...calendarWatchers,
    ...authWatchers,
    ...workplaceWatchers,
    ...texprocweldingWatchers,
    ...tasksWatchers,
    ...recordsWatchers,
    ...instructionsWatchers,
    ...equipmentWatchers,
    ...welderWatchers,
    ...weldingEquipmentWatchers,
  ];

  yield all(sagas);
}
