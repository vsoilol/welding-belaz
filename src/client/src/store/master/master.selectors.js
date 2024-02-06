export const selectIsLoading = state => state.master.isLoading;

export const selectMasters = state => state.master.masters;

export const selectMasterById = (state, masterId) =>
  state.master.masters.find(master => master.id === masterId);

export const selectSelectedMaster = state =>
  state.master.masters.find(
    master => master.id === state.master.selectedMasterId
  );

export const selectSelectedMasterId = state => state.master.selectedMasterId;
