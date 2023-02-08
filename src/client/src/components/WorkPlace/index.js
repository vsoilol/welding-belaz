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
import styles from "./styles.module.css";



import axios from "axios";
import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";
import api from "services/api";


/////компоненты
import { Workshop } from "components/WorkPlace/components";
import { ProductionArea } from "components/WorkPlace/components";
import { Posts } from "components/WorkPlace/components";
import { Place } from "components/WorkPlace/components";


import { Product } from "components/WorkPlace/components";
import { Knot } from "components/WorkPlace/components";
import { Detail } from "components/WorkPlace/components";
import { Seam } from "components/WorkPlace/components";





const dateOptions = {
  day: "numeric",
  month: "short",
  year: "numeric",
};

export const WorkPlace = ({
  addFixedProduct,
  loadMasters,
  loadTechs,
  loadExecutors,
  ///Workshop

  loadWorkshop,
  addWorkshop,
  editWorkshop,
  ///Area 
  loadArea,
  addArea,
  editArea,
  ///Posts 
  loadPosts,
  addPosts,
  editPosts,
  ///Workplace 
  loadWorkplace,
  addWorkplace,
  editWorkplace,
  ///Product
  loadProduct,
  addProduct,
  editProduct,
  //Knot
  loadKnot,
  addKnot,
  editKnot,
  ///Detail
  loadDetail,
  addDetail,
  editDetail,
  ///Seam
  loadSeam,
  addSeam,
  editSeam,
  loadTexprocwelding,



  deleteEquipment,
  isRequesting,
  masters,
  techs,
  userRole,


  workshop,
  area,
  posts,
  workplace,
  product,
  knot,
  detail,
  seam,
  texprocwelding,

  executors,



  detailbyinspector,
  getDetailByInspector
}) => {




  const [workplaceValue, setValueWorkplaceValue] = useState(0);

  const [value_panel, setValue] = useState(0);
  const [value_panel2, setValue2] = useState(0);






  useEffect(() => {
    loadWorkshop();
    loadArea();
    loadPosts();
    loadWorkplace();
    loadProduct();
    loadKnot();
    loadDetail();
    loadSeam();
    loadTexprocwelding();
    loadMasters();
    loadTechs();
    loadExecutors();
  }, [
    loadWorkshop,
    loadArea,
    loadPosts,
    loadWorkplace,
    loadProduct,
    loadKnot,
    loadDetail,
    loadTexprocwelding,
    loadMasters,
    loadTechs,
    loadExecutors,
  ]);

  const ChangePanelsworkplace = (event, newValue) => {
    setValueWorkplaceValue(newValue)
  }


  const ChangePanels = (event, newValue) => {
    if (workplaceValue === 0) {
      setValue(newValue);
      setValue2(0);
    }
    else {
      setValue(0);
      setValue2(newValue);
    }
  };


  function DisplayWorkPlace(panel1, panel2) {
    let primaryPanel = workplaceValue
    let secondPanel = value_panel
    if (primaryPanel == 1) {
      secondPanel = value_panel2
    } 


    if (primaryPanel === 0 && secondPanel === 0) { 
      return (
        <Workshop
          workshop={workshop}
          area={area}
          value_panel={value_panel}
          value_panel2={value_panel2}
          userRole={userRole}
          addWorkshop={addWorkshop}
          editWorkshop={editWorkshop}
        />
      )
    }
    else if (primaryPanel === 0 && secondPanel === 1) {
      return (
        <ProductionArea  
          area={area}
          workplace={workplace}
          workshop={workshop}
          value_panel={value_panel}
          value_panel2={value_panel2}
          userRole={userRole}
          
          addArea={addArea}
          editArea={editArea}
        />
      )
    }
    else if (primaryPanel === 0 && secondPanel === 2) {
      return (
        <Posts  
          area={area}
          posts={posts}
          workplace={workplace} 
          value_panel={value_panel}
          value_panel2={value_panel2}
          userRole={userRole}
          
          addPosts={addPosts}
          editPosts={editPosts}
        />
      )
    }
    else if (primaryPanel === 0 && secondPanel === 3) {
      return (
        <Place  
          area={area} 
          posts={posts}
          workplace={workplace} 
          value_panel={value_panel}
          value_panel2={value_panel2}
          userRole={userRole}
          
          addWorkplace={addWorkplace}
          editWorkplace={editWorkplace}
        />
      )
    }


    else if (primaryPanel === 1 && secondPanel === 0) {
      return (
        <Product   
          product={product}
          area={area}
          posts={posts}
          workplace={workplace}
          seam={seam}
          texprocwelding={texprocwelding}
          value_panel={value_panel}
          value_panel2={value_panel2}
          userRole={userRole}
          
          addProduct={addProduct}
          editProduct={editProduct}
        />
      )
    }
    else if (primaryPanel === 1 && secondPanel === 1) {
      return (
        <Knot
          knot={knot}
          area={area}
          posts={posts}
          workplace={workplace}
          seam={seam}
          texprocwelding={texprocwelding}
          value_panel={value_panel}
          value_panel2={value_panel2}
          userRole={userRole}
          
          addKnot={addKnot}
          editKnot={editKnot}
        />
      )
    }
    else if (primaryPanel === 1 && secondPanel === 2) {
      return (
        <Detail
          detail={detail}
          area={area}
          posts={posts}
          workplace={workplace}
          seam={seam}
          texprocwelding={texprocwelding}
          value_panel={value_panel}
          value_panel2={value_panel2}
          userRole={userRole}
          
          addDetail={addDetail}
          editDetail={editDetail}
        />
      )
    }
    else if (primaryPanel === 1 && secondPanel === 3) {
      return (
        <Seam 
          area={area}
          posts={posts}
          workplace={workplace}
          seam={seam}
          texprocwelding={texprocwelding}
          value_panel={value_panel}
          value_panel2={value_panel2}
          userRole={userRole}
          
          addSeam={addSeam}
          editSeam={editSeam}
        />
      )
    }

    
    else {
      return (
        <div></div>
      )
    }

  }

  ////////////////////////////////////////////////////////////////////
  return (
    <div className={styles.innerWrapper}>
      <ToolTip
        title="Производство"
        toolTipText="Здесь Вы можете просмотреть цеха, производственные участки, посты, рабочие места,изделия, узлы, детали, сварные швы, подлежащие проверке УКК"
        src={workPlaceImage}
      />

      <Tabs
        value={workplaceValue}
        onChange={ChangePanelsworkplace}
        indicatorColor="primary"
        textColor="primary"
        aria-label="full width tabs example"
      >
        <Tab label="Структура производства" />
        <Tab label="Структура продукции" />

      </Tabs>


      {workplaceValue === 0
        ? (

          <Tabs
            value={value_panel}
            onChange={ChangePanels}
            indicatorColor="primary"
            textColor="primary"
            aria-label="full width tabs example"
          >
            <Tab label="Цеха" />
            <Tab label="Производственные участки" />
            <Tab label="Посты" />
            <Tab label="Рабочие места" />
          </Tabs>
        )
        : (
          <Tabs
            value={value_panel2}
            onChange={ChangePanels}
            indicatorColor="primary"
            textColor="primary"
            aria-label="full width tabs example"
          >

            <Tab label="Изделия" />
            <Tab label="Узлы" />
            <Tab label="Детали" />
            <Tab label="Сварные швы" />
          </Tabs>
        )
      }


      <DisplayWorkPlace
        primaryPanel={value_panel}
        secondPanel={value_panel2}
      />

    </div>
  );
};
