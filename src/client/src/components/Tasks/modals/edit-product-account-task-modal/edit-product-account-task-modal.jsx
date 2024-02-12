import { useEffect, useMemo } from 'react';
import { useProductAccountTaskStore } from 'store/product-account-task';

import { userRoles, isMaster, isInspector } from 'core/constants';
import {
  convertFromDDMMYYYYToDateObject,
  convertInputDateToDDMMYYYY,
} from 'core/helpers';
import { useAuthStore } from 'store/auth';
import { useInspectorStore } from 'store/inspector';

import {
  ModalWindow,
  CustomFormikTextInput,
  CustomFormikField,
  Button,
  LoadingSpinner,
  CustomFormikSelect,
  CustomFormikYesOrNoCheckboxes,
} from 'components/shared';
import { Formik, Form } from 'formik';

import styles from './edit-product-account-task-modal.module.scss';
import { createValidationSchema } from './validation-schema';

export const EditProductAccountTaskModal = ({ isOpen, toggleModal }) => {
  const { userRole } = useAuthStore();
  const {
    selectedProductAccountTask,
    editProductAccountTask,
    changeDefectiveAmount,
    changeEndWeldingDate,
    changeManufacturedAmount,
    updateWeldingMaterialInfo,
  } = useProductAccountTaskStore();

  const {
    inspectors,
    getAllInspectors,
    isLoading: isLoadingInspectors,
  } = useInspectorStore();

  const inspectorsOptions = useMemo(
    () =>
      inspectors?.map(inspector => ({
        value: inspector?.id,
        label: `${inspector?.middleName} ${inspector?.firstName}`,
      })),
    [inspectors]
  );

  const validationSchema = createValidationSchema(
    convertFromDDMMYYYYToDateObject(selectedProductAccountTask.dateFromPlan),
    selectedProductAccountTask.manufacturedAmount > 0,
    userRole
  );

  const initialValues = {
    ...(isMaster(userRole) && {
      weldingEndDate: '',
      weldingMaterial: selectedProductAccountTask.weldingMaterial ?? '',
      weldingMaterialBatchNumber:
        selectedProductAccountTask.weldingMaterialBatchNumber ?? '',
      isManufactured: [selectedProductAccountTask.manufacturedAmount > 0],
    }),

    ...(isInspector(userRole) && {
      inspectorId: selectedProductAccountTask.inspector?.id ?? '',
      defectiveReason: selectedProductAccountTask.reason ?? '', // Причина брака
      isDefective: [selectedProductAccountTask.defectiveAmount > 0],
    }),
  };

  useEffect(() => {
    if (isInspector(userRole)) {
      getAllInspectors();
    }
  }, [getAllInspectors]);

  const handleFormSubmit = values => {
    const endWeldingDate = values.weldingEndDate
      ? convertInputDateToDDMMYYYY(values.weldingEndDate)
      : null;

    values.weldingEndDate =
      endWeldingDate !== selectedProductAccountTask.dateFromPlan
        ? endWeldingDate
        : null;

    if (isMaster(userRole)) {
      values.manufacturedAmount = values.isManufactured[0] ? 1 : 0;
    }

    if (isInspector(userRole)) {
      values.defectiveAmount = values.isDefective[0] ? 1 : 0;
    }

    if (userRole === userRoles.admin) {
      handleEditByAdmin(values);
    }

    if (userRole === userRoles.master) {
      handleEditByMaster(values);
    }

    if (userRole === userRoles.inspector) {
      handleEditByInspector(values);
    }

    toggleModal(false);
  };

  const handleEditByAdmin = values => {
    const request = {
      ...values,
      productAccountTaskId: selectedProductAccountTask.id,
    };

    editProductAccountTask(request);
  };

  const handleEditByMaster = ({
    weldingEndDate,
    manufacturedAmount,
    weldingMaterial,
    weldingMaterialBatchNumber,
  }) => {
    const productAccountTaskId = selectedProductAccountTask.id;
    changeEndWeldingDate(productAccountTaskId, weldingEndDate);
    changeManufacturedAmount(productAccountTaskId, manufacturedAmount);
    updateWeldingMaterialInfo(
      productAccountTaskId,
      weldingMaterial,
      weldingMaterialBatchNumber
    );
  };

  const handleEditByInspector = ({
    inspectorId,
    defectiveAmount,
    defectiveReason,
  }) => {
    const productAccountTaskId = selectedProductAccountTask.id;
    changeDefectiveAmount(
      productAccountTaskId,
      inspectorId,
      defectiveReason,
      defectiveAmount
    );
  };

  return (
    <>
      {isLoadingInspectors && <LoadingSpinner isFullScreenMode={true} />}

      {!isLoadingInspectors && (
        <ModalWindow
          isOpen={isOpen}
          headerText="Редактирование"
          setIsOpen={() => {
            toggleModal(false);
          }}
          wrapperStyles={{ width: 420 }}>
          <Formik
            initialValues={initialValues}
            validationSchema={validationSchema}
            onSubmit={handleFormSubmit}>
            {({ isValid, dirty }) => (
              <Form className={styles.form}>
                {isMaster(userRole) && (
                  <>
                    <div className={styles.field}>
                      <span>Дата окончания задания</span>

                      <CustomFormikField name="weldingEndDate">
                        <CustomFormikTextInput
                          width="200"
                          style={{
                            height: 40,
                            padding: '0 20px 0 30px',
                            width: 380,
                          }}
                          placeholder="Дата окончания задания"
                          type="date"
                        />
                      </CustomFormikField>
                    </div>

                    <div className={styles.field}>
                      <span>Изготовлено ли изделие?</span>

                      <CustomFormikYesOrNoCheckboxes name={'isManufactured'} />
                    </div>

                    <div className={styles.field}>
                      <span>Наименование сварочного материала</span>

                      <CustomFormikField name="weldingMaterial">
                        <CustomFormikTextInput
                          width="200"
                          style={{
                            height: 40,
                            padding: '0 20px 0 30px',
                            width: 380,
                          }}
                          placeholder="Наименование сварочного материала"
                          type="text"
                        />
                      </CustomFormikField>
                    </div>

                    <div className={styles.field}>
                      <span>Номер партии сварочного материала</span>

                      <CustomFormikField name="weldingMaterialBatchNumber">
                        <CustomFormikTextInput
                          width="200"
                          style={{
                            height: 40,
                            padding: '0 20px 0 30px',
                            width: 380,
                          }}
                          placeholder="Номер партии сварочного материала"
                          type="text"
                        />
                      </CustomFormikField>
                    </div>
                  </>
                )}

                {isInspector(userRole) && (
                  <>
                    <div className={styles.field}>
                      <span>Контролер</span>

                      <CustomFormikField name="inspectorId">
                        <CustomFormikSelect
                          width="200"
                          placeholder="Контролер"
                          options={inspectorsOptions}
                        />
                      </CustomFormikField>
                    </div>

                    <div className={styles.field}>
                      <span>Забраковано ли изделие?</span>

                      <CustomFormikYesOrNoCheckboxes name={'isDefective'} />
                    </div>

                    <div className={styles.field}>
                      <span>Причина брака</span>

                      <CustomFormikField name="defectiveReason">
                        <CustomFormikTextInput
                          width="200"
                          style={{
                            height: 40,
                            padding: '0 20px 0 30px',
                            width: 380,
                          }}
                          placeholder="Причина брака"
                          type="text"
                        />
                      </CustomFormikField>
                    </div>
                  </>
                )}

                <Button disabled={!(isValid && dirty)} type="submit">
                  Сохранить
                </Button>
              </Form>
            )}
          </Formik>
        </ModalWindow>
      )}
    </>
  );
};
