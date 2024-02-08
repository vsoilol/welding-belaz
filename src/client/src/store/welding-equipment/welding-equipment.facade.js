import { useDispatch, useSelector } from 'react-redux';
import { useCallback } from 'react';
import { weldingEquipmentActionCreators } from './welding-equipment.actions';
import {
  selectWeldingEquipment,
  selectWeldingEquipmentIsLoading,
  selectWeldingEquipments,
} from './welding-equipment.selectors';

export const useWeldingEquipmentStore = () => {
  const dispatch = useDispatch();

  // Selectors
  const weldingEquipment = useSelector(selectWeldingEquipment);
  const weldingEquipments = useSelector(selectWeldingEquipments);
  const isLoading = useSelector(selectWeldingEquipmentIsLoading);

  // Actions
  const getWeldingEquipmentById = useCallback(
    id =>
      dispatch(
        weldingEquipmentActionCreators.getWeldingEquipmentByIdRequest(id)
      ),
    [dispatch]
  );

  const getAllWeldingEquipments = useCallback(
    () =>
      dispatch(weldingEquipmentActionCreators.getAllWeldingEquipmentsRequest()),
    [dispatch]
  );

  return {
    weldingEquipment,
    weldingEquipments,
    isLoading,
    getWeldingEquipmentById,
    getAllWeldingEquipments,
  };
};
