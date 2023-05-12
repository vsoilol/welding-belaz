
import Button from "components/shared/Button";
import Input from "components/shared/Input";
import ModalWindow from "components/shared/ModalWindow";
import Select from "components/shared/Select";
import { Formik } from "formik";
import React, { useEffect, useState } from "react";
import styles from "components/WorkPlace/styles.module.css";




export const SeamForm = ({
    valueProdArea, 
    valuetPosts,
    valuetTechProc,
    valuetSeam,
    valuetWorkPlace,
    valueWorkplace,
    isModalNumb,
    addSeam,
    editSeam,
    isModalOpen,
    setIsModalOpen,
    setValueWorkplace, 
    initialValues,
    workplaceIdOptions,
    setValuetPosts,
    setValuetTechProc,
    setvaluetProduct,
    setvaluetKnots,
    setvaluetDetail,
    area,
    posts,
    optPosts,
    TechProc,
    valuetProduct,
    productsOptions,
    valuetKnots,
    knotsOptions,
    detailOptions,
    valuetDetail,
}) => {

    const [modalData, setModalData] = useState(null);
    ///Изменение заголовка модалки
    function TitleTextModal(params) {

        if (params === 7) {
            return "Редактировать Сварочный шов"
        }

        if (params === 15) {
            return "Добавить Сварочный шов"
        }
    }
    function SetValue(valueId, index) {

        ///area
        if (index === 1) {
          for (let index = 0; index < area.length; index++) {
            if (area[index].id === valueId) {
              return area[index].number
            }
          }
        }
        ///post
        if (index === 2) {
          for (let index = 0; index < posts.length; index++) {
            if (posts[index].id === valueId) {
              return posts[index].number
            }
          }
        }
      }
    //Запрос на редактирование или добавление
    function SendData(variables) {

      
        variables["workshopId"] = valueProdArea
        variables["workshopNumber"] = SetValue(valueProdArea, 0)
        console.log("variables")
        variables["productionAreaId"] = valuetPosts
        variables["productionAreaNumber"] = SetValue(valuetPosts, 1)

        variables["technologicalProcessId"] = valuetTechProc

        variables["seams"] = [valuetSeam]

        variables["postId"] = valuetWorkPlace
        variables["workplaceId"] = valueWorkplace


        console.log("variables")
        //Добавить Сварочный шов
        if (isModalNumb == 15) {
            addSeam(variables)
        }
        //Редактировать Сварочный шов
        if (isModalNumb == 7) {
            editSeam(variables)
        }

    }
 
    ////////////////////////////////////////////////////////////////////
    return (
        <ModalWindow
            isOpen={isModalOpen}
            headerText={TitleTextModal(isModalNumb)}
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
                    SendData(variables)
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
                                style={{ width: 380, height: 40, padding: "0 20px 0 30px" }}
                                value={values.number}
                                name="number"
                                type="number"
                                min="0"
                                step="1"
                                placeholder="Номер"
                                onBlur={handleBlur}
                                autocomplete="off"
                            />
                        </div>

                        <div className={styles.row}>
                            <Select
                                name="valueWorkplace"
                                value={valueWorkplace}
                                width="380px"
                                placeholder="Рабочее место"
                                onChange={(event) => {
                                    setValueWorkplace(event.value)
                                }}
                                options={workplaceIdOptions}
                            />
                        </div>

                        <div className={styles.row}>
                            <Select
                                name="valuetPosts"
                                width="380px"
                                value={valuetPosts}
                                placeholder="Производственные участки"
                                onChange={(event) => setValuetPosts(event.value)}
                                options={optPosts}
                            />
                        </div>


                        <div className={styles.row}>
                            <Select
                                name="valuetTechProc"
                                width="380px"
                                value={valuetTechProc}
                                placeholder="Технологический процесс"
                                onChange={(event) => setValuetTechProc(event.value)}
                                options={TechProc}
                            />
                        </div>


                        {/*изделие, узел и деталь */}
                        {/* <div className={styles.row}>
                            <Select
                                name="valuetProduct"
                                width="380px"
                                value={valuetProduct}
                                placeholder="Изделие"
                                onChange={(event) => setvaluetProduct(event.value)}
                                options={productsOptions}
                            />
                        </div>
                        <div className={styles.row}>
                            <Select
                                name="valuetKnots"
                                width="380px"
                                value={valuetKnots}
                                placeholder="Узел"
                                onChange={(event) => setvaluetKnots(event.value)}
                                options={knotsOptions}
                            />
                        </div>
                        <div className={styles.row}>
                            <Select
                                name="valuetDetail"
                                width="380px"
                                value={valuetDetail}
                                placeholder="Деталь"
                                onChange={(event) => setvaluetDetail(event.value)}
                                options={detailOptions}
                            />
                        </div> */}





                        <div className={styles.row}>
                            <Button
                                type="submit"  
                            >
                                {modalData ? "Сохранить" : "Создать"}
                            </Button>
                        </div>
                    </form>

                )}
            </Formik>

        </ModalWindow>
    );
};
