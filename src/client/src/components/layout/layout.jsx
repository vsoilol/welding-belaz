import React from 'react';
import { HeaderLayout } from 'layouts/Header';
import { Outlet } from 'react-router-dom';
import { ScrollToTop } from 'components';
import { useModalStore } from 'store/modal';
import ModalWindow from 'components/shared/ModalWindow';
import Button from 'components/shared/Button';

import styles from './layout.module.scss';

export const Layout = () => {
  const { isOpen, title, message, closeModal } = useModalStore();

  return (
    <>
      <div>
        <ScrollToTop />
        <HeaderLayout>
          <Outlet />
        </HeaderLayout>
      </div>

      {title && message && (
        <ModalWindow
          isOpen={isOpen}
          headerText={title}
          setIsOpen={() => closeModal()}
          wrapperStyles={{ width: 420 }}>
          <div>
            <h4 style={{ padding: '35px 40px' }}>{message}</h4>

            <div className={styles.row}>
              <Button onClick={() => closeModal()}>Закрыть</Button>
            </div>
          </div>
        </ModalWindow>
      )}
    </>
  );
};
