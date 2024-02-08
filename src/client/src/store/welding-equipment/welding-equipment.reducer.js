import { createReducer } from 'reduxsauce';

import { weldingEquipmentActionTypes } from './welding-equipment.actions';

const WELDING_EQUIPMENT_INITIAL_STATE = {
  isLoading: true,
  error: null,
  weldingEquipment: null,
  weldingEquipments: null,
};

const startLoading = (state = WELDING_EQUIPMENT_INITIAL_STATE) => {
  return {
    ...state,
    isLoading: true,
    error: null,
  };
};

const loadingFailure = (state = WELDING_EQUIPMENT_INITIAL_STATE, { error }) => {
  return {
    ...state,
    isLoading: false,
    error,
  };
};

export const updateStateWithLoadedWeldingEquipment = (
  state = WELDING_EQUIPMENT_INITIAL_STATE,
  { weldingEquipment }
) => {
  return {
    ...state,
    isLoading: false,
    weldingEquipment,
  };
};

const handleLoadWeldingEquipmentsSuccess = (
  state = WELDING_EQUIPMENT_INITIAL_STATE,
  { weldingEquipments }
) => ({
  ...state,
  weldingEquipments,
  isLoading: false,
});

export const HANDLERS = {
  [weldingEquipmentActionTypes.GET_WELDING_EQUIPMENT_BY_ID_REQUEST]:
    startLoading,
  [weldingEquipmentActionTypes.GET_WELDING_EQUIPMENT_BY_ID_SUCCESS]:
    updateStateWithLoadedWeldingEquipment,
  [weldingEquipmentActionTypes.GET_WELDING_EQUIPMENT_BY_ID_FAILURE]:
    loadingFailure,

  [weldingEquipmentActionTypes.GET_ALL_WELDING_EQUIPMENTS_REQUEST]:
    startLoading,
  [weldingEquipmentActionTypes.GET_ALL_WELDING_EQUIPMENTS_SUCCESS]:
    handleLoadWeldingEquipmentsSuccess,
  [weldingEquipmentActionTypes.GET_ALL_WELDING_EQUIPMENTS_FAILURE]:
    loadingFailure,
};

export default createReducer(WELDING_EQUIPMENT_INITIAL_STATE, HANDLERS);
