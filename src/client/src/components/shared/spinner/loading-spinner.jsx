import React, { useEffect } from 'react';
import { RotatingLines } from 'react-loader-spinner';
import { GLOBALS } from 'config/GLOBALS';

import styles from './loading-spinner.module.scss';

const LoadingSpinner = ({ isFullScreenMode, paddingTop, color }) => {
  const colorFullScreen = '#007BFF';

  useEffect(() => {
    const toggleBodyScroll = disableScroll => {
      document.body.classList.toggle(styles.noScroll, disableScroll);
    };

    if (isFullScreenMode) {
      toggleBodyScroll(true);
    }

    return () => {
      if (isFullScreenMode) {
        toggleBodyScroll(false);
      }
    };
  }, [isFullScreenMode]);

  const spinnerClass = isFullScreenMode
    ? styles.fullScreenSpinner
    : styles.inlineSpinner;

  const getColor =
    color ||
    (isFullScreenMode && colorFullScreen) ||
    GLOBALS.COLORS.PRIMARY_COLOR;

  return (
    <div className={spinnerClass} style={{ paddingTop }}>
      <RotatingLines
        visible={true}
        height="90"
        width="90"
        strokeWidth="3"
        animationDuration="0.75"
        strokeColor={getColor}
        ariaLabel="loading"
      />
    </div>
  );
};

export default LoadingSpinner;
