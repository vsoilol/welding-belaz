import Message from "components/shared/Message";
import {
  EquipmentContainer,
 
  WorkPlacePage,
  TexProcWeldingPage,


  ExecutorsContainer,
  InstructionsContainer,
  LoginContainer,
  TasksContainer
} from "containers";
import RecordsContainer from "containers/Records.container";
import UploadContainer from "containers/Upload.container";
import MobileContext from "context/MobileContext";
import TabletContext from "context/TabletContext";
import { NewPasswordPage } from "pages";
import React, { useEffect, useState } from "react";
import { connect, useSelector } from "react-redux";
import { Switch, withRouter } from "react-router-dom";
import PrivateRoute from "services/HOCs/PrivateRoute";
import ScrollToTop from "services/HOCs/ScrollToTop";
import ErrorActions from "store/error/actions"; 

function App({ error, errorType, clearError }) {
  const isAuth = useSelector((state) => state.auth.isAuth);

  const [isMobile, setIsMobile] = useState(
    document.documentElement.clientWidth <= 767
  );

  const [isTablet, setIsTablet] = useState(
    document.documentElement.clientWidth <= 992
  );

  const handleResize = () => {
    const { clientWidth } = document.documentElement;
    setIsMobile(clientWidth <= 768);
    setIsTablet(clientWidth <= 991);
  };

  useEffect(() => {
    window.addEventListener("resize", handleResize);
  }, []);

  return (
    <>
      <TabletContext.Provider value={isTablet}>
        <MobileContext.Provider value={isMobile}>
          {/* <React.StrictMode> */}
          <ScrollToTop>
            <Switch>
              <PrivateRoute
                allow={!isAuth}
                path="/login"
                exact
                component={LoginContainer}
                redirectTo="/"
              />
              <PrivateRoute
                // allow={!isAuth}
                allow={true}
                path="/new-password"
                exact
                component={NewPasswordPage}
                redirectTo="/"
              />
              <PrivateRoute
                allow={isAuth}
                path="/"
                exact
                component={ExecutorsContainer}
                redirectTo="/login"
              />
              <PrivateRoute
                allow={isAuth}
                path="/tasks"
                exact
                component={TasksContainer}
                redirectTo="/login"
              /> 
              <PrivateRoute
                allow={isAuth}
                path="/production"
                exact
                component={WorkPlacePage}
                redirectTo="/login"
              />

             <PrivateRoute
                allow={isAuth}
                path="/tex-proc-welding"
                exact
                component={TexProcWeldingPage}
                redirectTo="/login"
              />

              <PrivateRoute
                allow={isAuth}
                path="/equipment"
                exact
                component={EquipmentContainer}
                redirectTo="/login"
              />
              <PrivateRoute
                allow={isAuth}
                path="/instructions"
                exact
                component={InstructionsContainer}
                redirectTo="/login"
              />
              <PrivateRoute
                allow={isAuth}
                path="/records"
                exact
                component={RecordsContainer}
                redirectTo="/login"
              />
              <PrivateRoute
                allow={isAuth}
                path="/fileUpload"
                exact
                component={UploadContainer}
                redirectTo="/login"
              />
            </Switch>
          </ScrollToTop>
          {/* </React.StrictMode> */}
        </MobileContext.Provider>
      </TabletContext.Provider>

      {error && (
        <Message
          type={errorType}
          text={error}
          timeout={5000}
          onClose={clearError}
        />
      )}
    </>
  );
}

const mapStateToProps = (state) => ({
  error: state.error.message,
  errorType: state.error.type,
});

const mapDispatchToProps = (dispatch) => {
  return {
    clearError: () => {
      dispatch(ErrorActions.Creators.clearError());
    },
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(withRouter(App));
