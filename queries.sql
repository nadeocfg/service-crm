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