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
  messags
}) => {
  const isMobile = useContext(MobileContext);
  const rowStyle = rowData => ({ 
    backgroundColor: rowData?.areDeviations && !messags ? "rgb(249 81 81)" : "white", 
  });
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
        rowStyle:rowStyle,
        search: true,
        pageSize: 10
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
