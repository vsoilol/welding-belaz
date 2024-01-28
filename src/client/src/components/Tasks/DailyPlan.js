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
import styles from "./styles.module.scss";
import errorActions from "store/error/actions";
import { useDispatch } from "react-redux";

import { CreatingTask } from "./DailyPlan/CreatingTask";

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

export const DailyPlan = ({
  masters,

  product,
  knot,
  detail,
  executors,
  initialValues,
  user,
  equipment,
  userRole,
  techs,
  loadTasks,
}) => {
  return (
    <div className={styles.innerWrapper}>
      <CreatingTask
        masters={masters}
        product={product}
        knot={knot}
        detail={detail}
        executors={executors}
        initialValues={initialValues}
        user={user}
        equipment={equipment}
        userRole={userRole}
        techs={techs}
        loadTasks={loadTasks}
      />
    </div>
  );
};
