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
import { Upload } from "components/Upload/index";
import deleteIcon from "assets/icons/delete.png";
import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";

const {
    Creators: { setError },
} = errorActions;


export const CreatingTask = ({
    masters,

    product,
    knot,
    detail,
    executors,
    user,
    initialValues,
    equipment,
    userRole,
    techs,

    loadTasks

}) => {

    const [modalData, setModalData] = useState(null);


    const [valChioseMaster, setvalChioseMaster] = useState(masters[0].id);
    const [valChioseInstruct, setvalChioseInstruct] = useState(techs[0].id);
    const [valueDate, setvalueDate] = useState(0);
    const [dateCratePlan, setdateCratePlan] = useState("");
    const [toDay, settoDay] = useState(new Date().toLocaleDateString('ru-RU'));

    const [CheckIsProd, setCheckIsProd] = useState(false);

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
    ////Работа со списком дат сущ.плана  
    const [valueAllDate, setValueAllDate] = useState([]);
    const [valueChioseDate, setvalueChioseDate] = useState(null);
    useEffect(() => {
        fetchData();  
    }, []);
    async function fetchData() {
        try {
            const response = await api.get(`/productAccount/dates/${masters[0]?.productionArea.id}`);
            setValueAllDate(response.data);
        } catch (error) {
            console.log(error);
        }
    }

    ////Получение информации о производимой продукции по дате
    function GetProductionbyDate(date) {
        const productionAreaId = userRole === "Admin"
            ? masters.find(obj => obj.id === valChioseMaster)?.productionArea.id
            : localStorage.getItem('USER_productionAreaId');

        api.get(`/productAccount/byDate?Date=${date}&ProductionAreaId=${productionAreaId}`)
            .then((response) => {
                setvalue_products(response.data);
            })
            .catch((error) => { });
    }
    const TabPanel = (props_panel) => {
        const { children, value, indPanel } = props_panel;
        return (
            <div hidden={value !== indPanel}  >
                {children}
            </div>
        );
    };
    const [value_products, setvalue_products] = useState([]);
    const [valueChoiseWelder, setvalueChoiseWelder] = useState(false);
    const [deleteRecordsModal, setdeleteRecordsModal] = useState(false);
    const columns = [
        (userRole === "Admin" || userRole === "Master") && {
            title: "Удаление",
            render: (rowData) => (
                <img
                    className={styles.deleteIcon}
                    src={deleteIcon}
                    onClick={() => {
                        setProductAccountId(rowData?.id)
                        setdeleteRecordsModal(true);
                    }}
                />
            ),
        },
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
            title: "Наименование изделия", field: "product.product.name",
        },
        {
            title: "Номер изделия", field: "product.product.number",
        },
        /* {
            title: "Уникальный номер", 
            field: "uniqueNumber",
            render: rowData => rowData?.uniqueNumber ? rowData?.uniqueNumber: '-',
            customFilterAndSearch: (term, rowData) => {
                const value = rowData?.uniqueNumber ? rowData?.uniqueNumber: '-';
                return value.toLowerCase().includes(term.toLowerCase());
            },
        }, */
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
            render: rowData => rowData?.areDeviations ? 'есть' : 'нету',
            customFilterAndSearch: (term, rowData) => {
                const value = rowData.areDeviations ? 'есть' : 'нету';
                return value.toLowerCase().includes(term.toLowerCase());
            },
            customSort: (a, b) => {
                const valueA = a.areDeviations ? 'есть' : 'нету';
                const valueB = b.areDeviations ? 'есть' : 'нету';
                return valueA.localeCompare(valueB);
            },
        },
        {
            field: 'weldingEquipments',
            title: 'Оборудование (инвентарный номер)',
            render: (rowData) => {
                if (rowData?.weldingEquipments && rowData?.weldingEquipments.length != 0) {
                    return (
                        rowData.weldingEquipments?.map(equipments =>
                            <p>{equipments.factoryNumber ?? '-'}</p>
                        )
                    )
                } else {
                    return <span>-</span>
                }
            },
            customFilterAndSearch: (term, rowData) => {
                if (rowData.weldingEquipments) {
                    return rowData.weldingEquipments.some(equipments => equipments.factoryNumber?.toLowerCase().includes(term.toLowerCase()))
                }
                return false
            }
        },
        {
            title: "Закрерить оборудование",
            render: (rowData) => {
                return <p className={styles.Fix} onClick={e => {
                    setvalueChoiseWelder(true);
                    setProductAccountId(rowData?.id)
                    api.post(`/eventLog`, {
                        "information": "Открыл модальное окно закререпления оборудования"
                    })
                }}>Закрерить</p>;
            },
        },
    ].filter(column => column);


    ////Редактирование данных плана
    const [modalchangeInfoproductAccount, setmodalchangeInfoproductAccount] = useState(false);
    const [editExistingPlanDateModal, setEditExistingPlanDateModal] = useState(false);
    const [ProductAccountId, setProductAccountId] = useState("");


    const [idPlan, setidPlan] = useState("");



    const [prodQuantities, setprodQuantities] = useState(0);
    const [manufacProducts, setmanufacProducts] = useState(0);
    const [acceptedProducts, setacceptedProducts] = useState(0);
    const [productreason, setproductreason] = useState("");
    const [prodUniqueNumber, setprodUniqueNumber] = useState(0);


    ///Создание плана 
    async function CreatePlan() {
        const normalizedDate = dateCratePlan.replace(/^(\d{2}).(\d{2}).(\d{4})$/, '$3-$2-$1');
        if (valueAllDate.includes(new Date(normalizedDate).toLocaleDateString('ru-RU'))) {
            setEditExistingPlanDateModal(true);
        } else {
            const productionAreaId = userRole === "Admin"
                ? masters.find(obj => obj.id === valChioseMaster)?.productionArea.id
                : localStorage.getItem('USER_productionAreaId');
            api.post(`/productAccount/generateEmpty`, {
                "newDate": new Date(dateCratePlan).toLocaleDateString('ru-RU'),
                "productionAreaId": productionAreaId,
            })
                .then(async (response) => {
                    fetchData();
                    console.log(new Date(normalizedDate).toLocaleDateString('ru-RU'))
                    setvalueChioseDate(new Date(normalizedDate).toLocaleDateString('ru-RU'));
                    setvalueDate(new Date(normalizedDate).toLocaleDateString('ru-RU'))
                    GetProductionbyDate(new Date(normalizedDate).toLocaleDateString('ru-RU'))

                    api.post(`/eventLog`, {
                        "information": `Создание плана на ${new Date(normalizedDate).toLocaleDateString('ru-RU')}`
                    })
                })
                .catch((error) => { });
        }
    }
    //Изменение ввода выработки и брака
    async function ChangeData() {
        try {
            if (idPlan && idPlan.length > 0) {

                if (prodQuantities >= 0) {
                    await api.put(`/productAccount/amountFromPlan`, {
                        "id": idPlan,
                        "amount": Number(prodQuantities)
                    });
                }
                if (CheckIsProd && prodUniqueNumber >= 0) {
                    await api.put(`/productAccount/unique-number`, {
                        "ProductAccountId ": idPlan,
                        "UniqueNumber ": Number(CheckIsProd)
                    });
                }
                if (manufacProducts >= 0) {
                    await api.put(`/productAccount/manufacturedAmount`, {
                        "id": idPlan,
                        "amount": manufacProducts
                    });
                }

                if (userRole === "Admin") {
                    if (acceptedProducts >= 0 && techs[0] && techs[0].id) {
                        await api.put(`/productAccount/acceptedAmount`, {
                            "id": idPlan,
                            "amount": Number(acceptedProducts),
                            "inspectorId": techs[0].id
                        });
                    }
                    if (productreason && ProductAccountId) {
                        await api.put(`/productAccount/reason`, {
                            "productAccountId": ProductAccountId,
                            "defectiveReason": productreason
                        });
                    }

                } else {
                    if (acceptedProducts >= 0 && techs[0] && techs[0].id) {
                        await api.put(`/productAccount/acceptedAmount`, {
                            "id": idPlan,
                            "amount": Number(acceptedProducts),
                            "inspectorId": techs[0].id
                        });
                    }
                    if (productreason) {
                        await api.put(`/productAccount/reason`, {
                            "productAccountId": ProductAccountId,
                            "defectiveReason": productreason
                        });
                    }
                }

                // Все запросы успешно выполнены
                GetProductionbyDate(valueChioseDate);
                loadTasks();
            }
        } catch (error) {
            // Произошла ошибка при выполнении запросов
            console.error(error);
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
    ///Закрепление оборудования
    const [valueWelder, setvalueWelder] = useState("");
    async function FixoEquipment(valueWelder) {
        try {
            const filteredArray = equipment[0]?.filter(obj => obj.active === 1).map(obj => obj.id);
            await api.put(`/productAccount/assignWeldingEquipments`, {
                "productAccountId": ProductAccountId,
                "weldingEquipmentIds": filteredArray
            });
            GetProductionbyDate(valueChioseDate);
        } catch (error) {
            console.error(error);
        }
    }
    //Удаление записи в плане 
    async function deleteRecords() {
        try {
            await api.remove(`/productAccount/${ProductAccountId}`);
            GetProductionbyDate(valueChioseDate);
        } catch (error) {
            console.error(error);
        }
    }
    ///Создать задание
    function CreateTask() {
        const masterId = userRole === "Admin" ? valChioseMaster : masters[0].id;
        const productionAreaId = userRole === "Admin" ? masters.find(obj => obj.id === valChioseMaster)?.productionArea.id : localStorage.getItem('USER_productionAreaId');

        api.post(`/productAccount/generateTasks`, {
            "date": valueChioseDate,
            "productionAreaId": productionAreaId,
            "masterId": masterId,
        })
            .then((response) => {
                api.post(`/eventLog`, {
                    "information": `Нажал кнопку "Создать задание"`
                })
                setTimeout(() => {
                    window.location.reload();
                }, 500);
            })
            .catch((error) => { });
    }

    async function getDetProd() {
        try {
            const res = await api.get("/file/product-account-report");
            if (res.status === 200) {
                window.open(res.request.responseURL);
            }
        } catch (error) {

        }
    } 



    const [modalAddMAterial, setmodalAddMAterial] = useState(false);
    const [modalExistsDate, setmodalExistsDate] = useState(false);
    const valueAddMaterial = {
        date: "",
        weldingMaterial: "",
        weldingMaterialBatchNumber: "",
    };
    function setMaterial(variables) { 
        api.put(`/WeldingTask/welding-material`, {
            "date": new Date(variables.date).toLocaleDateString('ru-RU', { dateStyle: 'short' }),
            "weldingMaterial": variables.weldingMaterial,
            "weldingMaterialBatchNumber": `${variables.weldingMaterialBatchNumber??null}`,
        })
            .then((response) => {
                window.location.reload();
            })
            .catch((error) => {
                setmodalExistsDate(true)
             });
    }


    return (
        <div className={styles.TablePlan}>
            <h3>Ежедневный план</h3>
            {/*  Панель администратора выбора мастера или контролера  */}
            {userRole === "Admin"
                ? (
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
                                    GetProductionbyDate(valueChioseDate, 2, valChioseMaster)
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
                                    GetProductionbyDate(valueChioseDate, 2, valChioseInstruct)
                                }}
                                options={techsOptions}
                            />
                        </div>

                    </div>
                )
                : null
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
                            setvalueChioseDate(event.value);
                            setvalueDate(event.label)
                            GetProductionbyDate(event.label)
                        }}
                        options={valueAllDate.map((date) => ({
                            label: date,
                            value: date,
                        }))}
                    />
                </div>

                <div className={styles.toolsHead}>
                    <p>Выберите дату для создания плана</p>
                    <Input
                        onChange={(e) => {
                            setdateCratePlan(e.target.value)
                            settoDay(new Date(e.target.value).toLocaleDateString('ru-RU'))
                        }}
                        width="200"
                        style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
                        value={dateCratePlan}
                        name="dateCratePlan"
                        placeholder="Дата"
                        type="text"
                        onFocus={(e) => {
                            e.currentTarget.type = "date";
                        }}
                        autocomplete="off"
                    /><br></br>


                </div>


            </div>
            <div className={styles.RowToolsBTNS}>
                {userRole === "Master" || userRole === "Admin"
                    ? (
                        <button className={styles.create} style={{ marginLeft: "20px" }} onClick={CreatePlan}> Создать план на {
                            dateCratePlan && new Date(dateCratePlan).toLocaleDateString('ru-RU') !== 'Invalid Date'
                                ? new Date(dateCratePlan).toLocaleDateString('ru-RU')
                                : ''
                        }</button>
                    )
                    : null
                }

                {userRole === "Master" || userRole === "Admin"
                    ? <button className={`${styles.create} ${styles.createTaskBtn}`} style={{ marginLeft: "15px" }} onClick={CreateTask} > Создать задание</button>
                    : null
                }
                {userRole === "Admin" || userRole === "Master"
                    ? <div className={styles.Upload}><Upload tool={1}></Upload></div>
                    : null
                }
            </div>
            <div className={styles.sectionGet}>

                {userRole === "Admin" || userRole === "Master"
                    ? <div className={styles.Upload}>
                        <label>Получение данных об изготовленных изделиях, узлах и деталях </label>
                        <button className={styles.getDate} onClick={(e) => { getDetProd() }}>Получить</button>
                    </div>
                    : null
                }
            </div>
            <div className={styles.sectionGet}>

                {userRole === "Admin" || userRole === "Master"
                    ? <div className={styles.Upload}>
                        <label>Добавление сварочных материалов </label>

                        <button className={styles.addMater} onClick={(e) => { setmodalAddMAterial(true) }}>Добавить</button>
                    </div>
                    : null
                }
            </div>

            <h3>План на <span>{valueChioseDate}</span></h3>
            {/* таблица плана  */}
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
                                icon: "add",
                                tooltip: "Добавить изделие",
                                isFreeAction: true,
                                onClick: () => {
                                    /* setIsModalOpen(true); 
                                    setValuetOpenModal(0);
                                    api.post(`/eventLog`,{
                                      "information": "Открыл модальное окно добавления пользователя "
                                    })  */
                                },
                            },
                            {
                                icon: "edit",
                                tooltip: "Редактировать план",
                                onClick: (event, rowData) => {
                                    setCheckIsProd(rowData?.product?.product ? true : false);
                                    setprodUniqueNumber(rowData?.uniqueNumber != null ? rowData?.uniqueNumber : "")
                                    setmodalchangeInfoproductAccount(true)
                                    setidPlan(rowData?.id)
                                    setprodQuantities(rowData?.amountFromPlan)
                                    setmanufacProducts(rowData?.amountManufactured)
                                    setacceptedProducts(rowData?.amountAccept)
                                    /* api.post(`/eventLog`, {
                                        "information": "Открыл модальное окно редактирования плана"
                                    }) */
                                },
                            },
                        ]

                    }
                />
            </TabPanel>

            {/*Добавление сварочных материалов*/}
            <ModalWindow
                isOpen={modalAddMAterial}
                headerText="Добавление сварочных материалов "
                setIsOpen={(state) => {
                    setmodalAddMAterial(false)
                }}
                wrapperStyles={{ width: 420 }}
            >
                <Formik
                    initialValues={valueAddMaterial}
                    enableReinitialize
                    onSubmit={(variables) => {
                        const { id, ...dataToSend } = variables;
                        setmodalAddMAterial(false)
                        setMaterial(variables)
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
                                    width="200"
                                    style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
                                    value={values.date}
                                    name="date"
                                    placeholder="Дата  "
                                    type="text"
                                    onFocus={(e) => {
                                        e.currentTarget.type = "date";
                                    }}
                                    onBlur={handleBlur}
                                    autocomplete="off"
                                />
                            </div>
                            <div className={styles.row}>
                                <Input
                                    onChange={(e) => {
                                        handleChange(e);
                                    }}
                                    style={{
                                        width: 380,
                                        height: 40,
                                    }}
                                    value={values.weldingMaterial}
                                    name={`weldingMaterial`}
                                    placeholder="Наименование сварочного материала "
                                    autocomplete="off"
                                />
                            </div>
                            <div className={styles.row}>
                                <Input
                                    onChange={(e) => {
                                        handleChange(e);
                                    }}
                                    style={{
                                        width: 380,
                                        height: 40, 
                                    }}
                                    type="number"
                                    min="0"
                                    step="1"
                                    value={values.weldingMaterialBatchNumber}
                                    name={`weldingMaterialBatchNumber`}
                                    placeholder="Номер партии сварочного материала "
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
                                    Закрепить
                                </Button>
                            </div>
                        </form>
                    )}
                </Formik>
            </ModalWindow>


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
                        ChangeData()
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
                                        {/* {CheckIsProd
                                            ?<div>
                                                <p>Изменение уникального номера  </p>
                                                <div className={styles.row}>
                                                    <Input 
                                                        onChange={(e) => {
                                                            const re = /^[0-9]+([,.][0-9]*)?$/;
                                                            if (e.target.value === '' || re.test(e.target.value)) {
                                                                handleChange(e);
                                                                setprodUniqueNumber(e.target.value)
                                                            }
                                                        }} 
                                                        type="number"
                                                        min="0"
                                                        style={{ height: 40, padding: "0 20px 0 30px", width: "100%" }}
                                                        value={prodUniqueNumber}
                                                        name="prodUniqueNumber"
                                                        placeholder="Уникальный номер"
                                                        onBlur={handleBlur}
                                                        autocomplete="off"
                                                    /> 
                                                </div>
                                            </div>
                                            :null
                                        } */}
                                        <p>Изменение количества продукции из плана  </p>
                                        <div className={styles.row}>
                                            <Input
                                                onChange={(e) => {
                                                    const re = /^[0-9]+([,.][0-9]*)?$/;
                                                    if (e.target.value === '' || re.test(e.target.value)) {
                                                        handleChange(e);
                                                        setprodQuantities(e.target.value)
                                                    }
                                                }}
                                                type="number"
                                                min="0"
                                                style={{ height: 40, padding: "0 20px 0 30px", width: "100%" }}
                                                value={prodQuantities}
                                                name="prodQuantities"
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
                                                    setmanufacProducts(e.target.value)

                                                }}
                                                style={{ height: 40, padding: "0 20px 0 30px", width: "100%" }}
                                                value={manufacProducts}
                                                name="manufacProducts"
                                                placeholder="Количество изготовленной продукции"
                                                onBlur={handleBlur}
                                                autocomplete="off"
                                            />
                                        </div>



                                        {userRole != "Admin"
                                            ? (
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
                                            : null
                                        }

                                    </div>
                                )
                                : null
                            }

                            {userRole === "Inspector" || userRole === "Admin"
                                ? (
                                    <div>
                                        <p>Изменение количества принятой продукции   (указывается контролёра)</p>
                                        <div className={styles.row}>
                                            <Input
                                                onChange={(e) => {
                                                    handleChange(e);
                                                    setacceptedProducts(e.target.value)
                                                }}
                                                style={{ height: 40, padding: "0 20px 0 30px", width: "100%" }}
                                                value={acceptedProducts}
                                                name="acceptedProducts"
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
                                : null
                            }




                        </form>
                    )}
                </Formik>
            </ModalWindow>
            {/*Модалка если создать план на сущ.дату*/}
            <ModalWindow
                isOpen={editExistingPlanDateModal}
                headerText="Дата уже существует"
                setIsOpen={(state) => {
                    setEditExistingPlanDateModal(false)
                }}
                wrapperStyles={{ width: 420 }}
            >
                <h3 className={styles.ExistingPlan}>План на эту дату уже существует</h3>
            </ModalWindow>
            {/*Модалка если задания на дату нету*/}
            <ModalWindow
                isOpen={modalExistsDate}
                headerText=""
                setIsOpen={(state) => {
                    setmodalExistsDate(false)
                }}
                wrapperStyles={{ width: 420 }}
            >
                <h3 className={styles.ExistingPlan}>Задач на эту дату не существует</h3>
            </ModalWindow>
            {/*Удаление задания*/}
            <ModalWindow
                isOpen={deleteRecordsModal}
                headerText="Удаление"
                setIsOpen={(state) => {
                    setdeleteRecordsModal(false)
                }}
                wrapperStyles={{ width: 420 }}
            >
                <Formik
                    initialValues={initialValues}
                    enableReinitialize
                    onSubmit={(variables) => {
                        const { id, ...dataToSend } = variables;
                        setdeleteRecordsModal(false)
                        deleteRecords()
                    }}
                >
                    {({
                        handleSubmit,
                    }) => (
                        <form onSubmit={handleSubmit}>

                            <div>
                                <h4 style={{ padding: "35px 40px" }}>Вы уверены что хотите <span>удалить</span>  ? </h4>

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

