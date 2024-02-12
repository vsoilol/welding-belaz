import TableContainer from '@material-ui/core/TableContainer';
import MaterialTable from '@material-ui/core/Table';
import TableHead from '@material-ui/core/TableHead';
import TableCell from '@material-ui/core/TableCell';
import TableRow from '@material-ui/core/TableRow';
import TableBody from '@material-ui/core/TableBody';

export const ExpandProductAccountTaskRow = data => {
  const columns = [
    {
      // inspector
      title: 'Контролёр',
      render: ({ inspector }) =>
        inspector
          ? `${inspector.middleName} ${inspector.firstName} ${inspector.lastName}`
          : '-',
    },
    {
      // master
      title: 'Руководитель сварочных работ',
      render: ({ master }) =>
        master
          ? `${master.middleName} ${master.firstName} ${master.lastName}`
          : '-',
    },
    {
      // welders
      title: 'Исполнитель (сварщик)',
      render: ({ welders }) =>
        welders && welders[0]
          ? `${welders[0].middleName} ${welders[0].firstName} ${welders[0].lastName}`
          : '-',
    },
    {
      // weldingMaterial
      // weldingMaterialBatchNumber
      title: 'Сварочный материал',
      render: ({ weldingMaterial, weldingMaterialBatchNumber }) =>
        weldingMaterial && weldingMaterialBatchNumber
          ? `${weldingMaterial} ${weldingMaterialBatchNumber}`
          : '-',
    },
    {
      // defectiveAmount
      title: 'Забраковано',
      render: ({ defectiveAmount }) => (defectiveAmount > 0 ? `Да` : 'Нет'),
    },
    {
      // defectiveAmount
      title: 'Изготовлено',
      render: ({ manufacturedAmount }) =>
        manufacturedAmount > 0 ? `Да` : 'Нет',
    },
    {
      // detectedDefects
      title: 'Причина брака',
      render: ({ reason }) => reason ?? '-',
    },
  ];

  return (
    <TableContainer>
      <MaterialTable aria-label="simple table">
        <TableHead>
          <TableRow>
            {columns.map((value, index) => (
              <TableCell
                key={index}
                style={{
                  borderBottom: 0,
                }}
                align="center">
                {value.title}
              </TableCell>
            ))}
          </TableRow>
        </TableHead>
        <TableBody>
          <TableRow>
            {columns.map((value, index) => (
              <TableCell key={index} align="center">
                {value.render(data)}
              </TableCell>
            ))}
          </TableRow>
        </TableBody>
      </MaterialTable>
    </TableContainer>
  );
};
