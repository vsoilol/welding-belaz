import SaveIcon from "@material-ui/icons/Save";
import { tasksImage } from "assets/pics";
import Button from "components/shared/Button";
import Input from "components/shared/Input";
import ModalWindow from "components/shared/ModalWindow";
import Select from "components/shared/Select";
import { Table } from "components/shared/Table";
import ToolTip from "components/shared/ToolTip";
import { Formik } from "formik";
import React, { useEffect, useState } from "react";
import api from "services/api";
import styles from "../styles.module.css";
import errorActions from "store/error/actions";
import { useDispatch } from "react-redux";


import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";

const {
    Creators: { setError },
} = errorActions;

const dateOptions = {
    day: "numeric",
    month: "short",
    year: "numeric",
};

export const CreatingTask = ({
    masters,

    product,
    knot,
    detail,
    executors,
    initialValues,
    user,
    equipment,
    userRole

}) => {
    const [isModalOpen, setIsModalOpen] = useState(false);
    const [modalData, setModalData] = useState(null);
    const dispatch = useDispatch();


    const [production, setProduction] = useState(1);

    const [welderValue, setwelderValue] = useState("");


    ////Массивы продукции
    const [productArray, setproductArray] = useState([]);

    const formattedMasters = masters?.map((item) => {
        return {
            value: item.masterId,
            label: `${item.surname} ${item.name}`,
        };
    });

    ///Выберите план из существующих дат
    const [valueChioseDate, setvalueChioseDate] = useState(0);
    const [valueDate, setvalueDate] = useState(0);




    useEffect(() => {
        GetProductionbyDate();
    }, []);


    ////////////////////////////////////////////////////////////////////



    const [value_panel, setValue] = useState(0);
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

    const ProdArray = [
        {
            id: 1,
            name: "Изделия"
        },
        {
            id: 2,
            name: "Узлы"
        },
        {
            id: 3,
            name: "Детали"
        },
    ]

    const columnsWorkplace = {
        goods: [
            {
                title: "Закрепить изделие",
                render: (rowData) => {
                    return <input type="checkbox"  ></input>
                },
            },
            {
                title: "Наименование изделия ", field: "name"
            },
            {
                title: "Номер  изделия ", field: "number"
            },

            {
                title: "Номер  цеха ", field: "workshop.number"
            },
            {
                title: "Номер  производственного участка ", field: "productionArea.number"
            },
            {
                title: "Наименование   технологического процесса  ", field: "technologicalProcess.name"
            },
            {
                title: "Номер  технологического процесса  ", field: "technologicalProcess.number"
            },
        ],
        node: [
            {
                title: "Закрепить изделие",
                render: (rowData) => {
                    return <input type="checkbox"  ></input>
                },
            },
            {
                title: "Наименование узла ", field: "name"
            },
            {
                title: "Номер  узла ", field: "number"
            },

            {
                title: "Номер  цеха ", field: "workshop.number"
            },
            {
                title: "Номер  производственного участка ", field: "productionArea.number"
            },
            {
                title: "Наименование   технологического процесса  ", field: "technologicalProcess.name"
            },
            {
                title: "Номер  технологического процесса  ", field: "technologicalProcess.number"
            },


        ],
        details: [
            {
                title: "Закрепить изделие",
                render: (rowData) => {
                    return <input type="checkbox"   ></input>
                },
            },
            {
                title: "Наименование детали ", field: "name"
            },
            {
                title: "Номер  детали ", field: "number"
            },

            {
                title: "Номер  цеха ", field: "workshop.number"
            },
            {
                title: "Номер  производственного участка ", field: "productionArea.number"
            },
            {
                title: "Наименование   технологического процесса  ", field: "technologicalProcess.name"
            },
            {
                title: "Номер  технологического процесса  ", field: "technologicalProcess.number"
            },

        ],

    };

    ////////////////////////////////////////////////////////////////////



    const [valueChoiseWelder, setvalueChoiseWelder] = useState(false);
    //weldingEquipmentId
    const [weldingEquipmentId, setweldingEquipmentId] = useState(null);
    const [valueWelder, setvalueWelder] = useState("");

    const [ProductAccountId, setProductAccountId] = useState("");


    const columns = [

        {
            title: "Порядоковый номер ", field: "number"
        },
        {
            title: "Наименование", field: "product.name"
        },
        {
            title: "Номер", field: "product.number"
        },
        {
            title: "Количество из плана ", field: "amountFromPlan"
        },
        {
            title: "Количество  изготовленной продукции  ", field: "amountManufactured"
        },
        {
            title: "Количество  забракованной продукции   ", field: "amountDefective"
        },
        {
            title: "Количество принятой продукции ", field: "amountAccept"
        },

        {
            title: " Есть ли отклонения ",
            render: (rowData) => {
                if (rowData?.areDeviations) {
                    return <span>есть</span>
                }
                else {
                    return <span>нету</span>
                }
            },
        },
        {
            title: "Оборудование  ( инвентарный номер )",
            render: (rowData) => {
                if (rowData?.weldingEquipments && rowData?.weldingEquipments.length != 0) {
                    return (
                        rowData.weldingEquipments?.map(equipments =>
                            <p>{equipments.factoryNumber ?? "-"}</p>
                        )
                    )
                }
                else {
                    return <span>-</span>
                }
            },
        },
        {
            title: "Закрерить оборудование",
            render: (rowData) => {
                return <p className={styles.Fix} onClick={e => { setvalueChoiseWelder(true); setProductAccountId(rowData?.id) }}>Закрерить</p>;
            },
        },

    ]


    ////Получение всех дат по Id производственного участка 

    const [valueAllDate, setvalueAllDate] = useState([]);
    useEffect(() => {
        GetAllDate()
    }, []);

    function GetAllDate() {
        api.get(`/productAccount/dates/${masters[0]?.productionArea.id}`)
            .then(response => response)
            .then(data => {

                const objectArray = data.data.map((dateString, index) => {
                    return { date: dateString, id: index };
                });
                const opteAlldate = objectArray.map((item) => {
                    return {
                        value: item.id,
                        label: item.date,
                    };
                });
                setvalueAllDate(opteAlldate)
                setvalueDate(opteAlldate[0].label)
            })
            .catch(error => {
                console.log(error);
            });
    }

    //////
    const [value_products, setvalue_products] = useState([]);

    ////Получение информации о производимой продукции по текущей дате
    function GetProductionbyDate() {
        const date = new Date();
        const formattedDate = date.toLocaleDateString('ru-RU');

        api.get(`/productAccount/byDate?Date=${formattedDate}&ProductionAreaId=${localStorage.getItem('USER_productionAreaId')}`)
            .then((response) => {
                setvalue_products(response.data)
            })
            .catch((error) => { });
    }

    ////Получение информации о производимой продукции по выбранной дате
    function GetProductionbyChoiseDate(date) {
        api.get(`/productAccount/byDate?Date=${date}&ProductionAreaId=${localStorage.getItem('USER_productionAreaId')}`)
            .then((response) => {
                setvalue_products(response.data)
            })
            .catch((error) => { });
    }
    const [dateCrateTask, setdateCrateTask] = useState("");


    ///Создать задание
    function CreateTask() {

        api.post(`/productAccount/generateTasks`, {
            "Date": new Date().toLocaleDateString('ru-RU'),
            "newDate": new Date(dateCrateTask).toLocaleDateString('ru-RU'),
            "productionAreaId": localStorage.getItem('USER_productionAreaId'),
            "UserId": localStorage.getItem('USERID')
        })
            .then((response) => {
                window.location.reload()
            })
            .catch((error) => { });
    }

    ///Закрепление оборудования
    function FixoEquipment(valueWelder) {

        const filteredArray = equipment[0]?.filter(obj => obj.active === 1).map(obj => obj.id);
        api.put(`/productAccount/assignWeldingEquipments`, {
            "productAccountId": ProductAccountId,
            "weldingEquipmentIds": filteredArray
        })
            .then((response) => {
                GetProductionbyChoiseDate(valueDate)
            })
            .catch((error) => { });
    }

    ///Создать плана
    function CreatePlan() {

        api.post(`/productAccount/generateEmpty`, {
            // "date": new Date().toLocaleDateString('ru-RU'),
            "newDate": new Date(dateCrateTask).toLocaleDateString('ru-RU'),
            "productionAreaId": localStorage.getItem('USER_productionAreaId'),
            "UserId": localStorage.getItem('USERID')
        })
            .then((response) => {
                GetProductionbyChoiseDate(valueChioseDate)
                GetAllDate()
            })
            .catch((error) => { });
    }


    ////Редактирование данных плана
    const [modalchangeInfoproductAccount, setmodalchangeInfoproductAccount] = useState(false);

    const [AmountManufactured, setAmountManufactured] = useState(0);
    const [AmountDefective, setAmountDefective] = useState(0);


    const [acceptedAmount, setacceptedAmount] = useState(0);
    const [productreason, setproductreason] = useState("");

    const [idPlan, setidPlan] = useState("");

    function ChangeManufacturedDefective(AmountManufactured, AmountDefective) {
        api.put(`/productAccount/amountFromPlan`, {
            "id": idPlan,
            "amount": AmountManufactured
        })
            .then((response) => {GetProductionbyChoiseDate(valueDate) })
            .catch((error) => { });


        api.put(`/productAccount/manufacturedAmount`, {
            "id": idPlan,
            "amount": AmountDefective
        })
            .then((response) => { GetProductionbyChoiseDate(valueDate) })
            .catch((error) => { });

        api.put(`/productAccount/acceptedAmount`, {
            "id": idPlan,
            "amount": Number(acceptedAmount),
            "userId": localStorage.getItem('USERID')
        })
            .then((response) => { GetProductionbyChoiseDate(valueDate) })
            .catch((error) => { });


        api.put(`/productAccount/reason`, {
            "productAccountId": ProductAccountId,
            "defectiveReason": productreason
        })
            .then((response) => { GetProductionbyChoiseDate(valueDate) })
            .catch((error) => { });

    }
    const handleSelectChange = (event) => {
        if (event.active === undefined) {
            event.active = 1
        }
        else if (event.active === 0) {
            event.active = 1
        }
        else if (event.active === 1) {
            event.active = 0
        }
    };
    return (
        <div className={styles.TablePlan}>
            <h3>Ежедневный план</h3>

            <div className={styles.tools}>

                <div>
                    <div className={styles.RowTools}>
                        <div className={styles.toolsHead}>
                            <p>Выберите план из существующих дат</p>
                            <Select
                                name="valueChioseDate"
                                value={valueChioseDate}
                                width="380px"
                                placeholder="Дата"
                                onChange={(event) => {
                                    GetProductionbyChoiseDate(event.label)
                                    setvalueChioseDate(event.value);
                                    setvalueDate(event.label)
                                }}
                                options={valueAllDate}
                            />
                            {/* <button className={styles.create}> Создать </button> */}
                        </div>

                        <div className={styles.toolsHead}>
                            <p>Выберите дату для создания плана</p>
                            <Input
                                onChange={(e) => {
                                    // handleChange(e);
                                    setdateCrateTask(e.target.value)
                                }}
                                width="200"
                                style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
                                value={dateCrateTask}
                                name="dateCrateTask"
                                placeholder="Дата"
                                type="text"
                                onFocus={(e) => {
                                    e.currentTarget.type = "date";
                                }}
                            /><br></br>

                            <button className={styles.create} onClick={CreatePlan}> Создать план</button>
                        </div>
                    </div>
                    {userRole==="Master"
                      ?(
                        <button className={styles.create} style={{ marginLeft: "15px" }} onClick={CreateTask}> Создать задание</button>
                      )
                      :(
                        <div></div>
                      )

                    }
                    

                    <TabPanel
                        style={{ minWidth: "1200px", }}
                    >
                        <Table
                            title="Информация о производимой продукции"
                            columns={columns}
                            data={value_products}
                            actions={
                                [
                                    {
                                        icon: "edit",
                                        tooltip: "Редактировать план",
                                        onClick: (event, rowData) => {
                                            setAmountManufactured(rowData?.amountFromPlan)
                                            setAmountDefective(rowData?.amountManufactured)
                                            setidPlan(rowData?.id)
                                            setmodalchangeInfoproductAccount(true)
                                            setProductAccountId(rowData?.id)
                                            setacceptedAmount(rowData?.amountAccept)
                                        },
                                    },
                                ]

                            }
                        />
                    </TabPanel>


                </div>
                {/*Закрерить оборудования*/}
                <ModalWindow
                    isOpen={valueChoiseWelder}
                    headerText="Закрерить оборудование"
                    setIsOpen={(state) => {
                        setvalueChoiseWelder(false)
                    }}
                    wrapperStyles={{ width: 420 }}
                >
                    <Formik
                        initialValues={initialValues}
                        enableReinitialize
                        onSubmit={(variables) => {
                            const { id, ...dataToSend } = variables;
                            FixoEquipment(valueWelder)
                            setvalueChoiseWelder(false)
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

                                <div className={styles.equipments} >
                                    {equipment[0]?.map((option) => (
                                        <div   >
                                            <input
                                                type="checkbox"
                                                onChange={e => { handleSelectChange(option) }}
                                            />
                                            <span>{`${option.name} ${option.factoryNumber}`}</span>
                                        </div>
                                    ))}
                                </div>

                                <div className={styles.row}>
                                    <Button
                                        disabled={
                                            values.shiftNumb == ""
                                        }
                                        type="submit"
                                    >
                                        Закрепить
                                    </Button>
                                </div>
                            </form>
                        )}
                    </Formik>
                </ModalWindow>


                {/*Ввод выработки и брака*/}
                <ModalWindow
                    isOpen={modalchangeInfoproductAccount}
                    headerText="Редактировать"
                    setIsOpen={(state) => {
                        setmodalchangeInfoproductAccount(false)
                    }}
                    wrapperStyles={{ width: 420 }}
                >
                    <Formik
                        initialValues={initialValues}
                        enableReinitialize
                        onSubmit={(variables) => {
                            const { id, ...dataToSend } = variables;
                            setmodalchangeInfoproductAccount(false)
                            ChangeManufacturedDefective(AmountManufactured, AmountDefective)
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


                                {userRole === "Master"
                                    ? (
                                        <div>
                                            <p>Изменение количества продукции из плана  </p>
                                            <div className={styles.row}>
                                                <Input
                                                    onChange={(e) => {
                                                        handleChange(e);
                                                        setAmountManufactured(e.target.value)
                                                    }}
                                                    style={{ height: 40, padding: "0 20px 0 30px", width: "100%" }}
                                                    value={AmountManufactured}
                                                    name="AmountManufactured"
                                                    placeholder="Количество забракованной продукции"
                                                    onBlur={handleBlur}
                                                />

                                            </div>

                                            <p>Количество изготовленной продукции (указывается мастером)</p>
                                            <div className={styles.row}>
                                                <Input
                                                    onChange={(e) => {
                                                        handleChange(e);
                                                        setAmountDefective(e.target.value)

                                                    }}
                                                    style={{ height: 40, padding: "0 20px 0 30px", width: "100%" }}
                                                    value={AmountDefective}
                                                    name="AmountDefective"
                                                    placeholder="Количество изготовленной продукции"
                                                    onBlur={handleBlur}
                                                />
                                            </div>

                                            <div className={styles.row}>
                                                <Button
                                                    disabled={
                                                        values.shiftNumb == ""
                                                    }
                                                    type="submit"
                                                >
                                                    Изменить
                                                </Button>
                                            </div>
                                        </div>
                                    )
                                    : (
                                        <div>
                                            <p>Изменение количества принятой продукции   (указывается контролёра)</p>
                                            <div className={styles.row}>
                                                <Input
                                                    onChange={(e) => {
                                                        handleChange(e);
                                                        setacceptedAmount(e.target.value)
                                                    }}
                                                    style={{ height: 40, padding: "0 20px 0 30px", width: "100%" }}
                                                    value={acceptedAmount}
                                                    name="acceptedAmount"
                                                    placeholder="Количество принятой продукции"
                                                    onBlur={handleBlur}
                                                />

                                            </div>
                                            <p>Указания причин брака   </p>
                                            <div className={styles.row}>
                                                <Input
                                                    onChange={(e) => {
                                                        handleChange(e);
                                                        setproductreason(e.target.value)
                                                    }}
                                                    style={{ height: 40, padding: "0 20px 0 30px", width: "100%" }}
                                                    value={productreason}
                                                    name="productreason"
                                                    placeholder="Причина брака"
                                                    onBlur={handleBlur}
                                                />

                                            </div>

                                            <div className={styles.row}>
                                                <Button
                                                    disabled={
                                                        values.shiftNumb == ""
                                                    }
                                                    type="submit"
                                                >
                                                    Изменить
                                                </Button>
                                            </div>
                                        </div>
                                    )
                                }




                            </form>
                        )}
                    </Formik>
                </ModalWindow>

            </div>



        </div>
    );
};
