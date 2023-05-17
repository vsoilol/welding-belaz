import React, { useContext } from "react";
import styles from "./styles.module.css";
import MobileContext from "context/MobileContext";

const ToolTip = ({ title, src, toolTipText, button }) => {
  const isMobile = useContext(MobileContext);

  return (
    <div
      style={{ backgroundImage: `url(${src})` }}
      className={[styles.wrapper]}
    >
      <div className={styles.cover}>
        <div className={styles.trapezoid}>
          <span className={[styles.text, styles.title].join(" ")}>{title}</span>
          {!isMobile && (
            <span className={[styles.text, styles.tooltip].join(" ")}>
              {toolTipText}
            </span>
          )}
          {!isMobile && button}
        </div>
      </div>
    </div>
  );
};

export default ToolTip;
