import React, { useContext, useEffect, useState, useCallback } from "react";
import styles from "./styles.module.scss";
import MobileContext from "context/MobileContext";
import { Table } from "components/shared/Table";
import TableCell from "@material-ui/core/TableCell";
import TableRow from "@material-ui/core/TableRow";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import MaterialTable from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import ModalWindow from "components/shared/ModalWindow";
import { Formik } from "formik";
import Button from "components/shared/Button";
import Select from "components/shared/Select";
import Input from "components/shared/Input";
import api from "services/api";
import Paper from "@material-ui/core/Paper";

const ToolTip = ({ title, src, toolTipText, button, workshop, equipment }) => {
  const isMobile = useContext(MobileContext);

  const [isModalOpen, setIsModalOpen] = useState(false);
  const [modalData, setmodalData] = useState(null);
  const [idReports, setidReports] = useState(title === "Сотрудники" ? 10 : 5);
  const [isModalNothinOpen, setisModalNothinOpen] = useState(false);
  const [isModalErrOpen, setisModalErrOpen] = useState(false);
  const [initialValues, setInitialValues] = useState({
    workshopId: modalData?.workshopId ?? "",
    startDate: modalData?.startDate ?? "",
    endDate: modalData?.endDate ?? "",
    seamId: modalData?.seamId ?? "",
    productId: modalData?.productId ?? "",
    productionAreaId: modalData?.productionAreaId ?? "",
    welderId: modalData?.welderId ?? "",
    WorkplaceId: modalData?.WorkplaceId ?? "",
    WeldingEquipmentId: modalData?.WeldingEquipmentId ?? "",
    cutType: modalData?.cutType ?? "",
  });

  ////Select
  const workshopOptions = workshop?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });
  const equipmentOptions =
    equipment &&
    Array.isArray(equipment[0]) &&
    equipment[0].map((item) => {
      return {
        value: item.id,
        label: `${item.name} ${item.factoryNumber}  `,
      };
    });

  function FormTable() {
    const handleChange = (name, value) => {
      setInitialValues({ ...initialValues, [name]: value });
    };

    {
      /*startDate - endDate*/
    }
    function StartDateEndDate() {
      return (
        <div className={styles.row}>
          <Input
            onChange={(event) => {
              let date = new Date(event.target.value).toLocaleDateString(
                "ru-RU"
              );
              handleChange("startDate", date);
            }}
            width="200"
            style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
            value={initialValues.startDate}
            name="startDate "
            placeholder="Дата с которой начинается"
            type="text"
            onFocus={(e) => {
              e.currentTarget.type = "date";
            }}
            autoComplete="off"
          />

          <Input
            onChange={(event) => {
              let date = new Date(event.target.value).toLocaleDateString(
                "ru-RU"
              );
              handleChange("endDate", date);
            }}
            width="200"
            style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
            value={initialValues.endDate}
            name="endDate "
            placeholder="Дата с которой заканчивается"
            type="text"
            onFocus={(e) => {
              e.currentTarget.type = "date";
            }}
            autoComplete="off"
          />
        </div>
      );
    }
    {
      /*workshopId*/
    }
    function WorkshopId() {
      return (
        <div className={styles.row}>
          <Select
            name="workshopId"
            value={initialValues.workshopId}
            width="380px"
            placeholder="Цех"
            onChange={(event) => {
              handleChange("workshopId", event.value);
            }}
            options={workshopOptions}
          />
        </div>
      );
    }
    if (idReports === 4 || idReports === 5) {
      return (
        <div>
          {/*WeldingEquipmentId*/}
          <div className={styles.row}>
            <Select
              name="WeldingEquipmentId"
              value={initialValues.WeldingEquipmentId}
              width="380px"
              placeholder="Оборудование"
              onChange={(event) => {
                handleChange("WeldingEquipmentId", event.value);
              }}
              options={equipmentOptions}
            />
          </div>

          <StartDateEndDate />
        </div>
      );
    }

    if (idReports === 10) {
      return (
        <div>
          <WorkshopId />
          <StartDateEndDate />
        </div>
      );
    }
  }

  async function SendData() {
    let endpoint;
    if (idReports === 5) {
      endpoint = `excelEquipmentOperationTimeReport?weldingEquipmentId=${initialValues.WeldingEquipmentId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}`;
    } else if (idReports === 10) {
      endpoint = `excelWelderOperationReport/byWorkshop?WorkshopId=${initialValues.workshopId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}`;
    }

    try {
      const res = await api.get(endpoint);
      if (res.status === 204) {
        setisModalNothinOpen(true);
      }
      if (res.status === 200) {
        window.open(res.request.responseURL);
      }
    } catch (error) {
      setisModalErrOpen(true);
    }
  }

  return (
    <div
      style={{ backgroundImage: `url(${src})` }}
      className={[styles.wrapper]}
    >
      <div className={styles.cover}>
        <div className={styles.trapezoid}>
          <span className={[styles.text, styles.title].join(" ")}>{title}</span>
          {!isMobile && (
            <span className={[styles.text, styles.tooltip].join(" ")}>
              {toolTipText}
            </span>
          )}
          {!isMobile && button}

          {/* {title === "Сотрудники" || title === "Оборудование"
            ? <button className={styles.buttonReport} onClick={
              (e)=>{
                setIsModalOpen(true)
                title === "Сотрудники"?setidReports(10):setidReports(5)
              }
            }> Отчет о работе</button>
            : null
          } */}
        </div>
      </div>

      {/*Формирование отчёта*/}
      <ModalWindow
        isOpen={isModalOpen}
        headerText="Формирование отчёта"
        setIsOpen={(state) => {
          setIsModalOpen(false);
        }}
        wrapperStyles={{ width: 420 }}
      >
        <Formik
          initialValues={initialValues}
          enableReinitialize
          onSubmit={(variables) => {
            const { id, ...dataToSend } = variables;
            setIsModalOpen(false);
            SendData();
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
                <FormTable />

                <div className={styles.row}>
                  <Button type="submit">Сформировать</Button>
                </div>
              </div>
            </form>
          )}
        </Formik>
      </ModalWindow>
      {/*Формирование отчёта*/}
      <ModalWindow
        isOpen={isModalNothinOpen}
        headerText=""
        setIsOpen={(state) => {
          setisModalNothinOpen(false);
        }}
        wrapperStyles={{ width: 420 }}
      >
        <Formik
          initialValues={initialValues}
          enableReinitialize
          onSubmit={(variables) => {
            const { id, ...dataToSend } = variables;
            setisModalNothinOpen(false);
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
                <h4 style={{ padding: "35px 40px" }}>
                  Данные по этому отчету отсутствуют.{" "}
                </h4>

                <div className={styles.row}>
                  <Button type="submit">Закрыть</Button>
                </div>
              </div>
            </form>
          )}
        </Formik>
      </ModalWindow>

      {/*Ошибка*/}
      <ModalWindow
        isOpen={isModalErrOpen}
        headerText="Ошибка"
        setIsOpen={(state) => {
          setisModalErrOpen(false);
        }}
        wrapperStyles={{ width: 420 }}
      >
        <Formik
          initialValues={initialValues}
          enableReinitialize
          onSubmit={(variables) => {
            const { id, ...dataToSend } = variables;
            setisModalErrOpen(false);
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
                <h4 style={{ padding: "35px 40px" }}>
                  Произошла ошибка, перепроверьте введенные данные{" "}
                </h4>

                <div className={styles.row}>
                  <Button type="submit">Закрыть</Button>
                </div>
              </div>
            </form>
          )}
        </Formik>
      </ModalWindow>
    </div>
  );
};

export default ToolTip;
