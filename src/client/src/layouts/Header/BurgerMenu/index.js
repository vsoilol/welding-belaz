import React, { useEffect } from "react";
import styles from "./styles.module.scss";

const BurgerMenu = (props) => {
  const { renderHeaderButtons, isMobileMenuOpened } = props;

  useEffect(() => {
    if (isMobileMenuOpened) {
      document.body.style.position = "fixed";
    } else {
      document.body.style.position = "static";
    }
  }, [isMobileMenuOpened]);

  return (
    <div
      className={`${styles.burgerMenuContainer} ${
        isMobileMenuOpened && styles.burgerMenuOpenedContainer
      }`}
    >
      <div
        className={[
          isMobileMenuOpened ? styles.mobileMenuWrapper : undefined,
        ].join(" ")}
      >
        {renderHeaderButtons()}
      </div>
    </div>
  );
};

export default BurgerMenu;
