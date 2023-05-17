import React from "react";
import { Header } from "./HeaderComponent";
import styles from "./styles.module.css";

export const HeaderLayout = ({ children }) => {
  return (
    <div className={styles.templateWrapper}>
      <Header />
      <div className={styles.mainWrapper}>{children}</div>
    </div>
  );
};
