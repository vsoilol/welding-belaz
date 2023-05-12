import React, { useEffect } from "react";
import PropTypes from "prop-types";
import { closeIcon } from "assets/icons";
// import { TabletContext } from 'context';
// import { useSwipeable } from 'react-swipeable';
import styles from "./styles.module.css";

const ModalWindow = ({
  children,
  isOpen,
  setIsOpen,
  wrapperStyles,
  headerColor,
  headerText,
  headerTextColor,
  closeButtonStyles,
}) => {
  // const isTablet = useContext(TabletContext);

  useEffect(() => {
    if (isOpen) {
      document.body.style.overflowY = "hidden";
      document.body.style.height = "100%";
    } else {
      document.body.style.position = "static";
      document.body.style.overflowY = "auto";
    }
  }, [isOpen]);

  // const handlers = useSwipeable(
  //   isTablet && {
  //     onSwipedDown: () => setIsOpen(false),
  //     preventDefaultTouchmoveEvent: true,
  //     trackMouse: true,
  //   }
  // );

  return (
    <div className={styles.container} /* {...handlers} */>
      {isOpen && (
        <div onClick={() => setIsOpen(false)} className={styles.shadow} />
      )}
      <div
        className={`${styles.modalContainer} ${
          isOpen ? styles.openedModalContainer : "undefined"
        }`}
        style={wrapperStyles}
      >
        <div className={styles.wrapper}>
          <div
            className={styles.header}
            style={{ backgroundColor: headerColor }}
          >
            <span
              className={styles.headerText}
              style={{ color: headerTextColor }}
            >
              {headerText}
            </span>
            <div onClick={() => setIsOpen(false)}>
              <img
                className={styles.closeIcon}
                src={closeIcon}
                alt="close"
                style={closeButtonStyles}
              />
            </div>
          </div>
          {children}
        </div>
      </div>
    </div>
  );
};

export default ModalWindow;

ModalWindow.propTypes = {
  children: PropTypes.element.isRequired,
  isOpen: PropTypes.bool.isRequired,
  setIsOpen: PropTypes.func.isRequired,
  wrapperStyles: PropTypes.object,
  closeButtonStyles: PropTypes.object,
  headerColor: PropTypes.string,
  headerText: PropTypes.string,
  headerTextColor: PropTypes.string,
};
ModalWindow.defaultProps = {
  wrapperStyles: {
    width: 400,
  },
  closeButtonStyles: {
    filter:
      "invert(100%) sepia(0%) saturate(0%) hue-rotate(24deg) brightness(101%) contrast(103%)",
  },
  headerColor: "#2D3029",
  headerText: "",
  headerTextColor: "#ffffff",
};
