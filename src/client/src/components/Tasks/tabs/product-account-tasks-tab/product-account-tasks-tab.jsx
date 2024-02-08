import { ProductAccountTaskTable } from 'components/Tasks/components';
import { useEffect } from 'react';
import { useProductAccountTaskStore } from 'store/product-account-task';

export const ProductAccountTasksTab = () => {
  const { loadProductAccountTasks, loadProductAccountTasksCancel } =
    useProductAccountTaskStore();

  useEffect(() => {
    loadProductAccountTasks();

    return () => loadProductAccountTasksCancel();
  }, [loadProductAccountTasks, loadProductAccountTasksCancel]);

  return (
    <>
      <ProductAccountTaskTable />
    </>
  );
};
