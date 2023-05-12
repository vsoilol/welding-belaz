import { Route, withRouter, Redirect } from 'react-router-dom';
import React, { useEffect } from 'react';
import { useSelector } from 'react-redux';
import history from '../../store/history';

const PrivateRoute = ({
  path,
  component: Component,
  allow,
  redirectTo,
  requiresAccount,
  currentAccount,
  ...rest
}) => {
  let callback;
  const isAuth = useSelector(state => state.auth.isAuth);
  const setCallback = cb => sessionStorage.setItem('callback', cb);

  history.location.state = { ...history.location.state };

  if (redirectTo === '/' && !isAuth)
    callback = history.location.pathname ? history.location.pathname : null;

  useEffect(() => {
    if (callback) setCallback(callback);
  }, [callback]);

  // 403 page is rendering when user is logged in but access is not allowed
  // By passing "redirectTo" prop you can redirect user to specific page.
  return (
    <Route
      {...rest}
      render={props => (allow ? <Component {...props} /> : <Redirect to={redirectTo} />)}
    />
  );
};

export default withRouter(PrivateRoute);