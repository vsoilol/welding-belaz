import React from 'react';
import { createRoot } from 'react-dom/client';
import App from './App';
import store from 'store';
import { Provider } from 'react-redux';
import { ConnectedRouter as Router } from 'connected-react-router';
import history from 'store/history';
import api from 'services/api';
import auth from 'services/auth';

import './index.scss';

const RootApp = () => {
  const token = auth.getToken();

  api.setAuthTokenToHeader(token);

  return (
    <Provider store={store}>
      <Router history={history}>
        <App />
      </Router>
    </Provider>
  );
};

const container = document.getElementById('root');
const root = createRoot(container);
root.render(<RootApp />);
