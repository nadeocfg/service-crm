import { TableSortLabel } from '@material-ui/core';
import { SortModel } from '../../models/storeModel';

interface TableSortModel {
  label: string;
  sortBy: string;
  sort: SortModel;
  handleChangeSort: Function;
}

const TableSort = ({
  label,
  sort,
  handleChangeSort,
  sortBy,
}: TableSortModel) => {
  return (
    <TableSortLabel
      active={sort.name === sortBy}
      direction={sort.name === sortBy ? sort.order : 'asc'}
      onClick={() => handleChangeSort(sortBy)}
    >
      {label}
    </TableSortLabel>
  );
};

export default TableSort;
