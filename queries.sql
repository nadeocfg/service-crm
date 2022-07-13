SELECT
  orders.*,
  status.name
FROM
  "service-crm".orders as orders
LEFT JOIN
  "service-crm"."dictOrderStatuses" as status
ON
  orders.status = status.id;

SELECT * FROM pg_roles;

SELECT * FROM pg_user;

GRANT CONNECT ON DATABASE "service-crm" TO "service-crm";

GRANT USAGE ON SCHEMA "service-crm" TO "service-crm";

GRANT ALL ON SCHEMA "service-crm" TO "service-crm";

GRANT USAGE ON TABLES TO "service-crm";

grant all privileges on database "service-crm" to "service-crm";

---------------------- Выдать доступы пользователю БД к таблицам ----------------

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA "service-crm" TO "service-crm";
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA "service-crm" TO "service-crm";
GRANT postgres to "service-crm";

---------------------------------------------------------------------------------

SELECT
  users."percentFromVisit"
FROM
  "service-crm"."orders" as orders
LEFT JOIN
  "service-crm"."users" as users
ON
  orders."serviceManId" = users.id
WHERE
  users.id = 5
ORDER BY
  users.id;

UPDATE
  "service-crm"."orders" as orders
SET
  "customerId" = 3,
  address = 'test address',
  "updatedDate" = now(),
  "serviceManId" = 5,
  comment = 'comment for order'
WHERE
  orders.id = 2;

UPDATE
  "service-crm"."soldParts"
SET
  "isActive" = false
WHERE
  "orderId" = 7
RETURNING
  *;

SELECT
  "soldParts"."partId" as "partId",
  "soldParts"."quantity" as "quantity"
FROM
  "service-crm"."soldParts" as "soldParts"
WHERE
  "soldParts"."orderId" = 25 AND
  "soldParts"."isActive" = true;

SELECT
  *
FROM
  "service-crm"."dictJobTypes" as "jobTypes"
WHERE
  id = 25;

SELECT
  "jobTypeId",
  quantity
FROM
  "service-crm"."soldJobTypes" as "soldJobTypes"
WHERE
  "soldJobTypes"."orderId" = 25 AND
  "soldJobTypes"."isActive" = true;

SELECT
  orders.id as "orderId",
  orders.address,
  orders."visitPrice",
  orders.comment,
  orders."serviceManId",
  orders."boilerId",
  orders."customerId",
  statuses.name as "status"
FROM
  "service-crm"."orders" as orders
LEFT JOIN
  "service-crm"."dictOrderStatuses" as statuses
ON
  orders."status" = statuses.id
WHERE
  orders.id = 31;

SELECT
  orders.id,
  orders.status
FROM
  "service-crm"."orders" as orders
WHERE
  orders.id = 31 AND
  orders."isActive" = true;

SELECT
  statuses.code as "code",
  statuses.action as "action",
  statuses."availableOn" as "availableOn"
FROM
  "service-crm"."dictOrderStatuses" as statuses
WHERE
  statuses."availableOn" = 'CREATED' AND
  statuses."isActive" = true;

UPDATE
  "service-crm"."orders" as orders
SET
  status = (
    SELECT
      status.id
    FROM
      "service-crm"."dictOrderStatuses" as status
    WHERE
      status.code = 'CREATED'
  )
WHERE
  orders.id = 12
RETURNING
      *;

SELECT
  paids.*,
  users."fullName" as "fullName",
  orders."status" as "orderStatus"
FROM
  "serviceManPaidOuts" as paids
LEFT JOIN
  "service-crm"."service-crm"."users" as users
ON
  users.id = paids."userId"
LEFT JOIN
  "service-crm"."service-crm"."orders" as orders
ON
  orders.id = paids."orderId"
WHERE
  orders."status" = (
    SELECT
      status.id
    FROM
      "service-crm"."service-crm"."dictOrderStatuses" as status
    WHERE
      status.code = 'DONE'
  )
ORDER BY
  paids.id DESC
LIMIT
  10
OFFSET
  0;

SELECT
    *
FROM
     "service-crm".orders
WHERE
    status = 4;

SELECT
  count(*) AS total
FROM
  "service-crm"."orders"
LEFT JOIN
  "service-crm"."customers" as customers
ON
  orders."customerId" = customers.id
WHERE
  orders."isActive" = true AND
  (customers."fullName" LIKE '%%' OR
  orders.id::text LIKE '%%' OR
  orders.address LIKE '%%' OR
  orders.comment LIKE '%%');

SELECT
  "statusHistory".id,
  "statusHistory"."orderId",
  "statusHistory".status,
  "statusHistory".comment,
  "statusHistory"."createdDate",
  "statusHistory"."createdBy",
  status.name,
  users."fullName"
FROM
  "service-crm"."ordersStatusHistory" as "statusHistory"
LEFT JOIN
  "service-crm"."dictOrderStatuses" as "status"
ON
  status.id = "statusHistory".status
LEFT JOIN
  "service-crm"."users" as "users"
ON
  users.id = "statusHistory"."createdBy"
WHERE
  "statusHistory"."orderId" = 27
ORDER BY
  "statusHistory".id DESC;

SELECT
  statuses.code as "code",
  statuses.action as "action",
  statuses."commentRequired" as "commentRequired",
  statuses."availableOn" as "availableOn"
FROM
  "service-crm"."dictOrderStatuses" as statuses
WHERE
  statuses."availableOn" LIKE '%ON_HOLD%' AND
  statuses."isActive" = true;

SELECT
  orders.id,
  orders.address,
  orders."createdDate",
  orders."updatedDate",
  orders.comment,
  orders."customerId",
  orders."serviceManId",
  orders."createdBy",
  status.name as "statusName",
  customers."fullName"
FROM
  "service-crm"."orders" as orders
LEFT JOIN
  "service-crm"."dictOrderStatuses" as status
ON
  orders.status = status.id
LEFT JOIN
  "service-crm"."customers" as customers
ON
  orders."customerId" = customers.id
WHERE
  orders."isActive" = true AND
  (customers."fullName" LIKE '%%' OR
  orders.id::text LIKE '%%' OR
  orders.address LIKE '%%' OR
  orders.comment LIKE '%%')
ORDER BY
  name desc
LIMIT
  10
OFFSET
  0;

SELECT
  *
FROM
  "service-crm"."orders" as orders
ORDER BY
  status DESC
LIMIT
  5
OFFSET
  0;

UPDATE
  "service-crm"."dictParts"
SET
  quantity = quantity - 2
WHERE
  id = 2;

SELECT
  statuses.code as "code",
  statuses.action as "action",
  statuses."commentRequired" as "commentRequired",
  statuses."availableOn" as "availableOn"
FROM
  "service-crm"."dictOrderStatuses" as statuses
WHERE
  statuses."availableOn" LIKE '%DONE%' AND
  statuses."isActive" = true;

SELECT
  *
FROM
  "service-crm"."soldParts"
WHERE
  "orderId" = 38 AND
  "isActive" = true;

UPDATE
  "service-crm"."dictParts"
SET
  quantity = quantity + 5
WHERE
  id = 4;

SELECT
  *
FROM
  "service-crm"."utils"
WHERE
  name = 'paidOutTerm';

UPDATE
  "service-crm".orders
SET
  "doneDate" = '2021-11-24 12:09:51.494406 +00:00'
WHERE
  status = (SELECT id FROM "service-crm"."dictOrderStatuses" WHERE code = 'DONE');

SELECT
  orders.id,
  orders.address,
  orders."createdDate",
  orders."updatedDate",
  orders.comment,
  orders."customerId",
  orders."serviceManId",
  orders."createdBy",
  orders."phone",
  status.name as "statusName",
  customers."fullName",
  customers."boilerSerial",
  users."fullName" as "serviceManFullName"
FROM
  "service-crm"."orders" as orders
LEFT JOIN
  "service-crm"."dictOrderStatuses" as status
ON
  orders.status = status.id
LEFT JOIN
  "service-crm"."users" as users
ON
  orders."serviceManId" = users.id
LEFT JOIN
  "service-crm"."customers" as customers
ON
  orders."customerId" = customers.id
WHERE
  orders."serviceManId" = 24 AND
  orders."isActive" = true AND
  (LOWER(customers."fullName") LIKE '%%' OR
  orders.id::text LIKE '%%' OR
  LOWER(orders.address) LIKE '%%' OR
  LOWER(users."fullName") LIKE '%%' OR
  LOWER(customers."boilerSerial") LIKE '%%' OR
  LOWER(orders.comment) LIKE '%%')
ORDER BY
  id desc
LIMIT
  10
OFFSET
  0;

SELECT
  count(*) AS total
FROM
  "service-crm"."orders" as orders
LEFT JOIN
  "service-crm"."customers" as customers
ON
  orders."customerId" = customers.id
LEFT JOIN
  "service-crm"."users" as users
ON
  orders."serviceManId" = users.id
WHERE
  orders."serviceManId" = 24 AND
  orders."isActive" = true AND
  (LOWER(customers."fullName") LIKE '%%' OR
  orders.id::text LIKE '%%' OR
  LOWER(orders.address) LIKE '%%' OR
  LOWER(users."fullName") LIKE '%%' OR
  LOWER(orders.comment) LIKE '%%');

SELECT
  count(*) AS total
FROM
  "service-crm"."orders"
LEFT JOIN
  "service-crm"."customers" as customers
ON
  orders."customerId" = customers.id
LEFT JOIN
  "service-crm"."users" as users
ON
  orders."serviceManId" = users.id
WHERE
  orders."serviceManId" = 24 AND
  orders."isActive" = true AND
  (LOWER(customers."fullName") LIKE '%%' OR
  orders.id::text LIKE '%%' OR
  LOWER(orders.address) LIKE '%%' OR
  LOWER(users."fullName") LIKE '%%' OR
  LOWER(orders.comment) LIKE '%%');

SELECT
  statuses.code
FROM
  "service-crm".orders
LEFT JOIN
  "service-crm"."dictOrderStatuses" as statuses
ON
  orders.status = statuses.id AND
  orders."isActive" = true
WHERE
  orders.id = 54;

UPDATE
  "service-crm"."serviceManPaidOuts"
SET
  "isPaid" = true,
  "updatedDate" = NOW()
WHERE
  id = 3
RETURNING
  *;

---------------------- CLEAR DATABASE ----------------

DELETE FROM
  "service-crm"."serviceManPaidOuts";

DELETE FROM
  "service-crm"."soldBoilers";

DELETE FROM
  "service-crm"."soldJobTypes";

DELETE FROM
  "service-crm"."soldParts";

DELETE FROM
  "service-crm"."ordersStatusHistory";

DELETE FROM
  "service-crm"."orders";

DELETE FROM
  "service-crm"."dictRoles"
WHERE
  id <> 1 AND
  id <> 2 AND
  id <> 3;

DELETE FROM
  "service-crm"."dictParts";

DELETE FROM
  "service-crm"."dictJobTypes";

DELETE FROM
  "service-crm".customers;

DELETE FROM
  "service-crm"."dictBoilers";

DELETE FROM
  "service-crm"."users"
WHERE
  id <> 1 AND
  id <> 32;

---------------------------------------------------------------------------------

SELECT
    orders.id,
    orders.address,
    orders."createdDate",
    orders."updatedDate",
    orders.comment,
    orders."customerId",
    orders."serviceManId",
    orders."createdBy",
    orders."phone",
    status.name as "statusName",
    status.code as "statusCode",
    customers."fullName",
    customers."boilerSerial",
    users."fullName" as "serviceManFullName",
    boilers.name as "boilerName"
  FROM
    "service-crm"."orders" as orders
  LEFT JOIN
    "service-crm"."dictOrderStatuses" as status
  ON
    orders.status = status.id
  LEFT JOIN
    "service-crm"."customers" as customers
  ON
    orders."customerId" = customers.id
  LEFT JOIN
    "service-crm"."users" as users
  ON
    orders."serviceManId" = users.id
  LEFT JOIN
    "service-crm"."dictBoilers" as boilers
  ON
    customers."boilerId" = boilers.id
  WHERE
    orders."isActive" = true AND
    (LOWER(customers."fullName") LIKE 'соз' OR
    orders.id::text LIKE 'соз' OR
    LOWER(orders.address) LIKE 'соз' OR
    LOWER(users."fullName") LIKE 'соз' OR
    LOWER(customers."boilerSerial") LIKE 'соз' OR
    LOWER(boilers.name) LIKE 'соз' OR
    LOWER(status.name) LIKE 'соз' OR
    LOWER(orders.comment) LIKE 'соз');

SELECT
    count(*) AS total
  FROM
    "service-crm"."orders"
  LEFT JOIN
    "service-crm"."customers" as customers
  ON
    orders."customerId" = customers.id
  LEFT JOIN
    "service-crm"."dictOrderStatuses" as status
  ON
    orders.status = status.id
  LEFT JOIN
    "service-crm"."users" as users
  ON
    orders."serviceManId" = users.id
  LEFT JOIN
    "service-crm"."dictBoilers" as boilers
  ON
    customers."boilerId" = boilers.id
  WHERE
    orders."isActive" = true AND
    (LOWER(customers."fullName") LIKE 'создан' OR
    orders.id::text LIKE 'создан' OR
    LOWER(orders.address) LIKE 'создан' OR
    LOWER(users."fullName") LIKE 'создан' OR
    LOWER(boilers.name) LIKE 'создан' OR
    LOWER(status.name) LIKE 'создан' OR
    LOWER(orders.comment) LIKE 'создан');

SELECT
    *
FROM
    "service-crm"."orders"

SELECT
  *
FROM
  "service-crm"."users" as users
WHERE
  users.id = 1 OR
  users."roleId" = (SELECT id FROM "service-crm"."dictRoles" WHERE code = 'ADMIN') OR
  users."roleId" = (SELECT id FROM "service-crm"."dictRoles" WHERE code = 'SUPER_ADMIN');

UPDATE
  "service-crm"."orders" as orders
SET
  "status" = 4
WHERE
  orders.status = 6;

-- CLEAR PAID OUTS
DELETE FROM
  "service-crm"."serviceManPaidOuts";

DELETE FROM
  "service-crm"."cashHistoryLog";
