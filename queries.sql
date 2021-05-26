UPDATE
    "service-crm".users
SET
    "firstName" = 'testName'
WHERE
    id = 33
RETURNING
    *