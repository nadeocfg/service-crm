import moment from 'moment';

export const formatDate = (date: Date | string, withHours?: boolean) => {
  if (!date) {
    return '~';
  }

  const momentDate = moment(date);
  if (!momentDate.isValid()) {
    return '~';
  }

  return withHours
    ? momentDate.format('DD/MM/YYYY HH:mm:ss')
    : momentDate.format('DD/MM/YYYY');
};
