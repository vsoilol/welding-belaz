import * as sagas from './sagas';

const watchers = [...sagas.getFilteredRecordsWatchers];

export default watchers;
