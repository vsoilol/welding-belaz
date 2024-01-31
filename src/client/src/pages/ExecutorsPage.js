import React from 'react';
import { Executors } from 'components';
import { HeaderLayout } from 'layouts/Header';

export const ExecutorsPage = props => {
  return (
    <div>
      <HeaderLayout {...(props?.state?.auth?.user?.role ?? props?.userRole)}>
        <Executors {...props} />
      </HeaderLayout>
    </div>
  );
};
