import { useDispatch, useSelector } from "react-redux";
import { useCallback } from "react";
import { welderActionCreators } from "./welder.actions";
import { selectWelder, selectWelderIsLoading } from "./welder.selectors";

export const useWelderStore = () => {
  const dispatch = useDispatch();

  // Selectors
  const welder = useSelector(selectWelder);
  const isLoading = useSelector(selectWelderIsLoading);

  // Actions
  const getWelderById = useCallback(
    (id) => dispatch(welderActionCreators.getWelderByIdRequest(id)),
    [dispatch]
  );

  return {
    welder,
    isLoading,
    getWelderById,
  };
};
