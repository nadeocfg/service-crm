SELECT
  orders.*,
  status.name
FROM
  "service-crm".orders as orders
LEFT JOIN
  "service-crm"."dictOrderStatuses" as status
ON
  orders.status = status.id;

GRANT USAGE ON SCHEMA "service-crm" TO;

SELECT * FROM pg_roles;

SELECT * FROM pg_user;

GRANT CONNECT ON DATABASE "service-crm" TO "service-crm";

GRANT USAGE ON SCHEMA "service-crm" TO "service-crm";

GRANT ALL ON SCHEMA "service-crm" TO "service-crm";

GRANT USAGE ON TABLES TO "service-crm";

grant all privileges on database "service-crm" to "service-crm";
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA "service-crm" TO "service-crm";
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA "service-crm" TO "service-crm";

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
  users."fullName" as "fullName"
FROM
  "service-crm"."serviceManPaidOuts" as paids
LEFT JOIN
  "service-crm"."users" as users
ON
  users.id = paids."userId"
WHERE
  (users."fullName" like '%26%' OR paids."orderId"::text like '%26%')
ORDER BY
  paids.id DESC
LIMIT
  10
OFFSET
  0;