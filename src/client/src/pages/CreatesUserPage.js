import React from 'react';
import CreatesUser from 'components/CreatesUser';
import { HeaderLayout } from 'layouts/Header';

export const CreatesUserPage = props => {
  return (
    <HeaderLayout>
      <CreatesUser {...props} />
    </HeaderLayout>
  );
};
