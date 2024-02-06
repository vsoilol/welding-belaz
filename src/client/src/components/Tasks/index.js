import React, { useState } from 'react';

import Tabs from '@material-ui/core/Tabs';
import Tab from '@material-ui/core/Tab';

import { tasksImage } from 'assets/pics';

import ToolTip from 'components/shared/ToolTip';
import { DailyPlanTab, TasksTab } from './tabs';
import { useQuery } from 'hooks';
import { useSearchParams } from 'react-router-dom';
import { convertStringToInt } from 'core/helpers';

import styles from './styles.module.scss';

export const Tasks = ({ userRole }) => {
  const searchParams = useQuery();
  const [, setSearchParams] = useSearchParams();

  const tabs = [<TasksTab />, <DailyPlanTab />];

  const getRouteTabNumber = () => {
    const routeTabNumber = searchParams.get('tab');

    if (!routeTabNumber) {
      return 0;
    }

    const tabNumber = convertStringToInt(routeTabNumber);

    if (tabNumber && tabNumber >= 0 && tabNumber < tabs.length) {
      return tabNumber;
    }

    return 0;
  };

  const [tabNumber, setTabNumber] = useState(getRouteTabNumber());

  const onChangeTabNumber = (event, newValue) => {
    searchParams.set('tab', newValue);
    setSearchParams(searchParams);
    setTabNumber(newValue);
  };

  return (
    <div className={styles.innerWrapper}>
      <ToolTip
        title="Задания"
        toolTipText="Здесь Вы можете назначить задания на сварку, посмотреть паспорт сварного стыка"
        src={tasksImage}
      />

      {(userRole === 'Admin' ||
        userRole === 'Master' ||
        userRole === 'Inspector' ||
        userRole === 'Chief' ||
        userRole === 'PlantManager' ||
        userRole === 'Technologist') && (
        <Tabs
          value={tabNumber}
          onChange={onChangeTabNumber}
          indicatorColor="primary"
          textColor="primary"
          aria-label="full width tabs example">
          <Tab label="Сменные задания на сварку " />
          <Tab label="Ежедневный план" />
        </Tabs>
      )}

      <div className={styles.tableWrapper}>{tabs[tabNumber]}</div>
    </div>
  );
};
