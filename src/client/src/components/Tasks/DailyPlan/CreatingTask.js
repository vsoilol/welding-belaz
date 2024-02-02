import Button from 'components/shared/Button';
import Input from 'components/shared/Input';
import ModalWindow from 'components/shared/ModalWindow';
import Select from 'components/shared/Select';
import { Table } from 'components/shared/Table';
import { Formik } from 'formik';
import React, { useEffect, useState } from 'react';
import api from 'services/api';
import styles from '../styles.module.scss';
import errorActions from 'store/error/actions';
import { Upload } from 'components/Upload/index';
import deleteIcon from 'assets/icons/delete.png';

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

  loadTasks,
}) => {
  ///Текст и модалка ошибки
  const [errorText, seterrorText] = useState('');
  const [errorRecordsModal, seterrorRecordsModal] = useState(false);

  /* Получение данных об изготовленных изделиях, узлах и деталях  */
  const valueAddMaterial = {
    date: '',
    weldingMaterial: '',
    weldingMaterialBatchNumber: '',
  };
  const [modalAddMaterial, setModalAddMaterial] = useState(false);
  const [modalExistsDate, setmodalExistsDate] = useState(false);
  const getDetProd = async () => {
    try {
      const res = await api.get('/file/product-account-report');
      if (res.status === 200) {
        window.open(res.request.responseURL);
      }
    } catch (error) {}
  };

  ////Селекты мастеров и контролеров
  const [valChioseMaster, setvalChioseMaster] = useState('');
  const [valChioseInstruct, setvalChioseInstruct] = useState('');
  const mastersOptions = masters?.map(item => {
    return {
      value: item?.id,
      label: `${item?.middleName} ${item?.firstName}`,
    };
  });
  const techsOptions = techs?.map(item => {
    return {
      value: item?.id,
      label: `${item?.middleName} ${item?.firstName}`,
    };
  });

  ////Работа со списком дат сущ.плана
  const [valueChioseDate, setvalueChioseDate] = useState(null);
  const [valueAllDate, setValueAllDate] = useState([]);
  const [valueDate, setvalueDate] = useState(0);
  const [dateCratePlan, setdateCratePlan] = useState('');

  ///Проверка на закреп производ участ. и отправка запроса на даты
  async function CheckProduction(masterId) {
    const masterProductionArea =
      userRole === 'Admin'
        ? masters?.find(master => master.id === masterId)?.productionArea
        : masters?.find(master => master.productionArea)?.productionArea;

    if (!masterProductionArea) {
      seterrorRecordsModal(true);
      seterrorText('За данным мастером не закреплен производственный участок.');
      setValueAllDate([]);
      setvalueChioseDate(null);
      setvalue_products([]);
      setdataSelectPlan('');
    } else {
      try {
        if (userRole === 'Admin') {
          const response = await api.get(
            `/productAccount/dates/${masterProductionArea?.id}`
          );
          setValueAllDate(response.data);
        } else {
          const executorData = masterProductionArea;
          if (executorData) {
            const response = await api.get(
              `/productAccount/dates/${masterProductionArea?.id}`
            );
            setValueAllDate(response.data);
          } else {
            setValueAllDate([]);
            setvalueChioseDate(null);
            setvalue_products([]);
            setdataSelectPlan('');
          }
        }
      } catch (error) {
        setvalue_products([]);
        setdataSelectPlan('');
      }
    }
  }

  //Отобразить в таблицу план на дату из Выберите план из существующих дат
  async function DisplayPlan() {
    const masterProductionArea =
      userRole === 'Admin'
        ? masters?.find(master => master.id === valChioseMaster)?.productionArea
        : masters?.find(master => master.productionArea)?.productionArea;

    if (!masterProductionArea && !valueChioseDate) {
      seterrorRecordsModal(true);
      seterrorText('Вы не выбрали все поля');
      setValueAllDate([]);
      setvalueChioseDate(null);
      setdataSelectPlan('');
    } else {
      try {
        if (userRole === 'Admin') {
          const response = await api.get(
            `/productAccount/byDate?Date=${valueChioseDate}&ProductionAreaId=${masterProductionArea.id}`
          );
          setvalue_products(response.data);
          setdataSelectPlan(valueChioseDate);
        } else {
          const executorData = masterProductionArea;
          if (executorData) {
            const response = await api.get(
              `/productAccount/byDate?Date=${valueChioseDate}&ProductionAreaId=${masterProductionArea.id}`
            );
            setvalue_products(response.data);
            setdataSelectPlan(valueChioseDate);
          } else {
            setValueAllDate([]);
            setvalueChioseDate(null);
            setvalue_products([]);
            seterrorRecordsModal(true);
            seterrorText(
              'За данным мастером не закреплен производственный участок.'
            );
          }
        }
      } catch (error) {
        setvalueChioseDate(null);
        setValueAllDate([]);
        setvalue_products([]);
        seterrorRecordsModal(true);
        seterrorText('Ошибка . Вы не выбрали мастера');
      }
    }
  }

  //Проверка на то что есть  закреп производ участ
  function CheckForCreatePlan() {
    const masterProductionArea =
      userRole === 'Admin'
        ? masters?.find(master => master.id === valChioseMaster)?.productionArea
        : masters?.find(master => master.productionArea)?.productionArea;
    if (masterProductionArea && dateCratePlan) {
      return true;
    } else {
      return false;
    }
  }

  //Создать план на дату
  const [editExistingPlanDateModal, setEditExistingPlanDateModal] =
    useState(false);
  async function CreatePlan() {
    const masterProductionArea =
      userRole === 'Admin'
        ? masters?.find(master => master.id === valChioseMaster)?.productionArea
        : masters?.find(master => master.productionArea)?.productionArea;

    const normalizedDate = dateCratePlan.replace(
      /^(\d{2}).(\d{2}).(\d{4})$/,
      '$3-$2-$1'
    );
    if (
      valueAllDate.includes(
        new Date(normalizedDate).toLocaleDateString('ru-RU')
      )
    ) {
      setEditExistingPlanDateModal(true);
    } else if (masterProductionArea && dateCratePlan) {
      try {
        if (userRole === 'Admin') {
          api
            .post(`/productAccount/generateEmpty`, {
              newDate: new Date(dateCratePlan).toLocaleDateString('ru-RU'),
              productionAreaId: masterProductionArea.id,
            })
            .then(() => {
              CheckProduction(valChioseMaster);

              setvalueChioseDate(
                new Date(dateCratePlan).toLocaleDateString('ru-RU')
              );
            });
        } else {
          const executorData = masterProductionArea;
          if (executorData) {
            api
              .post(`/productAccount/generateEmpty`, {
                newDate: new Date(dateCratePlan).toLocaleDateString('ru-RU'),
                productionAreaId: masterProductionArea.id,
              })
              .then(() => {
                CheckProduction(valChioseMaster);

                setvalueChioseDate(
                  new Date(dateCratePlan).toLocaleDateString('ru-RU')
                );
              });
          } else {
            setValueAllDate([]);
            setvalueChioseDate(null);
          }
        }
      } catch (error) {}
    }
  }

  ///Для отображения таблицы
  const [ProductAccountId, setProductAccountId] = useState('');
  const [deleteRecordsModal, setdeleteRecordsModal] = useState(false);
  const [valueChoiseWelder, setvalueChoiseWelder] = useState(false);
  const [value_products, setvalue_products] = useState([]);

  const [dataSelectPlan, setdataSelectPlan] = useState('');
  const TabPanel = props_panel => {
    const { children, value, indPanel } = props_panel;
    return <div hidden={value !== indPanel}>{children}</div>;
  };
  const columns = [
    (userRole === 'Admin' || userRole === 'Master') && {
      title: 'Удаление',
      render: rowData => (
        <img
          className={styles.deleteIcon}
          src={deleteIcon}
          onClick={() => {
            setProductAccountId(rowData?.id);
            setdeleteRecordsModal(true);
          }}
        />
      ),
    },
    {
      title: 'Порядоковый номер ',
      field: 'number',
    },
    {
      title: 'Наименование',
      field: 'product.name',
    },
    {
      title: 'Номер',
      field: 'product.number',
    },
    {
      title: 'Наименование изделия',
      field: 'product.product.name',
    },
    {
      title: 'Номер изделия',
      field: 'product.product.number',
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
      title: 'Количество из плана ',
      field: 'amountFromPlan',
    },
    {
      title: 'Количество  изготовленной продукции  ',
      field: 'amountManufactured',
    },
    {
      title: 'Количество  забракованной продукции   ',
      field: 'amountDefective',
    },
    {
      title: 'Количество принятой продукции ',
      field: 'amountAccept',
    },

    {
      title: ' Есть ли отклонения ',
      render: rowData => (rowData?.areDeviations ? 'есть' : 'нету'),
      customFilterAndSearch: (term, rowData) => {
        const value = rowData?.areDeviations ? 'есть' : 'нету';
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
      render: rowData => {
        if (
          rowData?.weldingEquipments &&
          rowData?.weldingEquipments.length != 0
        ) {
          return rowData?.weldingEquipments?.map(equipments => (
            <p>{equipments.factoryNumber ?? '-'}</p>
          ));
        } else {
          return <span>-</span>;
        }
      },
      customFilterAndSearch: (term, rowData) => {
        if (rowData?.weldingEquipments) {
          return rowData?.weldingEquipments.some(equipments =>
            equipments.factoryNumber?.toLowerCase().includes(term.toLowerCase())
          );
        }
        return false;
      },
    },
    (userRole === 'Admin' || userRole === 'Master') && {
      title: 'Закрерить оборудование',
      render: rowData => {
        return (
          <p
            className={styles.Fix}
            onClick={e => {
              setvalueChoiseWelder(true);
              setProductAccountId(rowData?.id);
              api.post(`/eventLog`, {
                information: 'Открыл модальное окно закререпления оборудования',
              });
            }}>
            Закрерить
          </p>
        );
      },
    },
  ].filter(column => column);

  ///Кдаления записи в плане
  async function deleteRecords() {
    try {
      await api.remove(`/productAccount/${ProductAccountId}`);
      DisplayPlan();
    } catch (error) {
      console.error(error);
    }
  }

  ///Закрепление оборудования
  const [valueWelder, setvalueWelder] = useState('');
  async function FixoEquipment(valueWelder) {
    try {
      const filteredArray = equipment[0]
        ?.filter(obj => obj.active === 1)
        .map(obj => obj.id);
      await api.put(`/productAccount/assignWeldingEquipments`, {
        productAccountId: ProductAccountId,
        weldingEquipmentIds: filteredArray,
      });
      DisplayPlan();
    } catch (error) {
      console.error(error);
    }
  }
  const handleSelectChange = event => {
    if (event.active === undefined) {
      event.active = 1;
    } else if (event.active === 0) {
      event.active = 1;
    } else if (event.active === 1) {
      event.active = 0;
    }
  };

  ////Редактирование данных плана
  const [modalchangeInfoproductAccount, setmodalchangeInfoproductAccount] =
    useState(false);

  const [idPlan, setidPlan] = useState('');
  const [prodQuantities, setprodQuantities] = useState(0);
  const [manufacProducts, setmanufacProducts] = useState(0);
  const [acceptedProducts, setacceptedProducts] = useState(0);
  const [productreason, setproductreason] = useState('');
  const [prodUniqueNumber, setprodUniqueNumber] = useState(0);

  const [CheckIsProd, setCheckIsProd] = useState(false);
  async function ChangeData() {
    try {
      if (idPlan && idPlan.length > 0) {
        if (prodQuantities >= 0) {
          await api.put(`/productAccount/amountFromPlan`, {
            id: idPlan,
            amount: Number(prodQuantities),
          });
        }
        if (manufacProducts >= 0) {
          await api.put(`/productAccount/manufacturedAmount`, {
            id: idPlan,
            amount: manufacProducts,
          });
        }

        if (userRole === 'Admin') {
          if (acceptedProducts >= 0 && valChioseInstruct) {
            await api.put(`/productAccount/acceptedAmount`, {
              id: idPlan,
              amount: Number(acceptedProducts),
              inspectorId: valChioseInstruct,
            });
          } else {
            seterrorRecordsModal(true);
            seterrorText('Неверные данные контролера.');
            DisplayPlan();
            return;
          }
          if (productreason && ProductAccountId) {
            await api.put(`/productAccount/reason`, {
              productAccountId: ProductAccountId,
              defectiveReason: productreason,
            });
          }
        }
        if (userRole === 'Master') {
          if (acceptedProducts >= 0 && valChioseInstruct) {
            await api.put(`/productAccount/acceptedAmount`, {
              id: idPlan,
              amount: Number(acceptedProducts),
              inspectorId: valChioseInstruct,
            });
          } else {
            seterrorRecordsModal(true);
            seterrorText('Неверные данные контролера.');
            DisplayPlan();
            return;
          }
          if (productreason && ProductAccountId) {
            await api.put(`/productAccount/reason`, {
              productAccountId: ProductAccountId,
              defectiveReason: productreason,
            });
          }
        } else {
          if (productreason && techs[0]) {
            await api.put(`/productAccount/reason`, {
              productAccountId: ProductAccountId,
              defectiveReason: productreason,
            });
          }
          if (acceptedProducts >= 0) {
            try {
              await api.put(`/productAccount/acceptedAmount`, {
                id: idPlan,
                amount: Number(acceptedProducts),
                inspectorId: techs[0].id,
              });
            } catch (error) {
              DisplayPlan();
            }
          } else {
            seterrorRecordsModal(true);
            seterrorText('Неверные данные контролера.');
          }
        }

        // Все запросы успешно выполнены
        DisplayPlan();
        loadTasks();
      }
    } catch (error) {
      // Произошла ошибка при выполнении запросов
      console.error(error);
    }
  }

  ///Создать задание
  async function CreateTask() {
    const executor = masters?.find(
      master => master.productionArea
    )?.productionArea;
    const selectedMaster = masters.find(obj => obj.id === valChioseMaster);

    const masterId =
      userRole === 'Admin' ? valChioseMaster : executor ? executor.id : null;
    const productionAreaId =
      userRole === 'Admin'
        ? selectedMaster
          ? selectedMaster.productionArea.id
          : null
        : localStorage.getItem('USER_productionAreaId') || null;

    if (!masterId || !productionAreaId) {
      seterrorRecordsModal(true);
      seterrorText('Вы не выбрали все поля');
    } else {
      try {
        await api.post(`/productAccount/generateTasks`, {
          date: valueChioseDate,
          productionAreaId: productionAreaId,
          masterId: masterId,
        });

        api.post(`/eventLog`, {
          information: `Нажал кнопку "Создать задание"`,
        });

        setTimeout(() => {
          window.location.reload();
        }, 500);
      } catch (error) {
        // Если произошла ошибка при отправке запроса, попытаемся создать задание с другим masterId.
        try {
          const fallbackMasterId = masters.find(obj => obj.productionArea)?.id;
          if (!fallbackMasterId) {
            throw new Error('Мастер для задания не найден');
          }

          await api.post(`/productAccount/generateTasks`, {
            date: valueChioseDate,
            productionAreaId: productionAreaId,
            masterId: fallbackMasterId,
          });

          api.post(`/eventLog`, {
            information: `Нажал кнопку "Создать задание"`,
          });

          setTimeout(() => {
            window.location.reload();
          }, 500);
        } catch (fallbackError) {
          // Если произошла ошибка и при использовании fallbackMasterId, покажем сообщение пользователю.
          seterrorRecordsModal(true);
          seterrorText('Произошла ошибка при создании задания');
        }
      }
    }
  }

  ///Проверка для отображения кнопки создать задание
  function CheckForCreateTask() {
    const masterProductionArea =
      userRole === 'Admin'
        ? masters?.find(master => master.id === valChioseMaster)?.productionArea
        : masters?.find(master => master.productionArea)?.productionArea;
    if (masterProductionArea && valueChioseDate) {
      return true;
    } else {
      return false;
    }
  }

  //Если зашел не Admin
  useEffect(() => {
    if (userRole != 'Admin' || userRole != 'admin') {
      WorkWidthNotAdmin();
    }
  }, []);

  async function WorkWidthNotAdmin() {
    const executorData = masters?.find(
      master => master.productionArea
    )?.productionArea;
    if (executorData) {
      const response = await api.get(
        `/productAccount/dates/${executorData?.id}`
      );
      setValueAllDate(response.data);
    } else {
      setValueAllDate([]);
      setvalueChioseDate(null);
      setvalue_products([]);
      setdataSelectPlan('');
    }
  }

  const updateParentState = newValue => {
    setValueAllDate(newValue);
  };

  return (
    <div className={styles.TablePlan}>
      <h3>Ежедневный план</h3>
      {/*  Панель администратора выбора мастера или контролера  */}
      {userRole === 'Admin' ? (
        <div className={styles.RowTools}>
          <div className={styles.toolsHead}>
            <p>Выберите мастера</p>
            <Select
              name="valChioseMaster"
              value={valChioseMaster}
              width="380px"
              placeholder="Мастера"
              onChange={event => {
                setvalChioseMaster(event.value);
                CheckProduction(event.value);
              }}
              options={mastersOptions}
            />
          </div>
        </div>
      ) : null}
      <div className={styles.RowTools}>
        <div className={styles.toolsHead}>
          <p>Выберите план из существующих дат</p>
          <Select
            name="valueChioseDate"
            value={valueChioseDate}
            width="380px"
            placeholder="Дата"
            onChange={event => {
              setvalueChioseDate(event.value);
              setvalueDate(event.label);
            }}
            options={valueAllDate.map(date => ({
              label: date,
              value: date,
            }))}
          />
        </div>

        {userRole === 'Master' || userRole === 'Admin' ? (
          <div className={styles.toolsHead}>
            <p>Выберите дату для создания плана</p>
            <Input
              onChange={e => {
                setdateCratePlan(e.target.value);
                CheckForCreatePlan();
              }}
              width="200"
              style={{ height: 40, padding: '0 20px 0 30px', width: 380 }}
              value={dateCratePlan}
              name="dateCratePlan"
              placeholder="Дата"
              type="text"
              onFocus={e => {
                e.currentTarget.type = 'date';
              }}
              autoComplete="off"
            />
            <br></br>
          </div>
        ) : null}
      </div>

      <div className={styles.RowToolsBTNS}>
        {userRole === 'Master' ||
        userRole === 'Admin' ||
        userRole === 'Inspector' ||
        userRole === 'Technologist' ||
        userRole === 'Chief' ||
        (userRole === 'PlantManager' && valueChioseDate) ? (
          <button
            className={styles.create}
            style={{ marginLeft: '20px' }}
            onClick={DisplayPlan}>
            {' '}
            Показать план на {valueChioseDate}
          </button>
        ) : null}
        {userRole === 'Master' ||
        (userRole === 'Admin' && CheckForCreatePlan()) ? (
          <button
            className={styles.create}
            style={{ marginLeft: '20px' }}
            onClick={CreatePlan}>
            {' '}
            Создать план на{' '}
            {dateCratePlan &&
            new Date(dateCratePlan).toLocaleDateString('ru-RU') !==
              'Invalid Date'
              ? new Date(dateCratePlan).toLocaleDateString('ru-RU')
              : ''}
          </button>
        ) : null}
        {userRole === 'Master' ||
        (userRole === 'Admin' && CheckForCreateTask()) ? (
          <button
            className={`${styles.create} ${styles.createTaskBtn}`}
            style={{ marginLeft: '15px' }}
            onClick={CreateTask}>
            {' '}
            Создать задание
          </button>
        ) : null}
      </div>

      {/****----******/}
      <div className={styles.sectionGet}>
        {(userRole === 'Admin' ||
          userRole === 'Master' ||
          userRole === 'Chief' ||
          userRole === 'PlantManager' ||
          userRole === 'Inspector' ||
          userRole === 'Technologist') && (
          <div className={styles.Upload}>
            <label>
              Получение данных об изготовленных изделиях, узлах и деталях{' '}
            </label>
            <button className={styles.getDate} onClick={getDetProd}>
              Получить
            </button>
          </div>
        )}

        {(userRole === 'Admin' || userRole === 'Master') && (
          <div className={styles.Upload}>
            <label>Загрузить данные</label>
            <br></br>
            {userRole === 'Admin' || userRole === 'Master' ? (
              <div className={styles.Upload}>
                <Upload
                  Masters={masters}
                  tool={1}
                  updateParentState={updateParentState}></Upload>
              </div>
            ) : null}
          </div>
        )}
      </div>

      <h3>
        План на <span>{dataSelectPlan}</span>
      </h3>
      {/* таблица плана  */}
      <TabPanel style={{ minWidth: '1200px' }}>
        <Table
          title="Информация о производимой продукции"
          columns={columns}
          data={value_products}
          actions={
            userRole === 'Admin' ||
            userRole === 'Master' ||
            userRole === 'Technologist' ||
            userRole === 'Inspector'
              ? [
                  {
                    icon: 'edit',
                    tooltip: 'Редактировать план',
                    onClick: (event, rowData) => {
                      setidPlan(rowData?.id);
                      setprodQuantities(rowData?.amountFromPlan);
                      setCheckIsProd(rowData?.product?.product ? true : false);
                      setprodUniqueNumber(
                        rowData?.uniqueNumber != null
                          ? rowData?.uniqueNumber
                          : ''
                      );
                      setmodalchangeInfoproductAccount(true);

                      setmanufacProducts(rowData?.amountManufactured);
                      setacceptedProducts(rowData?.amountAccept);
                      setProductAccountId(rowData?.id);

                      setproductreason(rowData?.defectiveReason ?? '');
                      api.post(`/eventLog`, {
                        information:
                          'Открыл модальное окно редактирования плана',
                      });
                    },
                  },
                ]
              : []
          }
        />
      </TabPanel>

      {/*Модалка ошибки*/}
      <ModalWindow
        isOpen={errorRecordsModal}
        headerText="Ошибка"
        setIsOpen={state => {
          seterrorRecordsModal(false);
        }}
        wrapperStyles={{ width: 420 }}>
        <div>
          <h4 style={{ padding: '35px 40px' }}>{errorText}</h4>

          <div className={styles.row}>
            <Button onClick={() => seterrorRecordsModal(false)}>Закрыть</Button>
          </div>
        </div>
      </ModalWindow>
      {/*Удаление плана*/}
      <ModalWindow
        isOpen={deleteRecordsModal}
        headerText="Удаление"
        setIsOpen={state => {
          setdeleteRecordsModal(false);
        }}
        wrapperStyles={{ width: 420 }}>
        <Formik
          initialValues={initialValues}
          enableReinitialize
          onSubmit={variables => {
            const { id, ...dataToSend } = variables;
            setdeleteRecordsModal(false);
            deleteRecords();
          }}>
          {({ handleSubmit }) => (
            <form onSubmit={handleSubmit}>
              <div>
                <h4 style={{ padding: '35px 40px' }}>
                  Вы уверены что хотите <span>удалить</span> ?{' '}
                </h4>

                <div className={styles.row}>
                  <Button type="submit">Удалить</Button>
                </div>
              </div>
            </form>
          )}
        </Formik>
      </ModalWindow>

      {/*Модалка если создать план на сущ.дату*/}
      <ModalWindow
        isOpen={editExistingPlanDateModal}
        headerText="Дата уже существует"
        setIsOpen={state => {
          setEditExistingPlanDateModal(false);
        }}
        wrapperStyles={{ width: 420 }}>
        <h3 className={styles.ExistingPlan}>План на эту дату уже существует</h3>
      </ModalWindow>

      {/*Закрерить оборудования*/}
      <ModalWindow
        isOpen={valueChoiseWelder}
        headerText="Закрерить оборудование"
        setIsOpen={state => {
          setvalueChoiseWelder(false);
        }}
        wrapperStyles={{ width: 420 }}>
        <Formik
          initialValues={initialValues}
          enableReinitialize
          onSubmit={variables => {
            const { id, ...dataToSend } = variables;
            FixoEquipment(valueWelder);
            setvalueChoiseWelder(false);
          }}>
          {({
            handleSubmit,
            handleChange,
            values,
            setFieldValue,
            handleBlur,
          }) => (
            <form onSubmit={handleSubmit}>
              <div className={styles.equipments}>
                {equipment[0]?.map(option => (
                  <div>
                    <input
                      type="checkbox"
                      onChange={e => {
                        handleSelectChange(option);
                      }}
                    />
                    <span>{`${option.name} ${option.factoryNumber}`}</span>
                  </div>
                ))}
              </div>

              <div className={styles.row}>
                <Button disabled={values.shiftNumb == ''} type="submit">
                  Закрепить
                </Button>
              </div>
            </form>
          )}
        </Formik>
      </ModalWindow>

      {/*Редактировать запись в плане */}
      <ModalWindow
        isOpen={modalchangeInfoproductAccount}
        headerText="Редактировать"
        setIsOpen={state => {
          setmodalchangeInfoproductAccount(false);
        }}
        wrapperStyles={{ width: 420 }}>
        <Formik
          initialValues={initialValues}
          enableReinitialize
          onSubmit={variables => {
            const { id, ...dataToSend } = variables;
            setmodalchangeInfoproductAccount(false);
            ChangeData();
          }}>
          {({
            handleSubmit,
            handleChange,
            values,
            setFieldValue,
            handleBlur,
          }) => (
            <form onSubmit={handleSubmit}>
              {userRole === 'Master' || userRole === 'Admin' ? (
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
                                                        autoComplete="off"
                                                    /> 
                                                </div>
                                            </div>
                                            :null
                                        } */}
                  <p>Изменение количества продукции из плана </p>
                  <div className={styles.row}>
                    <Input
                      onChange={e => {
                        const re = /^[0-9]+([,.][0-9]*)?$/;
                        if (e.target.value === '' || re.test(e.target.value)) {
                          handleChange(e);
                          setprodQuantities(e.target.value);
                        }
                      }}
                      type="number"
                      min="0"
                      style={{
                        height: 40,
                        padding: '0 20px 0 30px',
                        width: '100%',
                      }}
                      value={prodQuantities}
                      name="prodQuantities"
                      placeholder="Количество забракованной продукции"
                      onBlur={handleBlur}
                      autoComplete="off"
                    />
                  </div>

                  <p>
                    Количество изготовленной продукции (указывается мастером)
                  </p>
                  <div className={styles.row}>
                    <Input
                      onChange={e => {
                        handleChange(e);
                        setmanufacProducts(e.target.value);
                      }}
                      style={{
                        height: 40,
                        padding: '0 20px 0 30px',
                        width: '100%',
                      }}
                      value={manufacProducts}
                      name="manufacProducts"
                      placeholder="Количество изготовленной продукции"
                      onBlur={handleBlur}
                      autoComplete="off"
                    />
                  </div>

                  {userRole != 'Admin' ? (
                    <div className={styles.row}>
                      <Button disabled={values.shiftNumb == ''} type="submit">
                        Изменить
                      </Button>
                    </div>
                  ) : null}
                </div>
              ) : null}

              {userRole === 'Inspector' || userRole === 'Admin' ? (
                <div>
                  <p>
                    Изменение количества принятой продукции (указывается
                    контролёра)
                  </p>
                  <div className={styles.row}>
                    <Input
                      onChange={e => {
                        handleChange(e);
                        setacceptedProducts(e.target.value);
                      }}
                      style={{
                        height: 40,
                        padding: '0 20px 0 30px',
                        width: '100%',
                      }}
                      value={acceptedProducts}
                      name="acceptedProducts"
                      placeholder="Количество принятой продукции"
                      onBlur={handleBlur}
                      autoComplete="off"
                    />
                  </div>
                  <p>Указания причин брака </p>
                  <div className={styles.row}>
                    <Input
                      onChange={e => {
                        handleChange(e);
                        setproductreason(e.target.value);
                      }}
                      style={{
                        height: 40,
                        padding: '0 20px 0 30px',
                        width: '100%',
                      }}
                      value={productreason}
                      name="productreason"
                      placeholder="Причина брака"
                      onBlur={handleBlur}
                      autoComplete="off"
                    />
                  </div>

                  <div className={styles.row}>
                    <Button disabled={values.shiftNumb == ''} type="submit">
                      Изменить
                    </Button>
                  </div>
                </div>
              ) : null}
            </form>
          )}
        </Formik>
      </ModalWindow>

      {/*Модалка если задания на дату нету*/}
      <ModalWindow
        isOpen={modalExistsDate}
        headerText=""
        setIsOpen={state => {
          setmodalExistsDate(false);
        }}
        wrapperStyles={{ width: 420 }}>
        <h3 className={styles.ExistingPlan}>Задач на эту дату не существует</h3>
      </ModalWindow>
    </div>
  );
};
