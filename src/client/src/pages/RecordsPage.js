import React from 'react';
import { Records } from 'components';
import { HeaderLayout } from 'layouts/Header';

export const RecordsPage = props => {
  return (
    <div>
      <HeaderLayout {...(props?.state?.auth?.user?.role ?? props?.userRole)}>
        <Records {...props} />
      </HeaderLayout>
    </div>
  );
};
