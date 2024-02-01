import React from 'react';
import { HeaderLayout } from 'layouts/Header';
import { Outlet } from 'react-router-dom';
import { ScrollToTop } from 'components';

export const Layout = () => {
  return (
    <div>
      <ScrollToTop />
      <HeaderLayout>
        <Outlet />
      </HeaderLayout>
    </div>
  );
};
