
import React, { useEffect, useState, useCallback } from "react";
import styles from "./index.module.css";
import ToolTip from "components/shared/ToolTip";
import { reportsImage } from "assets/pics";
import { Table } from "components/shared/Table";
import { ResultsModal } from "components/shared/ResultsModal";
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
import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";
import Paper from "@material-ui/core/Paper";
import deleteIcon from "assets/icons/delete.png";
import { Upload } from "components/Upload/index";

const CreatesUser = ({

}) => {


  const [panelId, setpanelId] = useState(0);


  const [allUsers, setallUsers] = useState(null);
  const [aleventLog, setaleventLog] = useState(null);


  const [modalData, setModalData] = useState(null);
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [isModalChangeLoginOpen, setisModalChangeLoginOpen] = useState(false);
  const [isResultsModalOpen, setIsResultsModalOpen] = useState(false);
  const [activeExecutor, setActiveExecutor] = useState("");

  const [selectRole, setselectRole] = useState("");
  const [isModalConfiOpen, setisModalConfiOpen] = useState(false);
  const [isModalErrOpen, setisModalErrOpen] = useState(false);
  const [isModalComplitChangLogPassOpen, setisModalComplitChangLogPassOpen] = useState(false);
  const [isModalComplitChangLogPassErrOpen, setisModalComplitChangLogPassErrOpen] = useState(false);
  const [deleteRecordsModal, setdeleteRecordsModal] = useState(false);
  const [idUser, setidUser] = useState("");


  const initialValues = {
    id: modalData?.id ?? "",
    email: modalData?.email ?? "",
    firstName: modalData?.firstName ?? "",
    lastName: modalData?.lastName ?? "",
    middleName: modalData?.middleName ?? "",
    position: modalData?.position ?? "",
    serviceNumber: modalData?.serviceNumber ?? "",

    login: modalData?.login ?? "",
    password: modalData?.password ?? "",
  };
  useEffect(() => {
    fetchUsers();
    fetchEventLog();
  }, []);
  //Получение всех пользователей
  async function fetchUsers() {
    try {
      const response = await api.get(`/users`);
      setallUsers(response.data)
    } catch (error) {
      console.log(error);
    }
  }


  ////Получение всех записей в журнале 
  async function fetchEventLog() {
    try {
      const response = await api.get(`/eventLog`);
      const result = response.data.reduce((acc, curr) => {
        const userIndex = acc.findIndex((item) => item.user.id === curr.user.id);
        if (userIndex === -1) {
          acc.push({
            user: curr.user,
            data: [curr],
          });
        } else {
          acc[userIndex].data.push(curr);
        }
        return acc;
      }, []);
      setaleventLog(result)
    } catch (error) {
      console.log(error);
    }
  }

  const renderRowChildren = (rowData) => { 
    return (
      rowData?.data && (
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
                  Дата
                </TableCell>

                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                >
                  Время
                </TableCell>
                <TableCell
                  style={{
                    borderBottom: 0,
                  }}
                  align="center"
                >
                  Действие
                </TableCell>
                
              </TableRow> 
            </TableHead>
            {rowData?.data?.map(info =>
              <TableBody>
                <TableRow>
                  <TableCell align="center" component="th" scope="row">
                    {info?.date ?? "-"}
                  </TableCell>
                  <TableCell align="center" component="th" scope="row">
                    {info?.time ?? "-"}
                  </TableCell>
                  <TableCell align="center">
                    {info?.information ?? "-"}
                  </TableCell>       
                </TableRow>
              </TableBody>
            )}
            
          </MaterialTable>
        </TableContainer>
      )
    );
  };
  const ChangePanelId = (event, newValue) => {
    setpanelId(newValue)
  };

  const TabPanel = (props_panel) => {
    const { children, value, indPanel } = props_panel;

    return (
      <div hidden={value !== indPanel}  >
        {children}
      </div>
    );
  };


  const colUsers = [
    {
      title: "Удаление",
      render: (rowData) => (
        <img
          className={styles.deleteIcon}
          src={deleteIcon}
          onClick={() => {
            setdeleteRecordsModal(true);
            setidUser(rowData?.id)
          }}
        />
      ),
    },
    {
      title: "Фамилия ", field: "middleName",

    },
    {
      title: "Имя ", field: "firstName",

    },
    {
      title: "Отчество ", field: "lastName",
    },
    {
      title: "Email", field: "email",
      render: rowData => rowData?.email ? rowData?.email : "-"
    },
    {
      title: "Email подтвержден ",
      field: "isEmailConfirmed",
      render: (rowData) => {
        if (rowData?.isEmailConfirmed) {
          return <span className={styles.green}>подтвержден</span>
        } else {
          return <span className={styles.red}>не подтвержден</span>
        }
      },
    },
    {
      title: "Роль",
      field: "role",
      lookup: {
        1: "Администратор",
        2: "Мастер",
        3: "Сварщик",
        4: "Контролёр",
        5: "Руководитель цеха",
        6: "Представитель УКК",
        7: "Руководитель завода",
        8: "Технолог",
      },
    },
    {
      title: "Изменение логина и пароля",
      render: (rowData) => {
        if (rowData?.isEmailConfirmed) {
          return <div className={styles.btnTools} onClick={(e) => { setisModalChangeLoginOpen(true); setModalData(rowData); }} >Измененить</div>
        } else {
          return <span>-</span>
        }

      }
    },
    {
      title: "Подтверждение электронной почты",
      render: (rowData) => {
        return <div className={styles.btnTools} onClick={(e) => { ConfirmationEmail(rowData?.id) }}>Подтвердить</div>
      }
    },
  ]


  const opteRole = [
    { id: 1, name: "Администратор" },
    { id: 2, name: "Мастер" },
    { id: 3, name: "Сварщик" },
    { id: 4, name: "Контролёр" },
    { id: 5, name: "Руководитель цеха" },
    { id: 6, name: "Представитель УКК" },
    { id: 7, name: "Руководитель завода" },
    { id: 8, name: "Технолог" },
  ].map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });
  const coleventLog = [
    {
      title: "Фамилия ", field: "user.middleName",

    },
    {
      title: "Имя ", field: "user.firstName",

    },
    {
      title: "Отчество ", field: "user.lastName",
    },
    /* {
      title: "Дата ", field: "date",
    },
    {
      title: "Время ", field: "time",
    },
    {
      title: "Действие ", field: "information",
    }, */
  ]

  function ConfirmationEmail(params) {
    api.post(`auth/send-email-confirmation/${params}`)
      .then((response) => {
        setisModalConfiOpen(true)
      })
      .catch((error) => {
        setisModalErrOpen(true)
      });
  }

  function SendData(params) {

    if (modalData) {
      //Редактировать пользователя 
      api.put(`users`, {
        "id": params.id,
        "firstName": params.firstName,
        "middleName": params.middleName,
        "lastName": params.lastName,
        "email": params.email,
        "role": selectRole
      })
        .then((response) => {
          fetchUsers()
        })
        .catch((error) => { });
    }
    else {
      //Создать пользователя
      api.post(`users`, {
        "firstName": params.firstName,
        "middleName": params.middleName,
        "lastName": params.lastName,
        "email": params.email,
        "role": selectRole
      })
        .then((response) => {
          fetchUsers()
        })
        .catch((error) => { });

    }

  }


  function ChangeLoginPass(params) {
    api.post(`auth/user-credentials`, {
      "userName": params.login,
      "password": params.password,
      "userId": params.id
    })
      .then((response) => {
        setisModalComplitChangLogPassOpen(true)
      })
      .catch((error) => {
        setisModalComplitChangLogPassErrOpen(true)
      });
  }

  function deleteUser(idUser) {
    api.remove(`/users/${idUser}`)
      .then((response) => { fetchUsers() })
      .catch((error) => { });
  }

  return (
    <div className={styles.innerWrapper}>


      <ToolTip
        title="Панель администратора"
        toolTipText="Здесь вы можете создать пользователя, изменить данные пользователя "
        src={reportsImage}
      />

      <Tabs
        value={panelId}
        onChange={ChangePanelId}
        indicatorColor="primary"
        textColor="primary"
        aria-label="full width tabs example"
      >
        <Tab label="Список пользователей " />
        <Tab label="Список записей в журнале " />

      </Tabs>

       {
        
       }

      <div className={styles.tableWrapper}>
        {panelId === 0
          ? (
            <TabPanel
              style={{ minWidth: "800px", }}
              className="TableTech"
            >
              <Table
                title="Список пользователей "
                columns={colUsers}
                value={0}
                data={allUsers ?? []}
                actions={
                  [
                    {
                      icon: "add",
                      tooltip: "Добавить пользователя",
                      isFreeAction: true,
                      onClick: () => {
                        setIsModalOpen(true);
                      },
                    },
                    {
                      icon: "edit",
                      tooltip: "Редактировать пользователя",
                      onClick: (event, rowData) => {
                        setIsModalOpen(true);
                        setModalData(rowData);
                        setselectRole(rowData?.role)
                      },
                    },
                  ]
                }
              />
            </TabPanel>
          )
          : <div></div>

        }
        {panelId === 1
          ? (

            <TabPanel
              style={{ minWidth: "800px", }}
              className="TableTech"
            >
              <Table
                title="Список записей в журнале"
                columns={coleventLog}
                value={0}
                data={aleventLog}
                renderRowChildren={renderRowChildren}
              />
            </TabPanel>
          )
          : <div></div>
        }
      </div>


      <ResultsModal
        type={"EXECUTOR"}
        activeId={activeExecutor}
        isOpen={isResultsModalOpen}
        setIsOpen={setIsResultsModalOpen}
      />
      <ModalWindow
        isOpen={isModalOpen}
        headerText={
          modalData ? "Редактировать пользователя" : "Создать пользователя"
        }
        setIsOpen={(state) => {
          setIsModalOpen(state);
          setModalData(null);
        }}
        wrapperStyles={{ width: 600 }}
      >
        <Formik
          initialValues={initialValues}
          enableReinitialize
          onSubmit={(variables) => {
            const { id, ...dataToSend } = variables;
            SendData(variables)
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
            <form className={styles.form} onSubmit={handleSubmit}>

              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    if (/^[а-яА-ЯЁё\s]+$/.test(e.target.value)) {
                      handleChange(e);
                    }
                  }}
                  width="200"
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.middleName}
                  name="middleName"
                  placeholder="Фамилия"
                  onBlur={handleBlur}
                  autocomplete="off"
                />


                <Input
                  onChange={(e) => {
                    if (/^[а-яА-ЯЁё\s]+$/.test(e.target.value)) {
                      handleChange(e);
                    }
                  }}
                  width="200"
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.firstName}
                  name="firstName"
                  placeholder="Имя"
                  onBlur={handleBlur}
                  autocomplete="off"
                />
                <Input
                  onChange={(e) => {
                    if (/^[а-яА-ЯЁё\s]+$/.test(e.target.value)) {
                      handleChange(e);
                    }
                  }}
                  style={{ height: 40, padding: "0 20px 0 30px" }}
                  value={values.lastName}
                  name="lastName"
                  placeholder="Отчество"
                  onBlur={handleBlur}
                  autocomplete="off"
                />
              </div>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    handleChange(e);
                  }}
                  style={{ height: 40, width: 562 }}
                  value={values.email}
                  name="email"
                  placeholder="email "
                  onBlur={handleBlur}
                  autocomplete="off"
                />
              </div>
              <div className={styles.row}>
                <Select
                  name="selectRole"
                  width="380px"
                  value={selectRole}
                  placeholder="Роль"
                  onChange={(event) => setselectRole(event.value)}
                  options={opteRole}
                />
              </div>

              <Upload tool={0}></Upload>
              <div className={styles.row}>
                <Button
                  disabled={
                    values.middleName == "" || values.firstName == "" || values.lastName == "" || values.rfidTag == ""
                  }
                  type="submit"
                >
                  {modalData ? "Сохранить" : "Создать"}
                </Button>
              </div>
            </form>
          )}
        </Formik>
      </ModalWindow>

      <ModalWindow
        isOpen={isModalChangeLoginOpen}
        headerText={"Изменение логина и пароля"}
        setIsOpen={(state) => {
          setisModalChangeLoginOpen(state);
          setModalData(null);
        }}
        wrapperStyles={{ width: 600 }}
      >
        <Formik
          initialValues={initialValues}
          enableReinitialize
          onSubmit={(variables) => {
            const { id, ...dataToSend } = variables;
            setisModalChangeLoginOpen(false);
            setModalData(null);
            ChangeLoginPass(variables)
          }}
        >
          {({
            handleSubmit,
            handleChange,
            values,
            setFieldValue,
            handleBlur,
          }) => (
            <form className={styles.form} onSubmit={handleSubmit}>

              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    if (values === "" || /^[^а-яА-ЯёЁ]+$/.test(e.target.value)) {
                      handleChange(e);
                    }
                  }}
                  style={{ height: 40, width: 462 }}
                  value={values.login}
                  name="login"
                  placeholder="login"
                  onBlur={handleBlur}
                  autoComplete="off"
                />
              </div>
              <div className={styles.row}>
                <Input
                  onChange={(e) => {
                    if (values === "" || /^[A-Za-z0-9-]+$/.test(e.target.value)) {
                      handleChange(e);
                    }
                  }}
                  style={{ height: 40, width: 462 }}
                  value={values.password}
                  name="password"
                  placeholder="password "
                  onBlur={handleBlur}
                  autocomplete="off"
                />
              </div>


              <div className={styles.row}>
                <Button
                  disabled={
                    values.login == "" || values.password == ""
                  }
                  type="submit"
                >
                  {"Сохранить"}
                </Button>
              </div>
            </form>
          )}
        </Formik>
      </ModalWindow>

      {/*Подтверждение электронной почты модалка*/}
      <ModalWindow
        isOpen={isModalConfiOpen}
        headerText="Подтверждение"
        setIsOpen={(state) => {
          setisModalConfiOpen(false)
        }}
        wrapperStyles={{ width: 420 }}
      >
        <Formik
          initialValues={initialValues}
          enableReinitialize
          onSubmit={(variables) => {
            const { id, ...dataToSend } = variables;
            setisModalConfiOpen(false)
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
                <h4 style={{ padding: "35px 40px" }}>Сообщение на подтверждения электронной почты было отправлено </h4>

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
                <h4 style={{ padding: "35px 40px" }}>Сообщение было отправлено ранее, пожалуйста, проверьте почту.</h4>

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


      {/**/}
      <ModalWindow
        isOpen={isModalComplitChangLogPassOpen}
        headerText=""
        setIsOpen={(state) => {
          setisModalComplitChangLogPassOpen(false)
        }}
        wrapperStyles={{ width: 420 }}
      >
        <Formik
          initialValues={initialValues}
          enableReinitialize
          onSubmit={(variables) => {
            const { id, ...dataToSend } = variables;
            setisModalComplitChangLogPassOpen(false)
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
                <h4 style={{ padding: "35px 40px" }}>Данные были обновлены</h4>

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
      <ModalWindow
        isOpen={isModalComplitChangLogPassErrOpen}
        headerText="Ошибка"
        setIsOpen={(state) => {
          setisModalComplitChangLogPassErrOpen(false)
        }}
        wrapperStyles={{ width: 420 }}
      >
        <Formik
          initialValues={initialValues}
          enableReinitialize
          onSubmit={(variables) => {
            const { id, ...dataToSend } = variables;
            setisModalComplitChangLogPassErrOpen(false)
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


      {/*Удаление */}
      <ModalWindow
        isOpen={deleteRecordsModal}
        headerText="Удаление"
        setIsOpen={(state) => {
          setdeleteRecordsModal(false)
        }}
        wrapperStyles={{ width: 420 }}
      >
        <Formik
          initialValues={{}}
          enableReinitialize
          onSubmit={(variables) => {
            const { id, ...dataToSend } = variables;
            setdeleteRecordsModal(false)
            deleteUser(idUser)
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
                <h4 style={{ padding: "35px 40px" }}>Вы уверены что хотите <span>удалить</span> пользователя ? </h4>

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
export default CreatesUser;