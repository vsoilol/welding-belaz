import React from 'react';
import styles from './styles.module.scss';
import errorActions from 'store/error/actions';

import { CreatingTask } from './DailyPlan/CreatingTask';

const {
  Creators: { setError },
} = errorActions;

const dateOptions = {
  day: 'numeric',
  month: 'short',
  year: 'numeric',
};

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
