import React, { useContext } from "react";
import MaterialTable from "material-table";
import MobileContext from "context/MobileContext";

export const Table = ({
  title,
  columns,
  data,
  renderRowChildren,
  addAction,
  actions,
  editAction,
  deleteAction,
  isLoading,
}) => {
  const isMobile = useContext(MobileContext);

  return (
    <MaterialTable
      localization={{
        header: {
          actions: "",
        },
        body: {
          editRow: {
            deleteText: "Вы уверены, что хотите удалить?",
            cancelTooltip: "Отменить",
            saveTooltip: "Сохранить",
          },
          addTooltip: "Добавить",
          deleteTooltip: "Удалить",
        },
        pagination: {
          firstTooltip: "На первую",
          previousTooltip: "Предыдущая",
          labelRowsSelect: "рядов",
          labelDisplayedRows: "{from}-{to} из {count}",
          nextTooltip: "Следующая",
          lastTooltip: "На последнюю",
        },
        toolbar: {
          searchTooltip: "Поиск",
          searchPlaceholder: "Поиск...",
        },
      }}
      isLoading={isLoading}
      title={!isMobile && title}
      columns={columns}
      data={data}
      detailPanel={
        renderRowChildren ? (rowData) => renderRowChildren(rowData) : null
      }
      options={{
        // rowStyle: { backgroundColor: 'green'},
        rowStyle: (rowData) => {
          if (new Date(rowData?.badgeExpirationDate) < new Date()) {
            return { backgroundColor: "#ea8e8e" };
          } else if (
            new Date(rowData?.badgeExpirationDate).getFullYear() ===
              new Date().getFullYear() &&
            new Date(rowData?.badgeExpirationDate).getMonth() ===
              new Date().getMonth() &&
            new Date(rowData?.badgeExpirationDate).getDate() >=
              new Date().getDate()
          ) {
            return { backgroundColor: "#f8f8ba" };
          }
          return {};
        },
      }}
      actions={actions}
      editable={{
        onRowAdd:
          addAction &&
          ((newData) =>
            new Promise((resolve) => {
              resolve();
              addAction(newData);
            })),
        onRowUpdate:
          editAction &&
          ((newData) =>
            new Promise((resolve) => {
              resolve();
              editAction(newData);
            })),
        onRowDelete:
          deleteAction &&
          ((oldData) =>
            new Promise((resolve) => {
              resolve();
              deleteAction(oldData);
            })),
      }}
    />
  );
};
