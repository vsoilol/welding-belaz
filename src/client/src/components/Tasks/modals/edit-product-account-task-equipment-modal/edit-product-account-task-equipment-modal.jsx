import { useEffect } from 'react';
import { useProductAccountTaskStore } from 'store/product-account-task';
import { useWeldingEquipmentStore } from 'store/welding-equipment';

import {
  ModalWindow,
  CustomFormikCheckbox,
  Button,
  LoadingSpinner,
} from 'components/shared';
import { Formik, Form } from 'formik';

import styles from './edit-product-account-task-equipment-modal.module.scss';

export const EditProductAccountTaskEquipmentModal = ({
  isOpen,
  toggleModal,
}) => {
  const { selectedProductAccountTask, assignWeldingEquipments } =
    useProductAccountTaskStore();
  const {
    weldingEquipments,
    getAllWeldingEquipments,
    isLoading: isLoadingWeldingEquipments,
  } = useWeldingEquipmentStore();

  useEffect(() => {
    getAllWeldingEquipments();
  }, [getAllWeldingEquipments]);

  const initialValues = {
    weldingEquipmentIds:
      selectedProductAccountTask.weldingEquipments &&
      selectedProductAccountTask.weldingEquipments.length > 0
        ? selectedProductAccountTask.weldingEquipments.map(_ => _.id)
        : [],
  };

  const handleFormSubmit = values => {
    const { weldingEquipmentIds } = values;
    const equipments = weldingEquipments.filter(equipment =>
      weldingEquipmentIds.includes(equipment.id)
    );

    assignWeldingEquipments(selectedProductAccountTask.id, equipments);
    toggleModal(false);

    // console.log('Form submit: ', equipments);
  };

  return (
    <>
      {isLoadingWeldingEquipments && <LoadingSpinner isFullScreenMode={true} />}

      {!isLoadingWeldingEquipments &&
        weldingEquipments &&
        weldingEquipments.length > 0 && (
          <ModalWindow
            isOpen={isOpen}
            headerText="Закрепить оборудование"
            setIsOpen={state => {
              toggleModal(false);
            }}
            wrapperStyles={{ width: 420 }}>
            <Formik
              initialValues={initialValues}
              enableReinitialize
              onSubmit={handleFormSubmit}>
              {({ isValid, dirty }) => (
                <Form className={styles.form}>
                  <div className={styles.field}>
                    <span className={styles.fieldLabel}>Оборудование</span>

                    <div className={styles.checkboxInput}>
                      {weldingEquipments.map((equipment, index) => (
                        <div key={index} className={styles.rowInputCheckbox}>
                          <CustomFormikCheckbox
                            name="weldingEquipmentIds"
                            value={equipment.id}
                            exclusive={false}
                          />
                          <span>
                            {equipment.name} {equipment.factoryNumber}
                          </span>
                        </div>
                      ))}
                    </div>
                  </div>

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
