import React from 'react';
import { useSelector } from 'react-redux';

import { Navigate } from 'react-router-dom';

export const PrivateRoute = ({ redirectTo, children }) => {
  const isAuth = useSelector(state => state.auth.isAuth);

  return isAuth ? children : <Navigate to={redirectTo} />;
};
