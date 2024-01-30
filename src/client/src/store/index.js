import { routerMiddleware } from "connected-react-router";
import { applyMiddleware, compose, createStore } from "redux";
import createSagaMiddleware from "redux-saga";
import auth from "services/auth";

import history from "./history";
import rootReducer from "./reducer";
import rootSaga from "./saga";

const getInitialState = () => {
  const token = auth.getToken();
  const defaultState = { auth: { isAuth: false } };

  if (!token) return defaultState;

  const decodedToken = auth.decodeToken(token);
  const isTokenExpired = auth.isTokenExpired(decodedToken);

  if (isTokenExpired) return defaultState;

  return {
    auth: {
      isAuth: true,
      user: {
        email: decodedToken.email,
        role: decodedToken.role,
      },
    },
  };
};

const initialState = getInitialState();

const sagaMiddleware = createSagaMiddleware();

const middleWare =
  process.env.REACT_APP_ENVIRONMENT !== "production"
    ? [routerMiddleware(history), sagaMiddleware]
    : [routerMiddleware(history), sagaMiddleware];

const composeEnhancers =
  process.env.REACT_APP_ENVIRONMENT !== "production" &&
  typeof window === "object" &&
  window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__
    ? window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__({})
    : compose;

const store = createStore(
  rootReducer,
  initialState,
  composeEnhancers(applyMiddleware(...middleWare))
);

sagaMiddleware.run(rootSaga);
export default store;
