import { createActions } from 'reduxsauce';

const { Types, Creators } = createActions(
  {
    getWeldingEquipmentByIdRequest: ['id'],
    getWeldingEquipmentByIdSuccess: ['weldingEquipment'],
    getWeldingEquipmentByIdFailure: ['error'],
  },
  {}
);

export const weldingEquipmentActionTypes = Types;
export const weldingEquipmentActionCreators = Creators;
