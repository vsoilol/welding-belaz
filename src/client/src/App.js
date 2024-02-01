import Message from 'components/shared/Message';
import MobileContext from 'context/MobileContext';
import TabletContext from 'context/TabletContext';
import React, { useEffect, useState } from 'react';
import { connect } from 'react-redux';
import ErrorActions from 'store/error/actions';
import AppRouter from 'app.router';

function App({ error, errorType, clearError }) {
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
    window.addEventListener('resize', handleResize);
  }, []);

  return (
    <>
      <TabletContext.Provider value={isTablet}>
        <MobileContext.Provider value={isMobile}>
          <AppRouter />
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

const mapStateToProps = state => ({
  error: state.error.message,
  errorType: state.error.type,
});

const mapDispatchToProps = dispatch => {
  return {
    clearError: () => {
      dispatch(ErrorActions.Creators.clearError());
    },
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(App);
