import { OrderDataModel } from '../models/storeModel';
import { formatSum } from './formatSum';

export const getTotalSum = (data: OrderDataModel) => {
  const parts = data.parts.reduce((acc, item) => {
    return (acc +=
      ((item as any).selectedPrice || 0) * +(item?.soldQuantity || 0));
  }, 0);
  const jobs = data.jobTypes.reduce((acc, item) => {
    return (acc +=
      ((item as any).selectedPrice || 0) * +(item?.soldQuantity || 0));
  }, 0);

  return formatSum(parts + jobs + +data.visitPrice);
};
