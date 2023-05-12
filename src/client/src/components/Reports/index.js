
import React, { useEffect, useState, useCallback } from "react";
import styles from "./styles.module.css";
import ToolTip from "components/shared/ToolTip";
import { reportsImage } from "assets/pics";
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
export const Reports = ({
  loadWorkshop,
  loadArea,
  loadSeam,
  loadProduct,
  loadWorkplace,
  loadEquipment,
  loadExecutors,

  workshop,
  product,
  area,
  seam,
  equipment,
  workplace,
  executors
}) => {
  useEffect(() => {
    loadWorkshop()
    loadArea()
    loadSeam()
    loadProduct()
    loadExecutors()
    loadWorkplace()
    loadEquipment()
  }, [
    loadWorkshop,
    loadArea,
    loadSeam,
    loadProduct,
    loadExecutors,
    loadEquipment,
    loadWorkplace
  ]);

  const [isModalOpen, setIsModalOpen] = useState(false);
  const [isModalNothinOpen, setisModalNothinOpen] = useState(false);
  const [isModalErrOpen, setisModalErrOpen] = useState(false);
  const [modalData, setmodalData] = useState(null);
  const [idReports, setidReports] = useState(0);

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

  const [accessibility, setaccessibility] = useState("");
  const [efficiency, setefficiency] = useState("");
  const [quality, setquality] = useState("");

  ////Select
  const executorsOptions = executors?.map((item) => {
    return {
      value: item.id,
      label: `${item.middleName} ${item.firstName} ${item.lastName}`,
    };
  });
  const workshopOptions = workshop?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });
  const areaOptions = area?.map((item) => {
    return {
      value: item.id,
      label: `№${item.number} ${item.name} `,
    };
  });
  const productOptions = product?.map((item) => {
    return {
      value: item.id,
      label: `${item.name} ${item.number}`,
    };
  });
  const seamOptions = seam?.map((item) => {
    return {
      value: item.id,
      label: `Cварочный шов ${item.number}`,
    };
  });
  const workplaceOptions = workplace?.map((item) => {
    return {
      value: item.id,
      label: `Рабочее место ${item.number}`,
    };
  });
  const equipmentOptions = equipment[0]?.map((item) => {
    return {
      value: item.id,
      label: `${item.name} ${item.factoryNumber}  `,
    };
  });
  const cutTypeOptions = [
    {
      value: 1,
      label: `В разрезе рабочих смен`,
    },
    {
      value: 2,
      label: `В разрезе дней`,
    },
    {
      value: 3,
      label: `В разрезе недель`,
    },
    {
      value: 4,
      label: `В разрезе месяцев`,
    },
    {
      value: 5,
      label: `В разрезе лет`,
    }
  ].map(item => ({
    value: item.value,
    label: item.label,
  }));


  ////!Select
  const reports = [
    {
      id: 0,
      name: "Отчет об отклонениях от нормативных параметров режимов сварки по цеху"
    },
    {
      id: 1,
      name: "Отчет об отклонениях от нормативных параметров режимов сварки по производственному участку"
    },
    {
      id: 2,
      name: "Отчет об отклонениях от нормативных параметров режимов сварки по исполнителю"
    },
    {
      id: 3,
      name: "Отчет об отклонениях от нормативных параметров режимов сварки по рабочему месту"
    },
    {
      id: 4,
      name: "Отчет о простоях оборудования за период ",
      tableData: null
    },
    {
      id: 5,
      name: "Отчет работе оборудования за период  ",
      tableData: null
    },
    {
      id: 6,
      name: "Отчет о выполненных операциях по цеху  "
    },
    {
      id: 7,
      name: "Отчет о выполненных операциях по исполнителю  "
    },
    {
      id: 8,
      name: "Отчет о выполненных операциях по рабочему месту  "
    },
    {
      id: 9,
      name: "Отчет о выполненных операциях по производственному участку  "
    },
    {
      id: 10,
      name: "Отчет о работе сварщиков по цеху"
    },
    {
      id: 11,
      name: "Отчет о работе сварщиков по производственному участку"
    },
    {
      id: 12,
      name: "Отчет о работе сварщиков по исполнителю"
    },
    {
      id: 13,
      name: "Отчет о работе сварщиков по рабочему месту"
    },
    {
      id: 14,
      name: "Отчет о работе сварщиков для завода"
    },
    {
      id: 15,
      name: "Отчет об отклонениях от нормативных параметров режимов сварки для завода"
    },
    {
      id: 16,
      name: "Отчет о выполненных операциях (швах) для завода"
    },

    {
      id: 17,
      name: "Отчет об анализе работы оборудования для завода"
    },
    {
      id: 18,
      name: "Отчет об анализе работы оборудования по цеху"
    },
    {
      id: 19,
      name: "Отчет об анализе работы оборудования  по производственному участку"
    },
    {
      id: 20,
      name: "Отчет об эффективности использования оборудования для завода"
    },
    {
      id: 21,
      name: "Отчет об эффективности использования оборудования  по рабочему месту"
    },
    {
      id: 22,
      name: "Отчет об эффективности использования оборудования  по цеху"
    },
    {
      id: 23,
      name: "Отчет об эффективности использования оборудования  по производственному участку"
    },
  ]
 
  const colinstructions = [
    {
      title: "Наименование",
      field: "name"
    },
    {
      title: "", render: (rowData) => {
        return (
          <span className={styles.ReportsSpan} onClick={e => {
            e.preventDefault();
            setIsModalOpen(true);
            setidReports(rowData?.id); 
            api.post(`/eventLog`,{
                "information": `Сгенерировал ${rowData.name}`
            })
          }}> Сгенерировать </span>
        )
      }
    },
  ]
  function FormTable() {
    const handleChange = (name, value) => {
      setInitialValues({ ...initialValues, [name]: value });
    };

    {/*cutType*/ }
    function CutType() {
      return (
        <div className={styles.row}>
          <Select
            name="cutType"
            value={initialValues.cutType}
            width="380px"
            placeholder="Тип разреза "
            onChange={(event) => {
              handleChange("cutType", event.value)
            }}
            options={cutTypeOptions}
          />
        </div>
      )
    }
    {/*Seam*/ }
    function SeamComp() {
      return (
        <div className={styles.row}>
          <Select
            name="seamId"
            value={initialValues.seamId}
            width="380px"
            placeholder="Швы"
            onChange={(event) => {
              handleChange("seamId", event.value)
            }}
            options={seamOptions}
          />
        </div>
      )
    }
    {/*startDate - endDate*/ }
    function StartDateEndDate() {
      return (
        <div className={styles.row}>
          <Input
            onChange={(event) => {
              let date = new Date(event.target.value).toLocaleDateString('ru-RU')
              handleChange("startDate", date)
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
            autocomplete="off"
          />


          <Input
            onChange={(event) => {
              let date = new Date(event.target.value).toLocaleDateString('ru-RU')
              handleChange("endDate", date)
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
            autocomplete="off"
          />
        </div>
      )
    }
    {/*productId*/ }
    function Product() {
      return (
        <div className={styles.row}>
          <Select
            name="productId"
            value={initialValues.productId}
            width="380px"
            placeholder="Изделие"
            onChange={(event) => {
              handleChange("productId", event.value)
            }}
            options={productOptions}
          />
        </div>
      )
    }
    {/*workshopId*/ }
    function WorkshopId() {
      return (
        <div className={styles.row}>
          <Select
            name="workshopId"
            value={initialValues.workshopId}
            width="380px"
            placeholder="Цех"
            onChange={(event) => {
              handleChange("workshopId", event.value)
            }}
            options={workshopOptions}
          />
        </div>
      )
    }
    {/*productionAreaId*/ }
    function ProductionAreaId() {
      return (
        <div className={styles.row}>
          <Select
            name="productionAreaId"
            value={initialValues.productionAreaId}
            width="380px"
            placeholder="Производственный участок"
            onChange={(event) => {
              handleChange("productionAreaId", event.value)
            }}
            options={areaOptions}
          />
        </div>
      )
    }
    {/*welderId*/ }
    function WelderId() {
      return (
        <div className={styles.row}>
          <Select
            name="welderId"
            value={initialValues.welderId}
            width="380px"
            placeholder="Сварщик"
            onChange={(event) => {
              handleChange("welderId", event.value)
            }}
            options={executorsOptions}
          />
        </div>
      )
    }
    {/*WorkplaceId*/ }
    function WorkplaceId() {
      return (
        <div className={styles.row}>
          <Select
            name="WorkplaceId"
            value={initialValues.WorkplaceId}
            width="380px"
            placeholder="Рабочие места"
            onChange={(event) => {
              handleChange("WorkplaceId", event.value)
            }}
            options={workplaceOptions}
          />
        </div>
      )
    }
    {/*accessibility  efficiency  quality */ }
    function AccesEfficQuality() {
      return (
        <div>
          <div className={styles.row}>
            <Input
              onChange={(event) => {
                setaccessibility(event.target.value)
              }}
              style={{ height: 40, width: 562 }}
              value={accessibility}
              name="accessibility "
              placeholder="Доступность "
              type="number"
              min="0"
              step="1"
              autoComplete="off"
            />
          </div>
          <div className={styles.row}>
            <Input
              onChange={(event) => {
                setefficiency(event.target.value)
              }}
              style={{ height: 40, width: 562 }}
              value={efficiency}
              name="efficiency "
              placeholder="Производительность "
              type="number"
              min="0"
              step="1"
              autoComplete="off"
            />
          </div>
          <div className={styles.row}>
            <Input
              onChange={(event) => {
                setquality(event.target.value)
              }}
              style={{ height: 40, width: 562 }}
              value={quality}
              name="quality "
              placeholder="Качество "
              type="number"
              min="0"
              step="1"
              autoComplete="off"
            />
          </div>
        </div>

      )
    }
    if (idReports === 0) {
      return (
        <div>


          <WorkshopId />
          <Product />
          <SeamComp />
          <StartDateEndDate />

        </div>

      )
    }
    if (idReports === 1) {
      return (
        <div>

          <ProductionAreaId />
          <Product />
          <SeamComp />
          <StartDateEndDate />
        </div>

      )
    }
    if (idReports === 2) {
      return (
        <div>
          <WelderId />
          <Product />
          <SeamComp />
          <StartDateEndDate />
        </div>

      )
    }
    if (idReports === 3) {
      return (
        <div>
          <WorkplaceId />
          <Product />
          <SeamComp />
          <StartDateEndDate />
        </div>

      )
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
                handleChange("WeldingEquipmentId", event.value)
              }}
              options={equipmentOptions}
            />
          </div>

          <StartDateEndDate />
        </div>

      )
    }
    if (idReports === 6) {
      return (
        <div>
          <WorkshopId />

          <StartDateEndDate />
        </div>

      )
    }
    if (idReports === 7) {
      return (
        <div>
          <WelderId />
          <StartDateEndDate />
        </div>

      )
    }
    if (idReports === 8) {
      return (
        <div>
          <WorkshopId />

          <StartDateEndDate />
        </div>

      )
    }
    if (idReports === 9) {
      return (
        <div>
          <ProductionAreaId />

          <StartDateEndDate />
        </div>

      )
    }
    if (idReports === 10) {
      return (
        <div>
          <WorkshopId />
          <StartDateEndDate />
        </div>

      )
    }
    if (idReports === 11) {
      return (
        <div>
          <ProductionAreaId />
          <StartDateEndDate />
        </div>

      )
    }
    if (idReports === 12) {
      return (
        <div>
          <WelderId />
          <StartDateEndDate />
        </div>

      )
    }
    if (idReports === 13) {
      return (
        <div>
          <WorkplaceId />
          <StartDateEndDate />
        </div>

      )
    }
    if (idReports === 14) {
      return (
        <div>
          <StartDateEndDate />
        </div>

      )
    }
    if (idReports === 15) {
      return (
        <div>
          <SeamComp />
          <Product />
          <StartDateEndDate />
        </div>

      )
    }
    if (idReports === 16) {
      return (
        <div>
          <StartDateEndDate />
        </div>

      )
    }
    if (idReports === 17) {
      return (
        <div>
          <CutType />
          <StartDateEndDate />
        </div>

      )
    }
    if (idReports === 18) {
      return (
        <div>
          <WorkshopId />
          <CutType />
          <StartDateEndDate />
        </div>

      )
    }
    if (idReports === 19) {
      return (
        <div>
          <ProductionAreaId />
          <CutType />
          <StartDateEndDate />
        </div>

      )
    }
    if (idReports === 20) {
      return (
        <div>
          <AccesEfficQuality />
          <StartDateEndDate />
        </div>

      )
    }
    if (idReports === 21) {
      return (
        <div>
          <AccesEfficQuality />
          <WorkplaceId />
          <StartDateEndDate />
        </div>

      )
    }
    if (idReports === 22) {
      return (
        <div>
          <AccesEfficQuality />
          <WorkshopId />
          <StartDateEndDate />
        </div>

      )
    }
    if (idReports === 23) {
      return (
        <div>
          <AccesEfficQuality />
          <ProductionAreaId />
          <StartDateEndDate />
        </div>

      )
    }
  }



  async function SendData() {
    let endpoint;
    if (idReports === 0) {
      endpoint = `excelDeviationReport/byWorkshop?WorkshopId=${initialValues.workshopId}&ProductId=${initialValues.productId}&SeamId=${initialValues.seamId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}`;
    } else if (idReports === 1) {
      endpoint = `excelDeviationReport/byProductionArea?ProductionAreaId=${initialValues.productionAreaId}&ProductId=${initialValues.productId}&SeamId=${initialValues.seamId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}`;
    } else if (idReports === 2) {
      endpoint = `excelDeviationReport/byWelder?WelderId=${initialValues.welderId}&ProductId=${initialValues.productId}&SeamId=${initialValues.seamId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}`;
    } else if (idReports === 3) {
      endpoint = `excelDeviationReport/byWorkplace?WorkplaceId=${initialValues.WorkplaceId}&ProductId=${initialValues.productId}&SeamId=${initialValues.seamId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}`;
    } else if (idReports === 4) {
      endpoint = `excelEquipmentDowntimeReport?weldingEquipmentId=${initialValues.WeldingEquipmentId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}`;
    } else if (idReports === 5) {
      endpoint = `excelEquipmentOperationTimeReport?weldingEquipmentId=${initialValues.WeldingEquipmentId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}`;
    } else if (idReports === 6) {
      endpoint = `excelSeamAmountReport/byWorkshop?workshopId=${initialValues.workshopId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}`;
    } else if (idReports === 7) {
      endpoint = `excelSeamAmountReport/byWelder?WelderId=${initialValues.welderId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}`;
    } else if (idReports === 8) {
      endpoint = `excelSeamAmountReport/byWorkplace?WorkplaceId=${initialValues.WorkplaceId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}`;
    } else if (idReports === 9) {
      endpoint = `excelSeamAmountReport/byProductionArea?ProductionAreaId=${initialValues.productionAreaId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}`;
    } else if (idReports === 10) {
      endpoint = `excelWelderOperationReport/byWorkshop?WorkshopId=${initialValues.workshopId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}`;
    } else if (idReports === 11) {
      endpoint = `excelWelderOperationReport/byProductionArea?ProductionAreaId=${initialValues.productionAreaId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}`;
    } else if (idReports === 12) {
      endpoint = `excelWelderOperationReport/byWelder?WelderId=${initialValues.welderId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}`;
    } else if (idReports === 13) {
      endpoint = `excelWelderOperationReport/byWorkplace?WorkplaceId=${initialValues.WorkplaceId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}`;
    } else if (idReports === 14) {
      endpoint = `excelWelderOperationReport?StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}`;
    } else if (idReports === 15) {
      endpoint = `excelDeviationReport?ProductId=${initialValues.productId}&SeamId=${initialValues.seamId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}`;
    } else if (idReports === 16) {
      endpoint = `excelSeamAmountReport?StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}`;
    } else if (idReports === 17) {
      endpoint = `excelEquipmentOperationAnalysisReport?StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}&CutType=${initialValues.cutType}`;
    } else if (idReports === 18) {
      endpoint = `excelEquipmentOperationAnalysisReport?WorkshopId=${initialValues.workshopId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}&CutType=${initialValues.cutType}`;
    } else if (idReports === 19) {
      endpoint = `excelEquipmentOperationAnalysisReport?ProductionAreaId=${initialValues.productionAreaId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}&CutType=${initialValues.cutType}`;
    } else if (idReports === 20) {
      endpoint = `excelEquipmentEfficiencyReport?StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}&Accessibility=${accessibility ?? null}&Efficiency=${efficiency ?? null}&Quality=${quality ?? null}`;
    } else if (idReports === 21) {
      endpoint = `excelEquipmentEfficiencyReport?WorkplaceId=${initialValues.WorkplaceId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}&Accessibility=${accessibility ?? null}&Efficiency=${efficiency ?? null}&Quality=${quality ?? null}`;
    } else if (idReports === 22) {
      endpoint = `excelEquipmentEfficiencyReport?WorkshopId=${initialValues.workshopId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}&Accessibility=${accessibility ?? null}&Efficiency=${efficiency ?? null}&Quality=${quality ?? null}`;
    } else if (idReports === 23) {
      endpoint = `excelEquipmentEfficiencyReport?ProductionAreaId=${initialValues.productionAreaId}&StartDate=${initialValues.startDate}&EndDate=${initialValues.endDate}&Accessibility=${accessibility ?? null}&Efficiency=${efficiency ?? null}&Quality=${quality ?? null}`;
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
      setisModalErrOpen(true)
    }
  }


  const TabPanel = (props_panel) => {
    const { children, value, indPanel } = props_panel;

    return (
      <div hidden={value !== indPanel}  >
        {children}
      </div>
    );
  };
  return (
    <div className={styles.innerWrapper}>
      <ToolTip
        title="Отчеты"
        toolTipText="Здесь Вы можете просмотреть отчеты"
        src={reportsImage}
      />

      <div className={styles.tableWrapper}>
        <TabPanel
          style={{ minWidth: "800px" }}
          className="TableTech"
        >
          <Table
            title="Выберите отчет"
            columns={colinstructions}
            value={0}
            data={reports} 
          />
        </TabPanel>



        {/*Формирование отчёта*/}
        <ModalWindow
          isOpen={isModalOpen}
          headerText="Формирование отчёта"
          setIsOpen={(state) => {
            setIsModalOpen(false)
          }}
          wrapperStyles={{ width: 420 }}
        >
          <Formik
            initialValues={initialValues}
            enableReinitialize
            onSubmit={(variables) => {
              const { id, ...dataToSend } = variables;
              setIsModalOpen(false)
              SendData()
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
                    <Button
                      type="submit"
                    >
                      Сформировать
                    </Button>
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
            setisModalNothinOpen(false)
          }}
          wrapperStyles={{ width: 420 }}
        >
          <Formik
            initialValues={initialValues}
            enableReinitialize
            onSubmit={(variables) => {
              const { id, ...dataToSend } = variables;
              setisModalNothinOpen(false)
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
                  <h4 style={{ padding: "35px 40px" }}>В данный момент ничего нету </h4>

                  <div className={styles.row}>
                    <Button
                      type="submit"
                    >
                      Закрыть
                    </Button>
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
            setisModalErrOpen(false)
          }}
          wrapperStyles={{ width: 420 }}
        >
          <Formik
            initialValues={initialValues}
            enableReinitialize
            onSubmit={(variables) => {
              const { id, ...dataToSend } = variables;
              setisModalErrOpen(false)
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
                  <h4 style={{ padding: "35px 40px" }}>Произошла ошибка, перепроверьте введенные данные </h4>

                  <div className={styles.row}>
                    <Button
                      type="submit"
                    >
                      Закрыть
                    </Button>
                  </div>

                </div>
              </form>
            )}
          </Formik>
        </ModalWindow>

      </div>
    </div>
  );
};
