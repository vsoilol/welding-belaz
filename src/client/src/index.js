import React from "react";
import ReactDOM from "react-dom";
import App from "./App";
import store from "store";
import { Provider } from "react-redux";
import { ConnectedRouter as Router } from "connected-react-router";
import history from "store/history";
import * as serviceWorker from "./serviceWorker";
import api from "services/api";
import auth from "services/auth";

import "./index.scss";

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

ReactDOM.render(<RootApp />, document.getElementById("root"));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
