import React from 'react';
import { Equipment } from 'components';
import { HeaderLayout } from 'layouts/Header';

export const EquipmentPage = props => {
  return (
    <div>
      <HeaderLayout {...(props?.state?.auth?.user?.role ?? props?.userRole)}>
        <Equipment {...props} />
      </HeaderLayout>
    </div>
  );
};
