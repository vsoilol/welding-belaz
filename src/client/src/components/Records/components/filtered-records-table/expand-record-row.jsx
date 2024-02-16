import React from 'react';
import Paper from '@material-ui/core/Paper';
import TableContainer from '@material-ui/core/TableContainer';

import { WeldingChart } from '../welding-chart';

import styles from './style.module.scss';

export const ExpandRecordRow = data => {
  return (
    <TableContainer className={styles.expandRowContainer} component={Paper}>
      <div className={styles.chartBlock}>
        <p className={styles.chartBlockTitle}>Сварочный ток, А</p>
        <WeldingChart
          secondsPerPoint={data.secondsPerPoint}
          values={data.weldingCurrentValues}
          lineColor="#8884d8"
          min={data.weldingCurrentMin}
          max={data.weldingCurrentMax}
          minLabel="Минимальная сила тока"
          maxLabel="Максимальная сила тока"
          XAxisLabel="Время сварки (секунды)"
          YAxisLabel="Ток"
        />
      </div>
      <div className={styles.chartBlock}>
        <p className={styles.chartBlockTitle}>Напряжение на дуге, В</p>
        <WeldingChart
          secondsPerPoint={data.secondsPerPoint}
          values={data.arcVoltageValues}
          lineColor="#82ca9d"
          min={data.arcVoltageMin}
          max={data.arcVoltageMax}
          minLabel="Минимальное напряжение"
          maxLabel="Максимальное напряжение"
          XAxisLabel="Время сварки (секунды)"
          YAxisLabel="Напряжение"
        />
      </div>
    </TableContainer>
  );
};
