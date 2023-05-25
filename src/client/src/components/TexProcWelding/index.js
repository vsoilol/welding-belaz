import Paper from "@material-ui/core/Paper";
import MaterialTable from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import SaveIcon from "@material-ui/icons/Save";
import { TechProcWeldImage } from "assets/pics";
import Button from "components/shared/Button";
import EquipmentMap from "components/Map";
import Modal from "components/shared/Modal";
import Input from "components/shared/Input";
import ModalWindow from "components/shared/ModalWindow";
import { ResultsModal } from "components/shared/ResultsModal";
import Select from "components/shared/Select";
import { Table } from "components/shared/Table";
import ToolTip from "components/shared/ToolTip";
import { Formik } from "formik";
import React, { useEffect, useState, useCallback } from "react";
import styles from "./styles.module.css";

import deleteIcon from "assets/icons/delete.png";
import api from "services/api";
import {Upload} from "components/Upload/index";
import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";


const dateOptions = {
  day: "numeric",
  month: "short",
  year: "numeric",
};

export const TexProcWelding = ({
  loadMasters,
  loadTexprocwelding,
  loadInstructions,
  loadSeam,
  addInst,
  editInst,


  equipment,
  deleteEquipment,
  isRequesting,
  masters,
  userRole,


  texprocwelding,
  instructions,

  seam,



}) => {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [isModalpProcOpen, setisModalpProcOpen] = useState(false);
  const [isModalOpenNumb, setIsModalOpenNumb] = useState(0);

  const [modalData, setModalData] = useState(null);
  const [modalDataNumb, setmodalDataNumb] = useState(0);
  const [isResultsModalOpen, setIsResultsModalOpen] = useState(false);
  const [activeEquipment, setActiveEquipment] = useState("");
  const [open, setOpen] = useState(false);

  const [valuetSeam, setValuetSeam] = useState(0);
  const [valuetVkladka, setValuetVkladka] = useState(0);


  const [idPassages, setidPassages] = useState(0);


  const initialValues = {
    id: modalData?.weldPassageInstructions?.id ?? "",
    name: modalData?.name ?? "",
    number: modalData?.number ?? "",
    weldPassagesName: modalData?.weldPassageInstructions?.[0]?.name ?? "",
    weldPassagesNumber: modalData?.weldPassageInstructions?.[0]?.number ?? "",
    weldingCurrentMin: modalData?.weldPassageInstructions?.[0]?.weldingCurrentMin ?? "",
    weldingCurrentMax: modalData?.weldPassageInstructions?.[0]?.weldingCurrentMax ?? "",
    arcVoltageMin: modalData?.weldPassageInstructions?.[0]?.arcVoltageMin ?? "",
    arcVoltageMax: modalData?.weldPassageInstructions?.[0]?.arcVoltageMax ?? "",
    preheatingTemperatureMin: modalData?.weldPassageInstructions?.[0]?.preheatingTemperatureMin ?? "",
    preheatingTemperatureMax: modalData?.weldPassageInstructions?.[0]?.preheatingTemperatureMax ?? "",
    weldPassagesId: modalData?.weldPassageInstructions?.[0]?.id ?? "",
    pdmSystemFileLink: modalData?.pdmSystemFileLink ?? ""
  };

  const formattedMasters = masters?.map((item) => {
    return {
      value: item.masterId,
      label: `${item.surname} ${item.name}`,
    };
  });

  useEffect(() => {
    loadTexprocwelding();
    loadInstructions();
    loadSeam();
  }, [
    loadMasters,
    loadTexprocwelding,
    loadInstructions,
    loadSeam
  ]);




  ////////////////////////////////////////////////////////////////////
  const [deleteTaskModal, setdeleteTaskModal] = useState(false);
  const [deleteProcModal, setdeleteProcModal] = useState(false);
  const [idProc, setidProc] = useState("");
  const [idInstr, setidInstr] = useState("");
  const columns = [
    (userRole === "Admin" || userRole === "Master") && {
      title: "Удаление",
      render: (rowData) => (
        <img
          className={styles.deleteIcon}
          src={deleteIcon}
          onClick={() => {
            setdeleteProcModal(true);
            setidProc(rowData?.id)
          }}
        />
      ),
    },
    {
      title: "Наименование", field: "name",
    },
    {
      title: "Номер технологического процесса", field: "number",
    },
    {
      title: "Ссылка на PDF-файл ",
      render: (rowData) => (
        <a href={rowData?.pdmSystemFileLink} target="_blank">
          {rowData?.pdmSystemFileLink ?? "-"}
        </a>
      ),
    },
    // {
    //   title: "Изделие", field: "technologicalInstructions[0].seam.product.name",
    // },
    // {
    //   title: "Сборочные узлы",
    //   // render: (rowData) => { 
    //   //   console.log(rowData)
    //   //   return ( 
    //   //     <span>Сборочный узел {rowData?.technologicalInstructions[0]?.seam?.number}</span>
    //   //   );
    //   // } 
    // },
    // {
    //   title: "Детали", field: "technologicalInstructions[0].seam.product.name",
    // },
    // {
    //   title: "Швы", field: "technologicalInstructions[0].seam.product.productType",
    // },
    // {
    //   title: "Диапазоны допустимых значений контролируемых параметров (сварочный ток, напряжение на дуге)",
    //   // render: (rowData) => (
    //   //   <span>
    //   //     {rowData?.technologicalInstructions[0]?.weldPassageInstructions[0]?.arcVoltageMin} 
    //   //     - {rowData?.technologicalInstructions[0]?.weldPassageInstructions[0]?.arcVoltageMax}
    //   //     </span>
    //   // ),
    // },
    // {
    //   title: "Размеры шва", field: "technologicalInstructions[0].seam.product.productType",
    // },
    // {
    //   title: "Количество проходов", field: "technologicalInstructions[0].seam.product.productType",
    // },
  ].filter(column => column)
  const colinstructions = [
    (userRole === "Admin" || userRole === "Master") && {
      title: "Удаление",
      render: (rowData) => (
        <img
          className={styles.deleteIcon}
          src={deleteIcon}
          onClick={() => {
            setdeleteTaskModal(true);
            setidInstr(rowData?.id)
          }}
        />
      ),
    },
    {
      title: "Наименование", field: "name",
    },
    {
      title: "Номер технологического процесса", field: "number",
    },
    {
      title: "Шов",
      render: (rowData) => {
        if (rowData?.seams[0]?.number) {
          return (
            <span>
              Cварочный шов {rowData?.seams[0]?.number}
            </span>
          )
        }
        else {
          return (
            <span>
              -
            </span>
          )
        }
      }
    },
    {
      title: "Наименование прохода",
      field: "weldPassageInstructions[0].name",
    },
    {
      title: "Сварочный ток",
      render: (rowData) => {
        return (
          <p>
            {`${rowData?.weldPassageInstructions[0]?.weldingCurrentMin} - ${rowData?.weldPassageInstructions[0]?.weldingCurrentMax}`}
          </p>
        );
      },
    },
    {
      title: "Напряжение дуги  ",
      render: (rowData) => {
        return (
          <p>
            {`${rowData?.weldPassageInstructions[0]?.arcVoltageMin} - ${rowData?.weldPassageInstructions[0]?.arcVoltageMax}`}
          </p>
        );
      },
    },
    {
      title: "Температура предварительного нагрева",
      render: (rowData) => (
        <p>
          {rowData?.weldPassageInstructions[0]?.preheatingTemperatureMin != null && rowData?.weldPassageInstructions[0]?.preheatingTemperatureMax != null
            ? `${rowData.weldPassageInstructions[0].preheatingTemperatureMin} - ${rowData.weldPassageInstructions[0].preheatingTemperatureMax}`
            : '-'}
        </p>
      ),
    }
  ].filter(column => column)
  const renderRowChildren = (rowData) => {
    return (
      rowData?.weldPassageInstructions?.length > 0 && (
        <TableContainer component={Paper}>
          <MaterialTable aria-label="simple table">
            <TableHead>
              <TableRow>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                >
                  № прохода
                </TableCell>

                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                >
                  Наименование прохода
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                  colSpan={2}
                >
                  Температура предварительного нагрева, °С
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                  colSpan={2}
                >
                  Сварочный ток, А
                </TableCell>

                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="right"
                >
                  Напряжение на дуге, В
                </TableCell>
              </TableRow>
              <TableRow>
                <TableCell />
                <TableCell />
                <TableCell align="center">min</TableCell>
                <TableCell align="center">max</TableCell>
                <TableCell align="center">min</TableCell>
                <TableCell align="center">max</TableCell>

                <TableCell align="center">min</TableCell>
                <TableCell align="left">max</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {rowData.weldPassageInstructions.map((passage) => (
                <TableRow key={passage.id}>
                  <TableCell align="center" component="th" scope="row">
                    {passage.number ?? "-"}
                  </TableCell>

                  <TableCell align="center" component="th" scope="row">
                    {passage.name ?? "-"}
                  </TableCell>

                  <TableCell align="center" component="th" scope="row">
                    {passage.preheatingTemperatureMin ?? "-"}
                  </TableCell>
                  <TableCell align="center" component="th" scope="row">
                    {passage.preheatingTemperatureMax ?? "-"}
                  </TableCell>

                  <TableCell align="center" component="th" scope="row">
                    {passage.weldingCurrentMin ?? "-"}
                  </TableCell>
                  <TableCell align="center" component="th" scope="row">
                    {passage.weldingCurrentMax ?? "-"}
                  </TableCell>

                  <TableCell align="center" component="th" scope="row">
                    {passage.arcVoltageMin ?? "-"}
                  </TableCell>
                  <TableCell align="left" component="th" scope="row">
                    {passage.arcVoltageMax ?? "-"}
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </MaterialTable>
        </TableContainer>
      )
    );
  };

  //select Сварочный шов  
  const SeamOptions = seam?.map((item) => {
    return {
      value: item.id,
      label: `Cварочный шов ${item.number}`,
    };
  });

  //Номера технологического процесса   
  const TexProcOptions = texprocwelding?.map((item) => {
    return {
      value: item.id,
      label: item.number,
    };
  });

  const requiredKeys = ["name", "nextInspectionDate"];

  const handleOpen = () => {
    setOpen(true);
  };




  const [value_panel, setValue] = useState(0);
  const [valueTexProcOptions, setvalueTexProcOptions] = useState(0);
  const [valueNameInst, setvalueNameInst] = useState("");
  const ChangePanels = (event, newValue) => {
    setValue(newValue);
  };
  const TabPanel = (props_panel) => {
    const { children, value, indPanel } = props_panel;

    return (
      <div hidden={value !== indPanel}  >
        {children}
      </div>
    );
  };

  //Запрос на редактирование или добавление
  function SendData(variables) {
    const filteredVariables = variables.filter(item => {
      return Object.values(item).some(val => val !== '');
    });

    if (isModalOpenNumb === 0) {
      const data = {
        number: seam.find(obj => obj.id === valuetSeam)?.technologicalInstruction?.number,
        name: valueNameInst,
        weldPassages: filteredVariables.map(item => ({
          name: item.weldPassagesName,
          number: item.weldPassagesNumber,
          weldingCurrentMin: item.weldingCurrentMin,
          weldingCurrentMax: item.weldingCurrentMax,
          arcVoltageMin: item.arcVoltageMin,
          arcVoltageMax: item.arcVoltageMax,
          preheatingTemperatureMin: item.preheatingTemperatureMin,
          preheatingTemperatureMax: item.preheatingTemperatureMax,
        })),
      };
      addInst(data);
    }
    if (isModalOpenNumb === 1) {
      const data = {
        id: idPassages,
        number: seam.find(obj => obj.id === valuetSeam)?.technologicalInstruction?.number,
        name: valueNameInst,
        weldPassages: filteredVariables.map(item => ({
          id: item.id || null,
          name: item.weldPassagesName,
          number: item.weldPassagesNumber,
          weldingCurrentMin: item.weldingCurrentMin,
          weldingCurrentMax: item.weldingCurrentMax,
          arcVoltageMin: item.arcVoltageMin,
          arcVoltageMax: item.arcVoltageMax,
          preheatingTemperatureMin: item.preheatingTemperatureMin,
          preheatingTemperatureMax: item.preheatingTemperatureMax,
        })),
      };
      editInst(data)
    }
  }



  function WeldingInputs() {
    const [passages, setPassages] = useState([
      {
        weldPassagesName: modalData?.weldPassageInstructions?.[0]?.name ?? "",
        weldPassagesNumber: modalData?.weldPassageInstructions?.[0]?.number ?? "",
        weldingCurrentMin: modalData?.weldPassageInstructions?.[0]?.weldingCurrentMin ?? "",
        weldingCurrentMax: modalData?.weldPassageInstructions?.[0]?.weldingCurrentMax ?? "",
        arcVoltageMin: modalData?.weldPassageInstructions?.[0]?.arcVoltageMin ?? "",
        arcVoltageMax: modalData?.weldPassageInstructions?.[0]?.arcVoltageMax ?? "",
        preheatingTemperatureMin: modalData?.weldPassageInstructions?.[0]?.preheatingTemperatureMin ?? "",
        preheatingTemperatureMax: modalData?.weldPassageInstructions?.[0]?.preheatingTemperatureMax ?? "",
      },
    ]);
    const addPassage = () => {
      setPassages([
        ...passages,
        {
          weldPassagesName: modalData?.weldPassageInstructions?.[0]?.name ?? "",
          weldPassagesNumber: modalData?.weldPassageInstructions?.[0]?.number ?? "",
          weldingCurrentMin: modalData?.weldPassageInstructions?.[0]?.weldingCurrentMin ?? "",
          weldingCurrentMax: modalData?.weldPassageInstructions?.[0]?.weldingCurrentMax ?? "",
          arcVoltageMin: modalData?.weldPassageInstructions?.[0]?.arcVoltageMin ?? "",
          arcVoltageMax: modalData?.weldPassageInstructions?.[0]?.arcVoltageMax ?? "",
          preheatingTemperatureMin: modalData?.weldPassageInstructions?.[0]?.preheatingTemperatureMin ?? "",
          preheatingTemperatureMax: modalData?.weldPassageInstructions?.[0]?.preheatingTemperatureMax ?? "",
        },
      ]);
    };
    const removePassage = (index) => {
      const newPassages = [...passages];
      newPassages.splice(index, 1);
      setPassages(newPassages);
    };
    const handleChange = (name, value, index) => {
      const updatedPassages = [...passages];
      updatedPassages[index][name] = value;
      setPassages(updatedPassages);
    };
    return (
      <>
        {passages.map((passage, index) => (
          <div>
            <p>Информация для прохода</p>
            <div className={styles.row}>
              <Input
                onChange={(e) => {
                  if (/^[а-яА-ЯЁё0-9\s]*$/.test(e.target.value)) {
                    handleChange(e.target.name, e.target.value, index);
                  }
                }}
                style={{ width: 380, height: 40, padding: "0 20px 0 30px" }}
                value={passage.weldPassagesName}
                name="weldPassagesName"
                placeholder="Наименование прохода"
                autoComplete="off"
              />
            </div>
            <div className={styles.row}>
              <Input
                onChange={(e) => {
                  handleChange(e.target.name, e.target.value, index);
                }}
                style={{ width: 380, height: 40, padding: "0 20px 0 30px" }}
                value={passage.weldPassagesNumber}
                type="number"
                min="0"
                step="1"
                name="weldPassagesNumber"
                placeholder="Номер прохода"
                autoComplete="off"
              />
            </div>
            <div className={styles.row}>
              <Input
                onChange={(e) => {
                  handleChange(e.target.name, e.target.value, index);
                }}
                width="200"
                style={{ height: 40, padding: "0 20px 0 30px" }}
                value={passage.weldingCurrentMin}
                name="weldingCurrentMin"
                placeholder="Сварочный ток min"
                type="number"
                min="0"
                step="1"
                autoComplete="off"
              />

              <Input
                onChange={(e) => {
                  handleChange(e.target.name, e.target.value, index);
                }}
                width="200"
                style={{ height: 40, padding: "0 20px 0 30px" }}
                value={passage.weldingCurrentMax}
                name="weldingCurrentMax"
                type="number"
                min="0"
                step="1"
                placeholder="Сварочный ток max"
                autoComplete="off"
              />
            </div>
            <div className={styles.row}>
              <Input
                onChange={(e) => {
                  handleChange(e.target.name, e.target.value, index);
                }}
                width="200"
                style={{ height: 40, padding: "0 20px 0 30px" }}
                value={passage.arcVoltageMin}
                name="arcVoltageMin"
                placeholder="Напряжение дуги min"
                type="number"
                min="0"
                step="1"
                autoComplete="off"
              />

              <Input
                onChange={(e) => {
                  handleChange(e.target.name, e.target.value, index);
                }}
                width="200"
                style={{ height: 40, padding: "0 20px 0 30px" }}
                value={passage.arcVoltageMax}
                name="arcVoltageMax"
                placeholder="Напряжение дуги max"
                type="number"
                min="0"
                step="1"
                autoComplete="off"
              />
            </div>
            <div className={styles.row}>
              <Input
                onChange={(e) => {
                  handleChange(e.target.name, e.target.value, index);
                }}
                width="200"
                style={{ height: 40, padding: "0 20px 0 30px" }}
                value={passage.preheatingTemperatureMin}
                name="preheatingTemperatureMin"
                placeholder="Температура предварительного нагрева min"
                autoComplete="off"
                type="number"
                min="0"
                step="1"
              />

              <Input
                onChange={(e) => {
                  handleChange(e.target.name, e.target.value, index);
                }}
                width="200"
                style={{ height: 40, padding: "0 20px 0 30px" }}
                value={passage.preheatingTemperatureMax}
                name="preheatingTemperatureMax"
                placeholder="Температура предварительного нагрева max"
                autoComplete="off"
                type="number"
                min="0"
                step="1"
              />
            </div>
            {index !== 0 && (
              <Button className={styles.remowePassages} onClick={() => removePassage(index)}>
                Убрать проход
              </Button>
            )}
          </div>
        ))}
        <div className={styles.row}>
          <Button onClick={addPassage}>Добавить проход</Button>
        </div>
        <div className={styles.row}>
          <Button
            type="submit"
            onClick={() => SendData(passages)}
          >
            {modalData ? "Сохранить" : "Создать"}
          </Button>
        </div>
      </>
    )
  }

  const [passagesCnange, setpassagesCnange] = useState([]);
  function CnangeWeldingInputs() {

    const [passages, setPassages] = useState(passagesCnange.map(item => ({
      id: item.id,
      weldPassagesName: item.name,
      weldPassagesNumber: item.number,
      weldingCurrentMin: item.weldingCurrentMin,
      weldingCurrentMax: item.weldingCurrentMax,
      arcVoltageMin: item.arcVoltageMin,
      arcVoltageMax: item.arcVoltageMax,
      preheatingTemperatureMin: item.preheatingTemperatureMin,
      preheatingTemperatureMax: item.preheatingTemperatureMax,
    })));

    const addPassage = () => {
      setPassages([
        ...passages,
        {
          id: "",
          weldPassagesName: "",
          weldPassagesNumber: "",
          weldingCurrentMin: "",
          weldingCurrentMax: "",
          arcVoltageMin: "",
          arcVoltageMax: "",
          preheatingTemperatureMin: "",
          preheatingTemperatureMax: "",
        },
      ]);
    };
    const removePassage = (index) => {
      const newPassages = [...passages];
      newPassages.splice(index, 1);
      setPassages(newPassages);
    };
    const handleChange = (name, value, index) => {
      const updatedPassages = [...passages];
      updatedPassages[index][name] = value;
      setPassages(updatedPassages);
    };
    return (
      <>
        {passages.map((passage, index) => (
          <div>
            <p>Информация для прохода</p>
            <div className={styles.row}>
              <Input
                onChange={(e) => {
                  if (/^[а-яА-ЯЁё0-9\s]*$/.test(e.target.value)) {
                    handleChange(e.target.name, e.target.value, index);
                  }
                }}
                style={{ width: 380, height: 40, padding: "0 20px 0 30px" }}
                value={passage.weldPassagesName}
                name="weldPassagesName"
                placeholder="Наименование прохода"
                autoComplete="off"
              />
            </div>
            <div className={styles.row}>
              <Input
                onChange={(e) => {
                  handleChange(e.target.name, e.target.value, index);
                }}
                style={{ width: 380, height: 40, padding: "0 20px 0 30px" }}
                value={passage.weldPassagesNumber}
                type="number"
                min="0"
                step="1"
                name="weldPassagesNumber"
                placeholder="Номер прохода"
                autoComplete="off"
              />
            </div>
            <div className={styles.row}>
              <Input
                onChange={(e) => {
                  handleChange(e.target.name, e.target.value, index);
                }}
                width="200"
                style={{ height: 40, padding: "0 20px 0 30px" }}
                value={passage.weldingCurrentMin}
                name="weldingCurrentMin"
                placeholder="Сварочный ток min"
                type="number"
                min="0"
                step="1"
                autoComplete="off"
              />

              <Input
                onChange={(e) => {
                  handleChange(e.target.name, e.target.value, index);
                }}
                width="200"
                style={{ height: 40, padding: "0 20px 0 30px" }}
                value={passage.weldingCurrentMax}
                name="weldingCurrentMax"
                type="number"
                min="0"
                step="1"
                placeholder="Сварочный ток max"
                autoComplete="off"
              />
            </div>
            <div className={styles.row}>
              <Input
                onChange={(e) => {
                  handleChange(e.target.name, e.target.value, index);
                }}
                width="200"
                style={{ height: 40, padding: "0 20px 0 30px" }}
                value={passage.arcVoltageMin}
                name="arcVoltageMin"
                placeholder="Напряжение дуги min"
                type="number"
                min="0"
                step="1"
                autoComplete="off"
              />

              <Input
                onChange={(e) => {
                  handleChange(e.target.name, e.target.value, index);
                }}
                width="200"
                style={{ height: 40, padding: "0 20px 0 30px" }}
                value={passage.arcVoltageMax}
                name="arcVoltageMax"
                placeholder="Напряжение дуги max"
                type="number"
                min="0"
                step="1"
                autoComplete="off"
              />
            </div>
            <div className={styles.row}>
              <Input
                onChange={(e) => {
                  handleChange(e.target.name, e.target.value, index);
                }}
                width="200"
                style={{ height: 40, padding: "0 20px 0 30px" }}
                value={passage.preheatingTemperatureMin}
                name="preheatingTemperatureMin"
                placeholder="Температура предварительного нагрева min"
                autoComplete="off"
                type="number"
                min="0"
                step="1"
              />

              <Input
                onChange={(e) => {
                  handleChange(e.target.name, e.target.value, index);
                }}
                width="200"
                style={{ height: 40, padding: "0 20px 0 30px" }}
                value={passage.preheatingTemperatureMax}
                name="preheatingTemperatureMax"
                placeholder="Температура предварительного нагрева max"
                autoComplete="off"
                type="number"
                min="0"
                step="1"
              />
            </div>
            {index !== 0 && (
              <Button className={styles.remowePassages} onClick={() => removePassage(index)}>
                Убрать проход
              </Button>
            )}
          </div>
        ))}

        <div className={styles.row}>
          <Button onClick={addPassage}>Добавить проход</Button>
        </div>
        <div className={styles.row}>
          <Button
            type="submit"
            onClick={() => SendData(passages)}
          >
            {modalData ? "Сохранить" : "Создать"}
          </Button>
        </div>
      </>
    )
  }

  ///
  function deleteInstruction() {
    api.remove(`/TechnologicalInstruction/${idInstr}`)
      .then((response) => { loadInstructions() })
      .catch((error) => { });
  }


  async function SendDataProc(variables) {
    const { name, number, pdmSystemFileLink } = variables;
    const newObj = { name, number, pdmSystemFileLink };
    try {
      if (modalDataNumb === 0) {
        await api.post("/TechnologicalProcess", newObj);
      } else if (modalDataNumb === 1) {
        newObj["id"] = idProc
        await api.put("/TechnologicalProcess", newObj);
      }
      loadTexprocwelding();
    } catch (error) {
      console.log(error);
    }
  }

  async function deleteProc(params) {
    try {
      const response = await api.remove(`/TechnologicalProcess/${params}`);
      loadTexprocwelding();
    } catch (error) {
      console.log(error);
    }
  }

  return (

    <div className={styles.innerWrapper}>



      <ToolTip
        title="Технологические процессы сборки и сварки"
        toolTipText="Здесь Вы можете просмотреть технологические процессы сборки и сварки"
        src={TechProcWeldImage}
      />
      {open ? (
        <Modal
          open={open}
          setOpen={setOpen}
          children={<EquipmentMap equipment={equipment} />}
        />
      ) : null}

      <Tabs
        value={value_panel}
        onChange={ChangePanels}
        indicatorColor="primary"
        textColor="primary"
      >
        <Tab label="Технологические процессы" />
        <Tab label="Технологические инструкции" />
      </Tabs>

      <div className={styles.tableWrapper}>




        {/*Технологические процессы сборки и сварки */}
        <TabPanel
          value={value_panel}
          indPanel={0}
          style={{ minWidth: "800px", }}
          className="TableTech"
        >
          <Table
            title="Технологические процессы сборки и сварки"
            columns={columns}
            value={0}
            data={texprocwelding}
            isLoading={isRequesting}

            actions={
              userRole === "Admin"
                ? [
                  {
                    icon: "add",
                    tooltip: "Добавить ",
                    isFreeAction: true,
                    onClick: () => {
                      setisModalpProcOpen(true);
                      setmodalDataNumb(0)
                      setModalData({
                        name: "",
                        number: "",
                        pdmSystemFileLink: ""
                      });

                      api.post(`/eventLog`, {
                        "information": "Открыл модальное окно добавления технологического процесса"
                      })
                    },
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать ",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setisModalpProcOpen(true);
                      setmodalDataNumb(1)
                      setidProc(rowData?.id)
                      api.post(`/eventLog`, {
                        "information": "Открыл модальное окно редактирования технологического процесса"
                      })
                    },
                  },
                ]
                : []
            }
            deleteAction={userRole === "admin" ? deleteEquipment : null}
          />
        </TabPanel>

        {/*Технологические инструкции*/}
        <TabPanel
          value={value_panel}
          indPanel={1}
          style={{ minWidth: "800px", }}
          className="TableTech"
        >
          <Table
            title="Технологические инструкции"
            columns={colinstructions}
            value={0}
            data={instructions}
            isLoading={isRequesting}
            actions={
              userRole === "Admin" || userRole === "Master"
                ? [
                  {
                    icon: "add",
                    tooltip: "Добавить ",
                    isFreeAction: true,
                    onClick: () => {
                      setIsModalOpen(true);
                      setIsModalOpenNumb(0);
                      setValuetVkladka(1)
                      api.post(`/eventLog`, {
                        "information": "Открыл модальное окно добавления технологической инструкции"
                      })
                    },
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать ",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                      setIsModalOpenNumb(1)
                      setValuetSeam(rowData?.seams[0]?.id)
                      setValuetVkladka(1)

                      setidPassages(rowData.id);
                      setvalueNameInst(rowData.name);
                      setpassagesCnange(rowData.weldPassageInstructions)
                      api.post(`/eventLog`, {
                        "information": "Открыл модальное окно редактирования технологической инструкции"
                      })
                    },
                  },
                ]
                : []
            }
            renderRowChildren={renderRowChildren}
            deleteAction={userRole === "admin" ? deleteEquipment : null}
          />
        </TabPanel>
      </div>

      <ResultsModal
        type={"EQUIPMENT"}
        activeId={activeEquipment}
        isOpen={isResultsModalOpen}
        setIsOpen={setIsResultsModalOpen}
      />
      <ModalWindow
        isOpen={isModalOpen}
        headerText={
          modalData ? "Редактировать " : "Добавить "
        }
        setIsOpen={(state) => {
          setIsModalOpen(state);
          setModalData(null);
        }}
        wrapperStyles={{ width: 420 }}
      >
        <Formik
          initialValues={initialValues}
          enableReinitialize
          onSubmit={(variables) => {
            const { id, ...dataToSend } = variables;
            setIsModalOpen(false);
            setModalData(null);

          }}
        >
          {({
            handleSubmit,
            handleChange,
            values,
            setFieldValue,
            handleBlur,
          }) => (
            <form onSubmit={handleSubmit}>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    setvalueNameInst(e.target.value);
                  }}
                  style={{ width: 380, height: 40, padding: "0 20px 0 30px" }}
                  value={valueNameInst}
                  name="name"
                  autocomplete="off"
                  placeholder="Наименовние"
                  onBlur={handleBlur}
                />
              </div>
              <div className={styles.row}>
                <Select
                  name="valuetTechProc"
                  width="380px"
                  value={valuetSeam}
                  placeholder="Сварочный шов"
                  onChange={(event) => setValuetSeam(event.value)}
                  options={SeamOptions}
                />
              </div>

             
              {isModalOpenNumb === 0
                ? <WeldingInputs />
                : <CnangeWeldingInputs />
              }
               {/* {userRole === "Admin" || userRole === "Master"
                ? <Upload></Upload>
                : null
              } */}

            </form>

          )}
        </Formik>
      </ModalWindow>



      {/*Технологические процессы  */}
      <ModalWindow
        isOpen={isModalpProcOpen}
        headerText={
          modalDataNumb ? "Редактировать " : "Добавить "
        }
        setIsOpen={(state) => {
          setisModalpProcOpen(false)
        }}
        wrapperStyles={{ width: 420 }}
      >
        <Formik
          initialValues={initialValues}
          enableReinitialize
          onSubmit={(variables) => {
            const { id, ...dataToSend } = variables;
            setisModalpProcOpen(false)
            SendDataProc(variables)
          }}
        >
          {({
            handleSubmit,
            handleChange,
            values,
            setFieldValue,
            handleBlur,
          }) => (
            <form onSubmit={handleSubmit}>

              <div>
                <div className={styles.row}>
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{ width: 380, height: 40, padding: "0 20px 0 30px" }}
                    value={values.name}
                    name="name"
                    autocomplete="off"
                    placeholder="Наименовние"
                    onBlur={handleBlur}
                  />
                </div>
                <div className={styles.row}>
                  <Input
                    onChange={(e) => {
                      const pattern = /^[0-9-]*$/; // задаем шаблон для вводимых символов
                      if (pattern.test(e.target.value)) { // проверяем соответствие вводимых символов шаблону
                        handleChange(e);
                      }
                    }}
                    style={{ width: 380, height: 40, padding: "0 20px 0 30px" }}
                    value={values.number}
                    name="number"
                    autoComplete="off"
                    placeholder="Номер технологического процесса"
                    onBlur={handleBlur}
                  />
                </div>
                <div className={styles.row}>
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{ width: 380, height: 40, padding: "0 20px 0 30px" }}
                    value={values.pdmSystemFileLink}
                    name="pdmSystemFileLink"
                    autocomplete="off"
                    placeholder="Ссылка на PDF-файл "
                    onBlur={handleBlur}
                  />
                </div>
                {/* {userRole === "Admin" || userRole === "Master"
                  ? <Upload></Upload>
                  : null
                } */}
                <div className={styles.row}>
                  <Button
                    type="submit"
                  >
                    {modalDataNumb ? "Редактировать " : "Добавить "}
                  </Button>
                </div>

              </div>
            </form>
          )}
        </Formik>
      </ModalWindow>


      {/*Удаление задания*/}
      <ModalWindow
        isOpen={deleteTaskModal}
        headerText="Удаление"
        setIsOpen={(state) => {
          setdeleteTaskModal(false)
        }}
        wrapperStyles={{ width: 420 }}
      >
        <Formik
          initialValues={initialValues}
          enableReinitialize
          onSubmit={(variables) => {
            const { id, ...dataToSend } = variables;
            setdeleteTaskModal(false)
            deleteInstruction()
          }}
        >
          {({
            handleSubmit,
            handleChange,
            values,
            setFieldValue,
            handleBlur,
          }) => (
            <form onSubmit={handleSubmit}>

              <div>
                <h4 style={{ padding: "35px 40px" }}>Вы уверены что хотите <span>удалить</span> данную инструкцию ? </h4>

                <div className={styles.row}>
                  <Button
                    type="submit"
                  >
                    Удалить
                  </Button>
                </div>

              </div>
            </form>
          )}
        </Formik>
      </ModalWindow>


      {/*Удаление процесса*/}
      <ModalWindow
        isOpen={deleteProcModal}
        headerText="Удаление"
        setIsOpen={(state) => {
          setdeleteProcModal(false)
        }}
        wrapperStyles={{ width: 420 }}
      >
        <Formik
          initialValues={initialValues}
          enableReinitialize
          onSubmit={(variables) => {
            const { id, ...dataToSend } = variables;
            setdeleteProcModal(false)
            deleteProc(idProc)
          }}
        >
          {({
            handleSubmit,
            handleChange,
            values,
            setFieldValue,
            handleBlur,
          }) => (
            <form onSubmit={handleSubmit}>

              <div>
                <h4 style={{ padding: "35px 40px" }}>Вы уверены что хотите <span>удалить</span> процесс ? </h4>

                <div className={styles.row}>
                  <Button
                    type="submit"
                  >
                    Удалить
                  </Button>
                </div>

              </div>
            </form>
          )}
        </Formik>
      </ModalWindow>


    </div>
  );
};
