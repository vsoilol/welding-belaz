import { routerMiddleware } from "connected-react-router";
import { applyMiddleware, compose, createStore } from "redux";
import { logger } from "redux-logger";
import createSagaMiddleware from "redux-saga";
import auth from "services/auth";
// import authUtils from "utils/auth";
import history from "./history";
import rootReducer from "./reducer";
import rootSaga from "./saga";

const getInitialState = () => {
  const token = auth.getToken();
  if (token) {
    const { email, role } = auth.decodeToken(token);

    return {
      auth: {
        isAuth: true,
        user: {
          email,
          role,
        },
      },
    };
  }

  return {
    auth: {
      isAuth: false,
    },
  };
};

const initialState = getInitialState();

const sagaMiddleware = createSagaMiddleware();

const middleWare =
  process.env.NODE_ENV !== "production"
    ? [logger, routerMiddleware(history), sagaMiddleware]
    : [routerMiddleware(history), sagaMiddleware];

const composeEnhancers =
  process.env.NODE_ENV !== "production" &&
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
