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


export const EnteringMarriage = ({


}) => {


    return (
        <div className={styles.TablePlan}>
            <h3>Ввод выработки и брака</h3>
 
 


        </div>
    );
};
