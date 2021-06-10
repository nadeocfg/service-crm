const getSetString = (body: any) => {
  let queryStr = '';
  let counter = 0;
  let queryArr: any[] = [];
  Object.keys(body).forEach((key, i) => {
    if (
      key === 'id' ||
      key === 'createdDate' ||
      key === 'updatedDate' ||
      key === 'login'
    ) {
      return false;
    }

    if (key === 'password' && !body[key]) {
      return false;
    }

    if (
      (key === 'percentFromJob' ||
        key === 'percentFromParts' ||
        key === 'percentFromVisit') &&
      !body[key]
    ) {
      return queryArr.push(`"${key}" = 0`);
    }

    counter += 1;

    return queryArr.push(`"${key}" = $${counter}`);
  });

  queryStr += queryArr.join(', ');
  queryStr += ', "updatedDate" = NOW() ';
  queryStr += `WHERE id = $${(counter += 1)}`;

  return queryStr;
};

export default getSetString;
