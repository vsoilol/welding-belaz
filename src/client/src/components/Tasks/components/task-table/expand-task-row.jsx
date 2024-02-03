import TableContainer from '@material-ui/core/TableContainer';
import MaterialTable from '@material-ui/core/Table';
import TableHead from '@material-ui/core/TableHead';
import TableCell from '@material-ui/core/TableCell';
import TableRow from '@material-ui/core/TableRow';
import TableBody from '@material-ui/core/TableBody';

export const ExpandTaskRow = data => {
  return (
    <TableContainer>
      <MaterialTable aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell
              style={{
                borderBottom: 0,
              }}
              align="center">
              Наименование изделия
            </TableCell>
            <TableCell
              style={{
                borderBottom: 0,
              }}
              align="center">
              Наименование узла
            </TableCell>
            <TableCell
              style={{
                borderBottom: 0,
              }}
              align="center">
              Наименование детали
            </TableCell>

            <TableCell
              style={{
                borderBottom: 0,
              }}
              align="center">
              Оборудование ( инвентарный номер )
            </TableCell>
            <TableCell
              style={{
                borderBottom: 0,
              }}
              align="center">
              Исполнитель
            </TableCell>
            <TableCell
              style={{
                borderBottom: 0,
              }}
              align="center">
              Руководитель сварочных работ
            </TableCell>
            <TableCell
              style={{
                borderBottom: 0,
              }}
              align="center">
              Контролер
            </TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          <TableRow>
            <TableCell align="center">{data?.product?.name ?? '-'}</TableCell>
            <TableCell align="center">
              {data?.knot?.name && data?.knot?.number
                ? `${data?.knot?.name} ${data?.knot?.number}`
                : '-'}
            </TableCell>
            <TableCell align="center">
              {data?.detail?.name && data?.detail?.number
                ? `${data?.detail.name} ${data?.detail.number}`
                : '-'}
            </TableCell>
            <TableCell align="center">
              {data?.weldingEquipments.map(equipment => (
                <li key={equipment.factoryNumber}>
                  {`${equipment.name} ${equipment.factoryNumber}`}
                </li>
              ))}
            </TableCell>

            <TableCell align="center">
              {data?.welder?.middleName &&
              data?.welder?.firstName &&
              data?.welder?.lastName
                ? `${data?.welder.middleName} ${data?.welder.firstName} ${data?.welder.lastName}`
                : '-'}
            </TableCell>

            <TableCell align="center">
              {data?.master?.middleName &&
              data?.master?.firstName &&
              data?.master?.lastName
                ? `${data?.master.middleName} ${data?.master.firstName} ${data?.master.lastName}`
                : '-'}
            </TableCell>

            <TableCell align="center">
              {data?.inspector?.middleName &&
              data?.inspector?.firstName &&
              data?.inspector?.lastName
                ? `${data?.inspector.middleName} ${data?.inspector.firstName} ${data?.inspector.lastName}`
                : '-'}
            </TableCell>
          </TableRow>
        </TableBody>
      </MaterialTable>
    </TableContainer>
  );
};
