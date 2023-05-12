import Paper from "@material-ui/core/Paper";
import MaterialTable from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import SaveIcon from "@material-ui/icons/Save";
import { workPlaceImage } from "assets/pics";
import Button from "components/shared/Button";
import EquipmentMap from "components/Map";
import Modal from "components/shared/Modal";
import Input from "components/shared/Input";
import ModalWindow from "components/shared/ModalWindow";
import { ResultsModal } from "components/shared/ResultsModal";
import Select from "components/shared/Select";
import { Table } from "components/shared/Table";
import ToolTip from "components/shared/ToolTip";
import { Formik } from "formik";
import React, { useEffect, useState } from "react";
import styles from "components/WorkPlace/styles.module.css";



import axios from "axios";
import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";
import api from "services/api";




const dateOptions = {
    day: "numeric",
    month: "short",
    year: "numeric",
};

 

export const Weldingtask = ({
    weldingtask
}) => {

    const columns = [
        {
            title: "Сварщик",
            field: "name",
        },
        {
            title: "Продукция",
            field: "productCat",
        },
        {
            title: "Наименование продукции",
            field: "product",
        },
        {
            title: "Количество",
            render: (rowData) => {
                return (
                    <form  >
                        <input className={styles.inputCount} type="text" value={rowData.count} />
                    </form>
                )
            },
        },
    ]

    const columnsData = [
        {
            name: "Сергей	Хурсанов	Анатольевич",
            product: "Картер заднего моста",
            productCat: "Изделие",
            count: 5
        },
        {
            name: "Олег	Канапацкий	Дмитриевич",
            product: "Кронштейн амортизатора левый",
            productCat: "Узел",
            count: 10
        },
        {
            name: "Павел	Ходот	Антонович",
            productCat: "Деталь",
            product: "Кронштейн",
            count: 1
        },
    ]



    const TabPanel = (props_panel) => {
        const { children, value, indPanel } = props_panel;
        return <div hidden={value !== indPanel}>{children}</div>;
    };
    ////////////////////////////////////////////////////////////////////
    return (
        <div className={styles.innerWrapper}>

            <div className={styles.tableWrapper}>
                <TabPanel
                    style={{ minWidth: "800px" }}
                >
                    <Table
                        title="Ввод данных о изготовлении, приемке продукции и учете брака"
                        columns={columns}
                        data={columnsData}
                    />
                </TabPanel>
            </div>

        </div>
    );
};
