const getSetString = (body: any) => {
  let queryStr = '';
  var queryArr: any[] = [];
  Object.keys(body).forEach((key, i) => {
    if (key !== 'login') {
      queryArr.push(`"${key}" = $${i}`);
    }
  });

  queryStr += queryArr.join(', ');
  queryStr += ', "updatedDate" = NOW() ';
  queryStr += `WHERE id = $${Object.keys(body).length}`;

  return queryStr;
};

export default getSetString;
