export const formatSum = (sum: string | number) => {
  if (!sum) {
    return '0 KZT';
  }

  return new Intl.NumberFormat('ru-RU', {
    style: 'currency',
    currency: 'KZT',
    maximumFractionDigits: 0,
  }).format(+sum);
};
