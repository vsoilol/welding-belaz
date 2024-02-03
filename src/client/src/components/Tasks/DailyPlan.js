import React from 'react';
import { CreatingTask } from './DailyPlan/creating-task';

import styles from './styles.module.scss';

export const DailyPlan = ({
  masters,

  product,
  knot,
  detail,
  executors,
  initialValues,
  user,
  equipment,
  userRole,
  techs,
  loadTasks,
}) => {
  return (
    <div className={styles.innerWrapper}>
      <CreatingTask
        masters={masters}
        product={product}
        knot={knot}
        detail={detail}
        executors={executors}
        initialValues={initialValues}
        user={user}
        equipment={equipment}
        userRole={userRole}
        techs={techs}
        loadTasks={loadTasks}
      />
    </div>
  );
};
