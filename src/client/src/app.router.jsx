import {
  ExecutorsContainer,
  TasksContainer,
  RecordsContainer,
  CreatesUserContainer,
  LoginContainer,
  TexProcWeldingPage,
  EquipmentContainer,
  InstructionsContainer,
  ModesContainer,
  ReportsContainer,
  WorkPlacePage,
} from 'containers';
import { ProductionCalendarPage } from 'pages';
import { Routes, Route } from 'react-router-dom';
import { PrivateRoute } from 'services/HOCs/PrivateRoute';
import { Layout } from 'components';
import { ReduxRouter } from '@lagunovsky/redux-react-router';
import history from 'store/history';

const AppRouter = () => {
  return (
    <ReduxRouter history={history}>
      <Routes>
        <Route path="/login" element={<LoginContainer />} />
        <Route
          path="/"
          element={
            <PrivateRoute redirectTo="/login">
              <Layout />
            </PrivateRoute>
          }>
          <Route index element={<ExecutorsContainer />} />
          <Route path="creates-user" element={<CreatesUserContainer />} />
          <Route path="tasks" element={<TasksContainer />} />
          <Route path="records" element={<RecordsContainer />} />
          <Route path="tex-proc-welding" element={<TexProcWeldingPage />} />
          <Route path="equipment" element={<EquipmentContainer />} />
          <Route path="instructions" element={<InstructionsContainer />} />
          <Route path="welding-modes" element={<ModesContainer />} />
          <Route
            path="production-calendar"
            element={<ProductionCalendarPage />}
          />
          <Route path="reports" element={<ReportsContainer />} />
          <Route path="production" element={<WorkPlacePage />} />
        </Route>
      </Routes>
    </ReduxRouter>
  );
};

export default AppRouter;
