const getSetString = (body: any) => {
  let queryStr = '';
  var queryArr: any[] = [];
  Object.keys(body).forEach((key, i) => {
    if (
      key === 'id' ||
      key === 'createdDate' ||
      key === 'updatedDate' ||
      key === 'login'
    ) {
      return false;
    }

    return queryArr.push(`"${key}" = $${i + 1}`);
  });

  queryStr += queryArr.join(', ');
  queryStr += ', "updatedDate" = NOW() ';
  queryStr += `WHERE id = $${Object.keys(body).length}`;

  return queryStr;
};

export default getSetString;
