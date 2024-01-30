import React from "react";
import { Header } from "./HeaderComponent";
import { useAuthStore } from "store/auth";
import styles from "./styles.module.scss";

export const HeaderLayout = ({ children }) => {
  const { userRole } = useAuthStore();

  return (
    <div className={styles.templateWrapper}>
      <Header userRole={userRole} />
      <div className={styles.mainWrapper}>{children}</div>
    </div>
  );
};
