import React from "react";
import { Header } from "./HeaderComponent";
import styles from "./styles.module.scss";

export const HeaderLayout = ({ children }) => {
  return (
    <div className={styles.templateWrapper}>
      <Header
        userRole={children?.props?.user?.role ?? children.props?.userRole}
      />
      <div className={styles.mainWrapper}>{children}</div>
    </div>
  );
};
