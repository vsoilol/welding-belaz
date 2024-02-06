import { useEffect, useMemo, useState } from 'react';
import { userRoles } from 'core/constants';
import { useAuthStore } from 'store/auth';
import { useMasterStore } from 'store/master';
import { useProductAccountStore } from 'store/product-account';

import {
  CustomSelect,
  CustomFormikTextInput,
  LoadingSpinner,
} from 'components/shared';
import { convertInputDateToDDMMYYYY } from 'core/helpers';

import {
  DailyPlanTable,
  UploadProductAccountFile,
} from 'components/Tasks/components';

import styles from 'components/Tasks/styles.module.scss';

export const DailyPlanTab = () => {
  const { userRole } = useAuthStore();
  const {
    loadMasters,
    cancelLoadMaster,
    setSelectedMasterId,
    masters,
    selectedMasterId,
    selectedMaster,
  } = useMasterStore();
  const {
    loadAllDatesByProductionAreaId,
    dates,
    productionAreaId,
    isAdditionalLoading,
    isLoadingGenerateTasks,
    setSelectedDate,
    selectedDate,
    loadProductAccountByDate,
    productAccounts,
    productAccountDate,
    generateTasks,
    generateProductAccountsEmpty,
    getProductAccountReport,
  } = useProductAccountStore();

  const [selectedCreatedDate, setSelectedCreatedDate] = useState(null);

  const mastersOptions = useMemo(
    () =>
      masters?.map(master => ({
        value: master?.id,
        label: `${master?.middleName} ${master?.firstName}`,
      })),
    [masters]
  );

  const datesOptions = useMemo(
    () =>
      dates?.map(date => ({
        label: date,
        value: date,
      })),
    [dates]
  );

  useEffect(() => {
    loadMasters();
    return () => cancelLoadMaster();
  }, [loadMasters, cancelLoadMaster, setSelectedMasterId]);

  useEffect(() => {
    if (selectedMaster && selectedMaster?.productionArea) {
      loadAllDatesByProductionAreaId(selectedMaster.productionArea.id);
    }
  }, [selectedMaster, loadAllDatesByProductionAreaId]);

  const handleLoadProductAccounts = () => {
    loadProductAccountByDate(selectedDate, selectedMaster.productionArea.id);
  };

  const handleGenerateTasks = () => {
    generateTasks(
      selectedDate,
      selectedMasterId,
      selectedMaster.productionArea.id
    );
  };

  const handleGenerateProductAccountsEmpty = () => {
    generateProductAccountsEmpty(
      selectedCreatedDate,
      selectedMaster.productionArea.id
    );
  };

  return (
    <>
      {(isLoadingGenerateTasks || isAdditionalLoading) && (
        <LoadingSpinner isFullScreenMode={true} />
      )}

      <div className={styles.TablePlan}>
        <h3>Ежедневный план</h3>

        {userRole === userRoles.admin && (
          <div className={styles.RowTools}>
            <div className={styles.toolsHead}>
              <p>Выберите мастера</p>

              <CustomSelect
                width="380px"
                placeholder="Мастера"
                value={
                  mastersOptions.find(_ => _.value === selectedMasterId) ?? ''
                }
                onChange={event => {
                  setSelectedDate(null);
                  setSelectedMasterId(event.value);
                }}
                options={mastersOptions}
              />
            </div>

            {(userRole === userRoles.master ||
              userRole === userRoles.admin) && (
              <div className={styles.toolsHead}>
                <p>Выберите дату для создания плана</p>
                <CustomFormikTextInput
                  width="200"
                  style={{ height: 40, padding: '0 20px 0 30px', width: 380 }}
                  type="date"
                  placeholder="Дата"
                  onChange={e => {
                    setSelectedCreatedDate(
                      convertInputDateToDDMMYYYY(e.target.value)
                    );
                  }}
                />
              </div>
            )}

            {userRole === userRoles.admin &&
              selectedMaster?.productionArea &&
              selectedCreatedDate && (
                <button
                  onClick={handleGenerateProductAccountsEmpty}
                  className={styles.create}>
                  Создать план на {selectedCreatedDate}
                </button>
              )}
          </div>
        )}

        {selectedMasterId && dates && dates.length > 0 && (
          <div className={styles.RowTools}>
            <div className={styles.toolsHead}>
              <p>Выберите план из существующих дат</p>

              <CustomSelect
                width="380px"
                placeholder="Дата"
                value={datesOptions.find(_ => _.value === selectedDate) ?? ''}
                onChange={event => {
                  setSelectedDate(event.value);
                }}
                options={datesOptions}
              />
            </div>
          </div>
        )}

        <div className={styles.RowToolsBTNS}>
          {selectedDate && (
            <button
              onClick={handleLoadProductAccounts}
              className={styles.create}
              style={{ marginLeft: '20px' }}>
              Показать план на {selectedDate}
            </button>
          )}

          {(userRole === userRoles.master || userRole === userRoles.admin) &&
            productAccounts?.length > 0 &&
            selectedMaster?.productionArea && (
              <button
                className={`${styles.create} ${styles.createTaskBtn}`}
                style={{ marginLeft: '15px' }}
                onClick={handleGenerateTasks}>
                Создать задание
              </button>
            )}
        </div>

        <div className={styles.sectionGet}>
          <div className={styles.Upload}>
            <label>
              Получение данных об изготовленных изделиях, узлах и деталях
            </label>
            <button
              className={styles.getDate}
              onClick={() => getProductAccountReport()}>
              Получить
            </button>
          </div>

          {(userRole === 'Admin' || userRole === 'Master') &&
            productionAreaId && (
              <div className={styles.Upload}>
                <label>Загрузить данные</label>
                <br></br>
                {userRole === 'Admin' || userRole === 'Master' ? (
                  <div className={styles.Upload}>
                    <UploadProductAccountFile />
                  </div>
                ) : null}
              </div>
            )}
        </div>

        {productAccountDate && (
          <h3>
            План на <span>{productAccountDate}</span>
          </h3>
        )}

        <DailyPlanTable />
      </div>
    </>
  );
};
