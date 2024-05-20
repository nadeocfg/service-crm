import { OrderStatusEnum } from "../../frontend/src/models/orderModel";

export const checkAvailableStatuses = (currentStatus: string) => {
  if (!checkAvailableStatuses) {
    return [];
  }

  switch (currentStatus) {
    case OrderStatusEnum.CREATED: {
      return [OrderStatusEnum.IN_PROGRESS];
    }

    case OrderStatusEnum.IN_PROGRESS: {
      return [OrderStatusEnum.CANCELED, OrderStatusEnum.DONE];
    }

    default: {
      return [];
    }
  }
};
