SELECT
  orders.*,
  status.name
FROM
  "service-crm".orders as orders
LEFT JOIN
  "service-crm"."dictOrderStatuses" as status
ON
  orders.status = status.id