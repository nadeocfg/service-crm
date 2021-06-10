UPDATE
  "service-crm".users
SET "firstName" = 'testName'
WHERE id = 33
RETURNING
  *;

SELECT *
FROM "service-crm".users
WHERE login LIKE '%a%'
   OR 'firstName' LIKE '%a%'
   OR 'lastName' LIKE '%a%'
   OR phone LIKE '%a%'
GROUP BY id
ORDER BY id
LIMIT
  10
OFFSET
0;

SELECT (SELECT COUNT(*) AS bar
        FROM "service-crm".users
        WHERE login LIKE '%a%'
           OR 'firstName' LIKE '%a%'
           OR 'lastName' LIKE '%a%'
           OR phone LIKE '%a%') total
FROM "service-crm".users
ORDER BY id;

SELECT rows
FROM "service-crm".users
WHERE name = @primary_key;

SELECT
  id,
  login,
  "birthDay",
  phone,
  "createdDate",
  "updatedDate",
  "fullName",
  "roleId",
  "percentFromJob",
  "percentFromParts",
  "percentFromVisit",
  "roleName"
FROM
  (
  SELECT
    users.id,
    users.login,
    users."birthDay",
    users.phone,
    users."createdDate",
    users."updatedDate",
    users."fullName",
    users."roleId",
    users."percentFromJob",
    users."percentFromParts",
    users."percentFromVisit",
    roles.name as "roleName"
  FROM
    "service-crm".users as users
  LEFT JOIN
    "service-crm"."dictRoles" as roles
  ON
    users."roleId" = roles.id
  ) as Users
WHERE
  login LIKE '%a%' OR
  "fullName" LIKE '%a%' OR
  phone LIKE '%a%'
ORDER BY
  id
LIMIT
  10
OFFSET
  0;

SELECT users.*,
       roles.name,
       roles.code
FROM "service-crm".users as users
       LEFT JOIN
     "service-crm"."dictRoles" as roles
     ON
       users."roleId" = roles.id
WHERE "roleId" = 2;

SELECT id
FROM "service-crm".users
WHERE id = 200

UPDATE
  "service-crm".users
SET "password"         = '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',
    "fullName"         = 'first1',
    "birthDay"         = '1990-07-16',
    "phone"            = '+7 (777) 123-45-65',
    "percentFromJob"   = '20',
    "percentFromParts" = '22',
    "percentFromVisit" = '33',
    "roleId"           = '3',
    "updatedDate"      = NOW()
WHERE id = '200'
RETURNING
  id,
  login,
  "birthDay",
  phone,
  "createdDate",
  "updatedDate",
  "fullName",
  "roleId",
  "percentFromJob",
  "percentFromParts",
  "percentFromVisit";

INSERT INTO "service-crm"."dictRoles" (code, name, "createdDate", "updatedDate")
VALUES($1, $2, NOW(), NOW())
RETURNING
  id,
  code,
  name,
  "createdDate",
  "updatedDate";