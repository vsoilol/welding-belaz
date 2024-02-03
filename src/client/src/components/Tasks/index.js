import React, { useEffect, useState } from 'react';
import { Formik } from 'formik';
import { useDispatch } from 'react-redux';

import Tabs from '@material-ui/core/Tabs';
import Tab from '@material-ui/core/Tab';
import TableCell from '@material-ui/core/TableCell';
import TableRow from '@material-ui/core/TableRow';
import MaterialTable from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableContainer from '@material-ui/core/TableContainer';
import TableHead from '@material-ui/core/TableHead';
import SaveIcon from '@material-ui/icons/Save';

import { tasksImage } from 'assets/pics';
import deleteIcon from 'assets/icons/delete.png';

import Button from 'components/shared/Button';
import Input from 'components/shared/Input';
import ModalWindow from 'components/shared/ModalWindow';
import { Table } from 'components/shared/Table';
import ToolTip from 'components/shared/ToolTip';
import { DailyPlan } from './DailyPlan';

import api from 'services/api';

import errorActions from 'store/error/actions';

import styles from './styles.module.scss';
import { TasksTab } from './components/tasks-tab/tasks-tab';

const {
  Creators: { setError },
} = errorActions;

export const Tasks = ({
  loadTasks,
  tasks,
  loadTechs,
  techs,
  isRequesting,
  instructions,
  loadMasters,
  masters,
  userRole,
  equipment,

  loadSeam,

  loadProduct,
  loadKnot,
  loadDetail,
  loadExecutors,

  product,
  knot,
  detail,
  executors,

  user,

  loadEquipment,
}) => {
  const dispatch = useDispatch();

  const [modalDataPasport, setmodalDataPasport] = useState(false);
  const [SequenceNumber, setSequenceNumber] = useState('');
  const [NumberTask, setNumberTask] = useState(null);

  const getDocument = () => {
    const number = tasks?.tasks.find(task => task.number === NumberTask).id;
    api
      .get(
        `file/seamPassport?TaskId=${number}&SequenceNumber=${
          SequenceNumber ?? ''
        }`,
        {
          responseType: 'arraybuffer',
          dataType: 'blob',
        }
      )
      .then(response => {
        const file = new Blob([response['data']], {
          type: 'application/pdf',
        });
        const fileURL = URL.createObjectURL(file);
        window.open(fileURL);
      })
      .catch(error => dispatch(setError(error?.response?.data?.title ?? '')));
  };

  const [value_panel, setValue] = useState(0);
  const ChangePanels = (event, newValue) => {
    setValue(newValue);
  };

  const [idPlan, setidPlan] = useState('');

  const [isChecked1, setIsChecked1] = useState(false);

  const [deleteTaskModal, setdeleteTaskModal] = useState(false);

  const [getFailebasedPassport, setgetFailebasedPassport] = useState(false);
  const [BasedPassportId, setBasedPassportId] = useState('');

  const initialValuesbasedPassport = {
    SequenceNumber: '',
    AverageIntervalSeconds: '',
    SecondsToIgnoreBetweenGraphs: '',
  };

  function GetFailebasedPassport(params) {
    api
      .get(
        `file/based-seam-passport?TaskId=${BasedPassportId}&SequenceNumber=${
          params.SequenceNumber ?? ''
        }&AverageIntervalSeconds=&SecondsToIgnoreBetweenGraphs=`,
        {
          responseType: 'arraybuffer',
          dataType: 'blob',
        }
      )
      .then(response => {
        const file = new Blob([response['data']], {
          type: 'application/pdf',
        });
        const fileURL = URL.createObjectURL(file);
        window.open(fileURL);
      })
      .catch(error => {});
  }

  return (
    <div className={styles.innerWrapper}>
      <ToolTip
        title="Задания"
        toolTipText="Здесь Вы можете назначить задания на сварку, посмотреть паспорт сварного стыка"
        src={tasksImage}
      />

      {(userRole === 'Admin' ||
        userRole === 'Master' ||
        userRole === 'Inspector' ||
        userRole === 'Chief' ||
        userRole === 'PlantManager' ||
        userRole === 'Technologist') && (
        <Tabs
          value={value_panel}
          onChange={ChangePanels}
          indicatorColor="primary"
          textColor="primary"
          aria-label="full width tabs example">
          <Tab label="Сменные задания на сварку " />
          <Tab label="Ежедневный план" />
        </Tabs>
      )}

      <div className={styles.tableWrapper}>
        {/* <TabPanel
          value={value_panel}
          indPanel={0}
          style={{ minWidth: '1200px' }}>

          <TasksTab />
        </TabPanel> */}

        {value_panel === 0 && (
          // <DailyPlan
          //   masters={masters}
          //   product={product}
          //   knot={knot}
          //   detail={detail}
          //   executors={executors}
          //   initialValues={initialValues}
          //   user={user}
          //   equipment={equipment}
          //   userRole={userRole}
          //   techs={techs}
          //   loadTasks={loadTasks}
          // />
          <TasksTab />
        )}

        {/*Ежедневный план*/}
        {value_panel === 1 && (
          // <DailyPlan
          //   masters={masters}
          //   product={product}
          //   knot={knot}
          //   detail={detail}
          //   executors={executors}
          //   initialValues={initialValues}
          //   user={user}
          //   equipment={equipment}
          //   userRole={userRole}
          //   techs={techs}
          //   loadTasks={loadTasks}
          // />
          <div></div>
        )}

        {/*Получение краткого паспорта */}
        <ModalWindow
          isOpen={getFailebasedPassport}
          headerText="Получение паспорта"
          setIsOpen={state => {
            setgetFailebasedPassport(false);
          }}
          wrapperStyles={{ width: 420 }}>
          <Formik
            initialValues={initialValuesbasedPassport}
            enableReinitialize
            onSubmit={variables => {
              const { id, ...dataToSend } = variables;
              setgetFailebasedPassport(false);
              GetFailebasedPassport(variables, id);
            }}>
            {({ handleSubmit, handleChange, values, handleBlur }) => (
              <form onSubmit={handleSubmit}>
                <div>
                  <div className={styles.row}>
                    <Input
                      onChange={e => {
                        handleChange(e);
                      }}
                      style={{
                        height: 40,
                        padding: '0 20px 0 30px',
                        width: '100%',
                      }}
                      value={values.SequenceNumber}
                      name="SequenceNumber"
                      placeholder="Порядковый номер"
                      onBlur={handleBlur}
                      autoComplete="off"
                    />
                  </div>

                  <div className={styles.row}>
                    <Button type="submit">Получить</Button>
                  </div>
                </div>
              </form>
            )}
          </Formik>
        </ModalWindow>

        {/*Получение паспорта */}
        <ModalWindow
          isOpen={modalDataPasport}
          headerText="Получение паспорта"
          setIsOpen={state => {
            setmodalDataPasport(false);
          }}
          wrapperStyles={{ width: 420 }}>
          <Formik
            initialValues={initialValuesbasedPassport}
            enableReinitialize
            onSubmit={() => {
              setmodalDataPasport(false);
              getDocument();
            }}>
            {({ handleSubmit, handleBlur }) => (
              <form onSubmit={handleSubmit}>
                <div>
                  <div className={styles.row}>
                    <Input
                      onChange={e => {
                        setSequenceNumber(e.target.value);
                      }}
                      style={{
                        height: 40,
                        padding: '0 20px 0 30px',
                        width: '100%',
                      }}
                      value={SequenceNumber}
                      name="SequenceNumber"
                      placeholder="Порядковый номер"
                      onBlur={handleBlur}
                      autoComplete="off"
                    />
                  </div>

                  <div className={styles.row}>
                    <Button type="submit">Получить</Button>
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
