import React, { useState, useMemo, useEffect } from "react";
import { Formik, Form } from "formik";
import Select from "react-select";

import {
  Button,
  ModalWindow,
  CustomFormikSelect,
  CustomFormikTextInput,
  CustomFormikField,
  CustomSelect,
} from "components/shared";
import {
  AddWorkingShiftForm,
  DeleteWorkingShiftForm,
  UpdateWorkingShiftForm,
} from "./forms";

import styles from "../modal-style.module.scss";

export const EditWorkingShiftModal = ({
  isOpen,
  toggleModal,
  workingShifts,
  calendarId,
  createWorkingShift,
  deleteWorkingShift,
  updateWorkingShift,
}) => {
  const [selectedOption, setSelectedOption] = useState(0);

  const workingShiftOptions = [
    { value: 1, label: "Добавить смену" },
    { value: 2, label: "Удалить смену" },
    { value: 3, label: "Редактировать смену" },
  ];

  return (
    <ModalWindow
      isOpen={isOpen}
      headerText="Редактировать рабочую смену"
      setIsOpen={(state) => {
        toggleModal(state);
      }}
      wrapperStyles={{ width: 420 }}
    >
      <div className={styles.wrapper}>
        <div className={styles.selectOptionLabel}>
          <span>Выберите действие</span>
        </div>

        <CustomSelect
          width="380px"
          placeholder="Действие"
          onChange={(event) => {
            setSelectedOption(event.value);
          }}
          options={workingShiftOptions}
        />

        {selectedOption === 1 && (
          <AddWorkingShiftForm
            calendarId={calendarId}
            toggleModal={toggleModal}
            createWorkingShift={createWorkingShift}
          />
        )}

        {selectedOption === 2 && (
          <DeleteWorkingShiftForm
            workingShifts={workingShifts}
            toggleModal={toggleModal}
            deleteWorkingShift={deleteWorkingShift}
          />
        )}

        {selectedOption === 3 && (
          <UpdateWorkingShiftForm
            workingShifts={workingShifts}
            toggleModal={toggleModal}
            updateWorkingShift={updateWorkingShift}
          />
        )}
      </div>
    </ModalWindow>
  );
};
