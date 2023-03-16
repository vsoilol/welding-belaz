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
    userRole,
    techs

}) => {




    ///Выберите план из существующих дат
    const [valueChioseDate, setvalueChioseDate] = useState(0);
    const [valueDate, setvalueDate] = useState(0);


    ////////////////////////////////////////////////////////////////////



    const TabPanel = (props_panel) => {
        const { children, value, indPanel } = props_panel;
        return (
            <div hidden={value !== indPanel}  >
                {children}
            </div>
        );
    };


    ////////////////////////////////////////////////////////////////////

    const mastersOptions = masters?.map((item) => {
        return {
            value: item?.id,
            label: `${item?.middleName} ${item?.firstName}`,
        };
    });


    const techsOptions = techs?.map((item) => {
        return {
            value: item?.id,
            label: `${item?.middleName} ${item?.firstName}`,
        };
    });

    const [valueChoiseWelder, setvalueChoiseWelder] = useState(false);
    //weldingEquipmentId 
    const [valueWelder, setvalueWelder] = useState("");

    const [ProductAccountId, setProductAccountId] = useState("");



    const [valChioseMaster, setvalChioseMaster] = useState(masters[0].id);
    const [valChioseInstruct, setvalChioseInstruct] = useState(techs[0].id);


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

        if (userRole === "Admin") {
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
                    GetProductionbyDate(opteAlldate, 1)
                })
                .catch(error => {
                    console.log(error);
                });
        }
        else {
            api.get(`/productAccount/dates/${localStorage.getItem('USER_productionAreaId')}`)
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
                    GetProductionbyDate(opteAlldate, 1)
                })
                .catch(error => {
                    console.log(error);
                });
        }
    }

    //////
    const [value_products, setvalue_products] = useState([]);

    ////Получение информации о производимой продукции по текущей дате
    function GetProductionbyDate(opteAlldate, numb) {
        const date = new Date();
        const formattedDate = date.toLocaleDateString('ru-RU');

        if (numb === 1) {
            if (userRole === "Admin") {
                api.get(`/productAccount/byDate?Date=${opteAlldate[0].label}&ProductionAreaId=${masters[0]?.productionArea.id}`)
                    .then((response) => {
                        setvalue_products(response.data)
                    })
                    .catch((error) => { });
            }
            else {
                api.get(`/productAccount/byDate?Date=${opteAlldate[0].label}&ProductionAreaId=${localStorage.getItem('USER_productionAreaId')}`)
                    .then((response) => {
                        setvalue_products(response.data)
                    })
                    .catch((error) => { });
            }
        }
        else {
            if (userRole === "Admin") {

                let IdProd = masters.find(obj => obj.id === valChioseMaster)?.productionArea.id
                api.get(`/productAccount/byDate?Date=${opteAlldate}&ProductionAreaId=${IdProd}`)
                    .then((response) => {
                        setvalue_products(response.data)
                    })
                    .catch((error) => { });
            }
            else {
                api.get(`/productAccount/byDate?Date=${opteAlldate}&ProductionAreaId=${localStorage.getItem('USER_productionAreaId')}`)
                    .then((response) => {
                        setvalue_products(response.data)
                    })
                    .catch((error) => { });
            }
        }


    }

    ////Получение информации о производимой продукции по выбранной дате
    function GetProductionbyChoiseDate(date) {

        if (userRole === "Admin") {
            let IdProd = masters.find(obj => obj.id === valChioseMaster)?.productionArea.id
            api.get(`/productAccount/byDate?Date=${date}&ProductionAreaId=${IdProd}`)
                .then((response) => {
                    setvalue_products(response.data)
                })
                .catch((error) => { });
        }
        else {
            api.get(`/productAccount/byDate?Date=${date}&ProductionAreaId=${localStorage.getItem('USER_productionAreaId')}`)
                .then((response) => {
                    setvalue_products(response.data)
                })
                .catch((error) => { });
        }

    }
    const [dateCrateTask, setdateCrateTask] = useState("");


    ///Создать задание
    function CreateTask() {
        if (userRole === "Admin") {
            api.post(`/productAccount/generateTasks`, {  
                "date": new Date().toLocaleDateString('ru-RU'),
                "productionAreaId": masters.find(obj => obj.id === valChioseMaster)?.productionArea.id,
                "masterId": masters.find(obj => obj.id === valChioseMaster)?.id,
            })
                .then((response) => {
                    window.location.reload()
                })
                .catch((error) => { });
        }
        else {
            api.post(`/productAccount/generateTasks`, {
                "date": new Date().toLocaleDateString('ru-RU'),
                "productionAreaId": localStorage.getItem('USER_productionAreaId'),
                "masterId":masters[0].id
            })
                .then((response) => {
                    window.location.reload()
                })
                .catch((error) => { });
        }
       
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
        if (userRole === "Admin") {
            api.post(`/productAccount/generateEmpty`, { 
                "newDate": new Date(dateCrateTask).toLocaleDateString('ru-RU'),
                "productionAreaId": masters.find(obj => obj.id === valChioseMaster)?.productionArea.id,
            })
                .then((response) => {
                    GetProductionbyChoiseDate(valueChioseDate)
                    GetAllDate()
                })
                .catch((error) => { }); 
        }
        else {
            api.post(`/productAccount/generateEmpty`, { 
                "newDate": new Date(dateCrateTask).toLocaleDateString('ru-RU'),
                "productionAreaId": localStorage.getItem('USER_productionAreaId'), 
            })
                .then((response) => {
                    GetProductionbyChoiseDate(valueChioseDate)
                    GetAllDate()
                })
                .catch((error) => { });
        }
        
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
            .then((response) => { GetProductionbyChoiseDate(valueDate) })
            .catch((error) => { });


        api.put(`/productAccount/manufacturedAmount`, {
            "id": idPlan,
            "amount": AmountDefective
        })
            .then((response) => { GetProductionbyChoiseDate(valueDate) })
            .catch((error) => { });

        if (userRole === "Admin") {
            api.put(`/productAccount/acceptedAmount`, {
                "id": idPlan,
                "amount": Number(acceptedAmount),
                "masterId": valChioseInstruct
            })
                .then((response) => { GetProductionbyChoiseDate(valueDate) })
                .catch((error) => { });

            api.put(`/productAccount/reason`, {
                "productAccountId": ProductAccountId,
                "defectiveReason": productreason
            })
                .then((response) => { GetProductionbyChoiseDate(valueDate) })
                .catch((error) => { });
            api.put(`/productAccount/acceptedAmount`, {
                "id": idPlan,
                "amount": Number(acceptedAmount),
                "inspectorId": valChioseInstruct
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
        else {
            api.put(`/productAccount/acceptedAmount`, {
                "id": idPlan,
                "amount": Number(acceptedAmount),
                "inspectorId": techs[0].id
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
                    {userRole === "Admin"
                        ? (
                            <div>
                                <div className={styles.RowTools}>
                                    <div className={styles.toolsHead}>
                                        <p>Выберите мастера</p>
                                        <Select
                                            name="valChioseMaster"
                                            value={valChioseMaster}
                                            width="380px"
                                            placeholder="Мастера"
                                            onChange={(event) => {
                                                setvalChioseMaster(event.value);
                                                GetProductionbyDate(valueDate, 2, valChioseMaster)
                                            }}
                                            options={mastersOptions}
                                        />
                                    </div>

                                    <div className={styles.toolsHead}>
                                        <p>Выберите контролера</p>
                                        <Select
                                            name="valChioseInstruct"
                                            value={valChioseInstruct}
                                            width="380px"
                                            placeholder="Контролеры"
                                            onChange={(event) => {
                                                setvalChioseInstruct(event.value);
                                                GetProductionbyDate(valueDate, 2, valChioseInstruct)
                                            }}
                                            options={techsOptions}
                                        />
                                    </div>

                                </div>
                            </div>

                        )
                        : <div></div>
                    }
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
                                autocomplete="off"
                            /><br></br>

                            <button className={styles.create} onClick={CreatePlan}> Создать план</button>
                        </div>
                    </div>
                    {userRole === "Master" || userRole === "Admin"
                        ? (
                            <button className={styles.create} style={{ marginLeft: "15px" }} onClick={CreateTask}> Создать задание</button>
                        )
                        : (
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


                                {userRole === "Master" || userRole === "Admin"
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
                                                    autocomplete="off"
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
                                                    autocomplete="off"
                                                />
                                            </div>

                                            {userRole != "Admin"
                                               ?(
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
                                               )
                                               :<div></div>
                                            }
                                           
                                        </div>
                                    )
                                    : <div></div>
                                }

                                {userRole === "Inspector" || userRole === "Admin"
                                    ? (
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
                                                    autocomplete="off"
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
                                                    autocomplete="off"
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
                                    : <div></div>
                                }




                            </form>
                        )}
                    </Formik>
                </ModalWindow>

            </div>



        </div>
    );
};