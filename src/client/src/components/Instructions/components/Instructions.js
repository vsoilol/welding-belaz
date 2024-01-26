import Paper from "@material-ui/core/Paper";
import MaterialTable from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import AddIcon from "@material-ui/icons/Add";
import { eye } from "assets/icons";
import Button from "components/shared/Button";
import { deleteEmpty } from "services/deleteEmpty";
import Input from "components/shared/Input";
import ModalWindow from "components/shared/ModalWindow";
import Select from "components/shared/Select";
import { Table } from "components/shared/Table";
import { FieldArray, Formik } from "formik";
import React, { useState } from "react";
import styles from "../styles.module.scss";

export const InstructionsTable = ({
  tableType,
  instructions,
  addInstruction,
  deleteInstruction,
  editInstruction,
  wpsSelectInstructions,
  userRole,
  isRequesting,
}) => {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [modalData, setModalData] = useState(null);

  const otkInitialValues = {
    id: modalData?.id ?? null,
    otkName: modalData?.otkName ?? "",
    otkDescription: modalData?.otkDescription ?? "",
    otkUrl: modalData?.otkUrl ?? "",
    wpsIds: modalData?.wps?.map((item) => item?.id) ?? [""],
    allowances: modalData?.allowances ?? [
      {
        passNumber: 1,
        minPreTemp: "",
        maxPreTemp: "",
        minLayerTemp: "",
        maxLayerTemp: "",
        minAmp: "",
        maxAmp: "",
        minVolt: "",
        maxVolt: "",
        minSpeed: "",
        maxSpeed: "",
        layerName: "",
      },
    ],
  };

  const wpsInitialValues = {
    id: modalData?.id ?? null,
    wpsName: modalData?.wpsName ?? "",
    wpsDescription: modalData?.wpsDescription ?? "",
    wpsUrl: modalData?.wpsUrl ?? "",
  };

  const otkColumns = [
    { title: "Наименовние", field: "otkName" },
    { title: "Шифр", field: "otkDescription" },
    {
      title: "Соответствующие ИТП",
      field: "wps",
      render: (rowData) =>
        rowData?.wps && (
          <p>
            {rowData.wps?.map((wps) => (
              <a
                className={styles.link}
                target="_blank"
                rel="noopener noreferrer"
                href={wps?.wpsUrl}
                key={wps?.id}
              >
                {wps?.wpsName + " "}
              </a>
            ))}
          </p>
        ),
    },
    {
      field: "otkUrl",
      title: "Просмотр",
      render: (rowData) => (
        <a
          className={styles.downloadButton}
          target="_blank"
          rel="noopener noreferrer"
          href={rowData?.otkUrl}
        >
          <img src={eye} alt="" />
        </a>
      ),
      width: 54,
    },
  ];

  const wpsColumns = [
    { title: "Название", field: "wpsName" },
    { title: "Описание", field: "wpsDescription" },
    {
      field: "wpsUrl",
      title: "Просмотр",
      render: (rowData) => (
        <a
          className={styles.downloadButton}
          target="_blank"
          rel="noopener noreferrer"
          href={rowData?.wpsUrl}
        >
          <img src={eye} alt="" />
        </a>
      ),
      width: 54,
    },
  ];

  const renderValue = (value) => {
    if (value === 0 || value === "0") {
      return "-";
    }
    return value ?? "-";
  };

  const requiredKeys =
    tableType === "OTK" ? ["otkName", "otkUrl"] : ["wpsName", "wpsUrl"];

  const renderRowChildren = (rowData) => {
    return (
      rowData?.allowances && (
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
                  Номер Прохода
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                >
                  Наименование слоя
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                  colSpan={2}
                >
                  Температура предварительного подогрева
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                  colSpan={2}
                >
                  Межслойная температура
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                  colSpan={2}
                >
                  Сила тока
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                  colSpan={2}
                >
                  Напряжение на дуге
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                  colSpan={2}
                >
                  Скорость варки
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
                <TableCell align="center">max</TableCell>
                <TableCell align="center">min</TableCell>
                <TableCell align="center">max</TableCell>
                <TableCell align="center">min</TableCell>
                <TableCell align="center">max</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {rowData?.allowances?.map((row) => (
                <TableRow key={row.id}>
                  <TableCell align="center" component="th" scope="row">
                    {row.passNumber}
                  </TableCell>
                  <TableCell align="center" component="th" scope="row">
                    {row.layerName}
                  </TableCell>
                  <TableCell align="center">
                    {renderValue(row.minPreTemp)}
                  </TableCell>
                  <TableCell align="center">
                    {renderValue(row.maxPreTemp)}
                  </TableCell>
                  <TableCell align="center">
                    {renderValue(row.minLayerTemp)}
                  </TableCell>
                  <TableCell align="center">
                    {renderValue(row.maxLayerTemp)}
                  </TableCell>
                  <TableCell align="center">
                    {renderValue(row.minAmp)}
                  </TableCell>
                  <TableCell align="center">
                    {renderValue(row.maxAmp)}
                  </TableCell>
                  <TableCell align="center">
                    {renderValue(row.minVolt)}
                  </TableCell>
                  <TableCell align="center">
                    {renderValue(row.maxVolt)}
                  </TableCell>
                  <TableCell align="center">
                    {renderValue(row.minSpeed)}
                  </TableCell>
                  <TableCell align="center">
                    {renderValue(row.maxSpeed)}
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </MaterialTable>
        </TableContainer>
      )
    );
  };

  return (
    <>
      <div className={styles.tableWrapper}>
        <Table
          title={
            tableType === "WPS"
              ? "Инструкции на технологический процесс сварки"
              : "Операционные технологические карты"
          }
          actions={
            userRole === "admin"
              ? [
                  {
                    icon: "add",
                    tooltip: "Добавить инструкцию",
                    isFreeAction: true,
                    onClick: () => setIsModalOpen(true),
                  },
                  {
                    icon: "edit",
                    tooltip: "Редактировать инструкцию",
                    onClick: (event, rowData) => {
                      setModalData(rowData);
                      setIsModalOpen(true);
                    },
                  },
                ]
              : []
          }
          columns={tableType === "WPS" ? wpsColumns : otkColumns}
          renderRowChildren={tableType === "OTK" && renderRowChildren}
          data={instructions}
          isLoading={isRequesting}
          deleteAction={userRole === "admin" ? deleteInstruction : null}
        />
      </div>
      <ModalWindow
        isOpen={isModalOpen}
        headerText={
          modalData ? "Редактировать инструкцию" : "Добавить инструкцию"
        }
        setIsOpen={(state) => {
          setIsModalOpen(state);
          setModalData(null);
        }}
        wrapperStyles={{ width: 400 }}
      >
        {tableType === "OTK" ? (
          <Formik
            initialValues={otkInitialValues}
            enableReinitialize
            onSubmit={(variables) => {
              const { id, ...dataToSend } = variables;
              modalData
                ? editInstruction(deleteEmpty({ ...variables }))
                : addInstruction(deleteEmpty({ ...dataToSend }));
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
                      handleChange(e);
                    }}
                    style={{ width: 180, height: 40, paddingLeft: 20 }}
                    value={values.otkName}
                    name="otkName"
                    placeholder="Наименование"
                    onBlur={handleBlur}
                    autoComplete="off"
                  />
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{ width: 180, height: 40, paddingLeft: 20 }}
                    value={values.otkUrl}
                    name="otkUrl"
                    placeholder="Ссылка"
                    onBlur={handleBlur}
                    autoComplete="off"
                  />
                </div>
                {values.wpsIds?.map((wps, index) => (
                  <div className={styles.row} key={index}>
                    <Select
                      name="wpsIds"
                      value={values.wpsIds?.[index]}
                      placeholder="Выбрать WPS"
                      width="360px"
                      onChange={(e) => {
                        // setFieldValue("wpsIds", e.value);
                        setFieldValue(
                          "wpsIds",
                          values.wpsIds?.map((item, itemIndex) => {
                            if (index === itemIndex) {
                              return e.value;
                            } else return item;
                          })
                        );
                      }}
                      options={wpsSelectInstructions}
                    />
                    {values.wpsIds.length !== 2 && (
                      <div
                        onClick={() => {
                          values.wpsIds.push("");
                          setFieldValue("wpsIds", values.wpsIds);
                        }}
                        style={{
                          display: "flex",
                          justifyContent: "center",
                          alignItems: "center",
                          width: 80,
                          cursor: "pointer",
                        }}
                      >
                        <AddIcon />
                      </div>
                    )}
                  </div>
                ))}
                <div className={styles.row}>
                  <textarea
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{ width: 330, height: 60, paddingLeft: 20 }}
                    value={values.otkDescription}
                    name="otkDescription"
                    placeholder="Описание"
                    onBlur={handleBlur}
                  />
                </div>
                <FieldArray
                  name="allowances"
                  render={(arrayHelpers) => (
                    <div>
                      {values.allowances?.map((item, index) => {
                        return (
                          <div key={index}>
                            <div
                              style={{
                                display: "flex",
                                justifyContent: "space-between",
                              }}
                            >
                              <p className={styles.text}>
                                Номер прохода: {index + 1}
                              </p>
                              <div
                                onClick={() => {
                                  values.allowances.push({
                                    passNumber: values?.allowances?.length + 1,
                                    minPreTemp: "",
                                    maxPreTemp: "",
                                    minLayerTemp: "",
                                    maxLayerTemp: "",
                                    minAmp: "",
                                    maxAmp: "",
                                    minVolt: "",
                                    maxVolt: "",
                                    minSpeed: "",
                                    maxSpeed: "",
                                  });
                                  setFieldValue(
                                    "allowances",
                                    values.allowances
                                  );
                                }}
                              >
                                <p className={styles.text}>Добавить</p>
                              </div>
                            </div>
                            <div className={styles.row}>
                              <Input
                                onChange={(e) => {
                                  handleChange(e);
                                }}
                                style={{
                                  width: 380,
                                  height: 40,
                                  paddingLeft: 20,
                                }}
                                value={values.allowances[index].layerName}
                                name={`allowances.${index}.layerName`}
                                placeholder="Наименование слоя"
                                onBlur={handleBlur}
                                autoComplete="off"
                              />
                            </div>
                            <p className={styles.text}>
                              Температура предварительного подоргева:
                            </p>
                            <div className={styles.row}>
                              <Input
                                onChange={(e) => {
                                  handleChange(e);
                                }}
                                style={{
                                  width: 180,
                                  height: 40,
                                  paddingLeft: 20,
                                }}
                                value={values.allowances[index].minPreTemp}
                                name={`allowances.${index}.minPreTemp`}
                                placeholder="min"
                                onBlur={handleBlur}
                                autoComplete="off"
                              />
                              <Input
                                onChange={(e) => {
                                  handleChange(e);
                                }}
                                style={{
                                  width: 180,
                                  height: 40,
                                  paddingLeft: 20,
                                }}
                                value={values.allowances[index].maxPreTemp}
                                name={`allowances.${index}.maxPreTemp`}
                                placeholder="max"
                                autoComplete="off"
                              />
                            </div>
                            <p className={styles.text}>
                              Межслойная температуры:
                            </p>
                            <div className={styles.row}>
                              <Input
                                onChange={(e) => {
                                  handleChange(e);
                                }}
                                style={{
                                  width: 180,
                                  height: 40,
                                  paddingLeft: 20,
                                }}
                                value={values.allowances[index].minLayerTemp}
                                name={`allowances.${index}.minLayerTemp`}
                                placeholder="min"
                                autoComplete="off"
                              />
                              <Input
                                onChange={(e) => {
                                  handleChange(e);
                                }}
                                style={{
                                  width: 180,
                                  height: 40,
                                  paddingLeft: 20,
                                }}
                                value={values.allowances[index].maxLayerTemp}
                                name={`allowances.${index}.maxLayerTemp`}
                                placeholder="max"
                                autoComplete="off"
                              />
                            </div>
                            <p className={styles.text}>Сила тока:</p>
                            <div className={styles.row}>
                              <Input
                                onChange={(e) => {
                                  handleChange(e);
                                }}
                                style={{
                                  width: 180,
                                  height: 40,
                                  paddingLeft: 20,
                                }}
                                value={values.allowances[index].minAmp}
                                name={`allowances.${index}.minAmp`}
                                placeholder="min"
                                autoComplete="off"
                              />
                              <Input
                                onChange={(e) => {
                                  handleChange(e);
                                }}
                                style={{
                                  width: 180,
                                  height: 40,
                                  paddingLeft: 20,
                                }}
                                value={values.allowances[index].maxAmp}
                                name={`allowances.${index}.maxAmp`}
                                placeholder="max"
                                autoComplete="off"
                              />
                            </div>
                            <p className={styles.text}>Напряжение на дуге:</p>
                            <div className={styles.row}>
                              <Input
                                onChange={(e) => {
                                  handleChange(e);
                                }}
                                style={{
                                  width: 180,
                                  height: 40,
                                  paddingLeft: 20,
                                }}
                                value={values.allowances[index].minVolt}
                                name={`allowances.${index}.minVolt`}
                                placeholder="min"
                                autoComplete="off"
                              />
                              <Input
                                onChange={(e) => {
                                  handleChange(e);
                                }}
                                style={{
                                  width: 180,
                                  height: 40,
                                  paddingLeft: 20,
                                }}
                                value={values.allowances[index].maxVolt}
                                name={`allowances.${index}.maxVolt`}
                                placeholder="max"
                                autoComplete="off"
                              />
                            </div>
                            <p className={styles.text}>Скорость сварки м\ч:</p>
                            <div className={styles.row}>
                              <Input
                                onChange={(e) => {
                                  handleChange(e);
                                }}
                                style={{
                                  width: 180,
                                  height: 40,
                                  paddingLeft: 20,
                                }}
                                value={values.allowances[index].minSpeed}
                                name={`allowances.${index}.minSpeed`}
                                placeholder="min"
                                autoComplete="off"
                              />
                              <Input
                                onChange={(e) => {
                                  handleChange(e);
                                }}
                                style={{
                                  width: 180,
                                  height: 40,
                                  paddingLeft: 20,
                                }}
                                value={values.allowances[index].maxSpeed}
                                name={`allowances.${index}.maxSpeed`}
                                placeholder="max"
                                autoComplete="off"
                              />
                            </div>
                          </div>
                        );
                      })}
                    </div>
                  )}
                />
                <div className={styles.row}>
                  <Button
                    disabled={requiredKeys.some((key) => !values[key])}
                    type="submit"
                  >
                    {modalData ? "Сохранить" : "Создать"}
                  </Button>
                </div>
              </form>
            )}
          </Formik>
        ) : (
          <Formik
            initialValues={wpsInitialValues}
            enableReinitialize
            onSubmit={(variables) => {
              const { id, ...dataToSend } = variables;
              modalData
                ? editInstruction({ ...variables })
                : addInstruction({ ...dataToSend });
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
                      handleChange(e);
                    }}
                    style={{ width: 180, height: 40, paddingLeft: 20 }}
                    value={values.wpsName}
                    name="wpsName"
                    placeholder="Наименование"
                    onBlur={handleBlur}
                    autoComplete="off"
                  />
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{ width: 180, height: 40, paddingLeft: 20 }}
                    value={values.wpsUrl}
                    name="wpsUrl"
                    placeholder="Ссылка"
                    autoComplete="off"
                    onBlur={handleBlur}
                  />
                </div>
                <div className={styles.row}>
                  <textarea
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    style={{ width: 330, height: 60, paddingLeft: 20 }}
                    value={values.wpsDescription}
                    name="wpsDescription"
                    placeholder="Описание"
                    onBlur={handleBlur}
                  />
                </div>
                <div className={styles.row}>
                  <Button
                    disabled={requiredKeys.some((key) => !values[key])}
                    type="submit"
                  >
                    {modalData ? "Сохранить" : "Создать"}
                  </Button>
                </div>
              </form>
            )}
          </Formik>
        )}
      </ModalWindow>
    </>
  );
};
