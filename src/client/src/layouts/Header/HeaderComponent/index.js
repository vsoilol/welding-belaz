import { faBars } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { closeIcon } from "assets/icons";
import { logo } from "assets/logos";
import { GLOBALS } from "config/GLOBALS";
import TabletContext from "context/TabletContext";
import Text from 'components/shared/Text';
import React, { useContext, useState } from "react";
import { NavLink } from "react-router-dom";
import BurgerMenu from "../BurgerMenu";
import ProfileButton from "../ProfileButton";
import styles from "./styles.module.css";

export const Header = ({
  userRole
}) => {
  const isTablet = useContext(TabletContext);
  const [isMobileMenuOpened, setIsMobileMenuOpened] = useState(false);
   
  const menuItems = [
    { name: "Сотрудники", route: "/" },
    { name: "Оборудование", route: "/equipment" },
    { name: "Производство", route: "/production" },
    { name: "Технологические процессы сборки и сварки", route: "/tex-proc-welding" },
    { name: "Записи", route: "/records" },
    { name: "Календарь", route: "/proiz-calendar" },
    { name: "Задания", route: "/tasks" },
    { name: "Отчеты", route: "/reports" },
    (userRole === "Admin") && { name: "Панель администратора", route: "/creates-user" },
    
  ].filter(Boolean);

  const renderHeaderButtons = () => {
    return menuItems?.map((item) => {
      return (
        <NavLink
          key={item.name}
          exact
          to={item.route}
          activeStyle={{
            borderBottom: `4px solid ${GLOBALS.COLORS.PRIMARY_COLOR}`,
          }}
          activeClassName={styles.headerItemActive}
          className={styles.headerItem}
        >
          {item.name}
        </NavLink>
      );
    });
  };

  const handleMenuPress = () => {
    setIsMobileMenuOpened(!isMobileMenuOpened);
  };

  return (
    <div className={styles.container}>
      {isTablet && (
        <BurgerMenu
          renderHeaderButtons={renderHeaderButtons}
          isMobileMenuOpened={isMobileMenuOpened}
        />
      )}

      <div className={styles.headerContainer}>
        {isTablet &&
          (isMobileMenuOpened ? (
            <div onClick={handleMenuPress}>
              <img
                className={styles.burgerMenuIcon}
                src={closeIcon}
                alt="Menu"
              />
            </div>
          ) : (
            <FontAwesomeIcon
              icon={faBars}
              onClick={handleMenuPress}
              className={styles.burgerMenuIcon}
            />
          ))}
        <div style={{display: 'flex', alignItems: 'center'}}>
          <img src={logo} className={styles.logo} alt="" />
          {!isTablet && <Text type='p2' style={{ height: 20}}>Белорусско-Российский университет</Text>}
        </div>

        <div className={styles.headerWrapper}>
          {!isTablet && (
            <div className={styles.headerItemsWrapper}>
              {renderHeaderButtons()}
            </div>
          )}
          <div className={styles.headerIconsContainer}>
            <ProfileButton />
          </div>
        </div>
      </div>

      {isMobileMenuOpened && isTablet && (
        <div className={styles.shadow} onClick={handleMenuPress} />
      )}
    </div>
  );
};
