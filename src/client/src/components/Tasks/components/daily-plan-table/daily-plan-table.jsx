import { useState } from 'react';
import { userRoles } from 'core/constants';
import { useAuthStore } from 'store/auth';
import { useProductAccountStore } from 'store/product-account';

import { Table } from 'components/shared/Table';
import { EditProductAccountModal } from 'components/Tasks/modals';
import { ModalWindow, Button } from 'components/shared';

import styles from 'components/Tasks/styles.module.scss';

export const DailyPlanTable = () => {
  const { userRole } = useAuthStore();

  const {
    isLoading: productAccountIsLoading,
    selectedProductAccount,
    selectedProductAccountId,
    productAccounts,
    setSelectedProductAccountId,
    deleteProductAccount,
  } = useProductAccountStore();

  const [isDeleteProductAccountModalOpen, setIsDeleteProductAccountModalOpen] =
    useState(false);
  const [isEditProductAccountModalOpen, setIsEditProductAccountModalOpen] =
    useState(false);

  const columns = [
    {
      align: 'center',
      sorting: false,
      title: 'Порядковый номер изделия',
      field: 'sequenceNumbers',
      render: rowData =>
        rowData?.sequenceNumbers && rowData?.sequenceNumbers.length > 0
          ? rowData?.sequenceNumbers.join(', ')
          : '-',
      customFilterAndSearch: (term, rowData) => {
        const value =
          rowData?.sequenceNumbers && rowData?.sequenceNumbers.length > 0
            ? rowData?.sequenceNumbers.join(', ')
            : '';
        return value.toLowerCase().includes(term.toLowerCase());
      },
    },
    {
      align: 'center',
      title: 'Наименование изделия',
      field: 'product.product.name',
    },
    {
      align: 'center',
      title: 'Номер изделия',
      field: 'product.product.number',
    },
    {
      align: 'center',
      title: 'Наименование узла',
      field: 'product.knot.name',
    },
    {
      align: 'center',
      title: 'Номер узла',
      field: 'product.knot.number',
    },
    {
      align: 'center',
      title: 'Количество из плана ',
      field: 'amountFromPlan',
    },
    {
      align: 'center',
      title: ' Есть ли отклонения ',
      render: rowData => (rowData?.areDeviations ? 'есть' : 'нету'),
      customFilterAndSearch: (term, rowData) => {
        const value = rowData?.areDeviations ? 'есть' : 'нету';
        return value.toLowerCase().includes(term.toLowerCase());
      },
      customSort: (a, b) => {
        const valueA = a.areDeviations ? 'есть' : 'нету';
        const valueB = b.areDeviations ? 'есть' : 'нету';
        return valueA.localeCompare(valueB);
      },
    },
  ];

  return (
    <>
      <Table
        title="Информация о производимой продукции"
        columns={columns}
        data={productAccounts ?? []}
        isLoading={productAccountIsLoading}
        actions={
          userRole === userRoles.admin ||
          userRole === userRoles.master ||
          userRole === userRoles.technologist ||
          userRole === userRoles.inspector
            ? [
                {
                  icon: 'edit',
                  tooltip: 'Редактировать план',
                  onClick: (event, rowData) => {
                    setSelectedProductAccountId(rowData.id);
                    setIsEditProductAccountModalOpen(true);
                  },
                },
                (userRole === 'Admin' || userRole === 'Master') && {
                  icon: 'delete',
                  tooltip: 'Удалить план',
                  onClick: (event, rowData) => {
                    setSelectedProductAccountId(rowData.id);
                    setIsDeleteProductAccountModalOpen(true);
                  },
                },
              ]
            : []
        }
      />

      {selectedProductAccountId && (
        <ModalWindow
          isOpen={isDeleteProductAccountModalOpen}
          headerText="Удаление"
          setIsOpen={() => {
            setIsDeleteProductAccountModalOpen(false);
          }}
          wrapperStyles={{ width: 420 }}>
          <div>
            <h4 style={{ padding: '35px 40px' }}>
              Вы уверены что хотите <span>удалить</span> ?{' '}
            </h4>

            <div
              className={styles.row}
              onClick={() => {
                deleteProductAccount(selectedProductAccountId);
                setIsDeleteProductAccountModalOpen(false);
              }}>
              <Button type="submit">Удалить</Button>
            </div>
          </div>
        </ModalWindow>
      )}

      {selectedProductAccount && (
        <EditProductAccountModal
          isOpen={isEditProductAccountModalOpen}
          toggleModal={setIsEditProductAccountModalOpen}
        />
      )}
    </>
  );
};
