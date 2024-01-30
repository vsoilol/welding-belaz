import React, { useState } from "react";

import { ModalWindow, CustomSelect } from "components/shared";
import {
  AddWorkingShiftForm,
  DeleteWorkingShiftForm,
  UpdateWorkingShiftForm,
} from "./forms";

import styles from "../modal-style.module.scss";

export const EditWorkingShiftModal = ({ isOpen, toggleModal }) => {
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
          <AddWorkingShiftForm toggleModal={toggleModal} />
        )}

        {selectedOption === 2 && (
          <DeleteWorkingShiftForm toggleModal={toggleModal} />
        )}

        {selectedOption === 3 && (
          <UpdateWorkingShiftForm toggleModal={toggleModal} />
        )}
      </div>
    </ModalWindow>
  );
};
