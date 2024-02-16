import { instructionsImage } from 'assets/pics';
import { RecordsTable } from './components/Table';
import ToolTip from 'components/shared/ToolTip';
import React, { useEffect } from 'react';
import { FilteredRecordsContainer } from './components';
import styles from './styles.module.scss';

export const Records = ({
  records,
  loadRecords,
  isRequesting,
  deleteRecords,
  userRole,
}) => {
  return (
    <div className={styles.innerWrapper}>
      <ToolTip
        title="Записи"
        toolTipText="Здесь Вы можете просмотреть данные, полученные с регистратора сварочных процессов"
        src={instructionsImage}
      />
      <FilteredRecordsContainer />
    </div>
  );
};
