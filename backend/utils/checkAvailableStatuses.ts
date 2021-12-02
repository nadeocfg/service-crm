export const checkAvailableStatuses = (currentStatus: string) => {
  if (!checkAvailableStatuses) {
    return [];
  }

  switch (currentStatus) {
    case 'CREATED': {
      return ['IN_PROGRESS'];
    }

    case 'IN_PROGRESS': {
      return ['CANCELED', 'DONE'];
    }

    default: {
      return [];
    }
  }
};
