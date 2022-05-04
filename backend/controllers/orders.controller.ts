import { NextFunction, Response } from 'express';
import { UserRequest } from '../../frontend/src/models/UserRequestModels';
import db from '../config/db';
import dotenv from 'dotenv';
import format from 'pg-format';
import moment from 'moment';
import sendMessageToBot from '../utils/sendMessageToBot';

dotenv.config();

// @desc   create order
// @route  POST /api/orders/create
// @access Private
const createOrder = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const createdBy = request.user?.id || 1;
    const {
      customer,
      address,
      phone,
      serviceMan,
      comment,
      parts,
      jobTypes,
      visitPrice,
      boiler,
    } = request.body;

    const requiredKeys = [
      'customer',
      'address',
      'visitPrice',
      'serviceMan',
      'parts',
      'jobTypes',
      'boiler',
      'phone',
    ];

    for (let i = 0; i < requiredKeys.length; i += 1) {
      if (!Object.keys(request.body).includes(requiredKeys[i])) {
        throw Error(`Request body not have required key: ${requiredKeys[i]}`);
      }
    }

    const insertOrder = await db.query(
      `
        INSERT INTO
          "${process.env.DB_NAME}"."orders" ("customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "visitPrice", "boilerId", phone)
        VALUES($1, $2, $3, NOW(), NOW(), 1, $4, $5, $6, $7, $8)
        RETURNING
          *;
      `,
      [
        customer.id,
        createdBy,
        address,
        serviceMan.id,
        comment,
        visitPrice,
        boiler.id,
        phone,
      ]
    );

    const insertOrderHistory = await db.query(
      `
        INSERT INTO
          "${process.env.DB_NAME}"."ordersStatusHistory" ("orderId", "status", "comment", "createdBy")
        VALUES($1, (
          SELECT
            status.id
          FROM
            "${process.env.DB_NAME}"."dictOrderStatuses" as status
          WHERE
            status.code = $2
        ), $3, $4)
        RETURNING
          *;
      `,
      [insertOrder.rows[0].id, 'CREATED', comment, createdBy]
    );

    let partsTotal: number = 0;
    for (let i = 0; i < parts.length; i += 1) {
      const { selectedPrice, soldQuantity, id, daysOfGuarantee, quantity } =
        parts[i];
      const insertSoldPart = await db.query(
        `
          INSERT INTO
            "${process.env.DB_NAME}"."soldParts" (price, quantity, sum, "orderId", "partId", "daysOfGuarantee", "createdDate", "updatedDate")
          VALUES($1, $2, $3, $4, $5, $6, NOW(), NOW())
          RETURNING
            *;
        `,
        [
          selectedPrice,
          soldQuantity,
          selectedPrice * soldQuantity,
          insertOrder.rows[0].id,
          id,
          daysOfGuarantee,
        ]
      );

      const subQuantity = await db.query(
        `
          UPDATE
            "${process.env.DB_NAME}"."dictParts"
          SET
            quantity = quantity - $1
          WHERE
            id = $2;
        `,
        [soldQuantity, id]
      );

      partsTotal += selectedPrice * soldQuantity;
    }

    let jobTotal: number = 0;
    for (let i = 0; i < jobTypes.length; i += 1) {
      const { id, selectedPrice, soldQuantity, daysOfGuarantee } = jobTypes[i];
      const insertSoldJobTypes = await db.query(
        `
          INSERT INTO
            "${process.env.DB_NAME}"."soldJobTypes" ("jobTypeId", price, quantity, sum, "orderId", "daysOfGuarantee", "createdDate", "updatedDate")
          VALUES($1, $2, $3, $4, $5, $6, NOW(), NOW())
          RETURNING
            *;
        `,
        [
          id,
          selectedPrice,
          soldQuantity,
          selectedPrice * soldQuantity,
          insertOrder.rows[0].id,
          daysOfGuarantee,
        ]
      );

      jobTotal += selectedPrice * soldQuantity;
    }

    const serviceManPercents: any = await db.query(
      `
        SELECT
          users."percentFromVisit",
          users."percentFromParts",
          users."percentFromJob",
          users."fullName",
          users."tgAccount"
        FROM
          "${process.env.DB_NAME}"."users" as users
        WHERE
          users.id = $1
        ORDER BY
          users.id;
      `,
      [serviceMan.id]
    );

    const serviceManPartsPaidOut =
      (partsTotal / 100) * serviceManPercents.rows[0].percentFromParts;
    const serviceManJobPaidOut =
      (jobTotal / 100) * serviceManPercents.rows[0].percentFromJob;
    const serviceManVisitPaidOut =
      (visitPrice / 100) * serviceManPercents.rows[0].percentFromVisit;

    const insertTotalSum = await db.query(
      `
        UPDATE
          "${process.env.DB_NAME}"."orders"
        SET
          "totalSum" = $1
        WHERE
          id = $2;
      `,
      [partsTotal + jobTotal + visitPrice, insertOrder.rows[0].id]
    );

    const insertPaidOut: any = await db.query(
      `
        INSERT INTO
          "${process.env.DB_NAME}"."serviceManPaidOuts" ("userId", job, parts, visit, "orderId")
        VALUES($1, $2, $3, $4, $5)
        RETURNING
          *;
      `,
      [
        serviceMan.id,
        serviceManJobPaidOut,
        serviceManPartsPaidOut,
        serviceManVisitPaidOut,
        insertOrder.rows[0].id,
      ]
    );

    await sendMessageToBot(
      `
<b>Новая заявка №${insertOrder.rows[0].id}</b>

Назначена на:
${serviceManPercents.rows[0].fullName}(@${serviceManPercents.rows[0].tgAccount})
Дата: ${moment(new Date()).format('DD.MM.YYYY HH:mm:ss')}
    `,
      '-1001613758269'
    );

    response.json(insertOrder.rows);
  } catch (error: any) {
    response.status(400).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   update order
// @route  POST /api/orders/update
// @access Private
const updateOrder = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const {
      customer,
      address,
      serviceMan,
      comment,
      parts,
      jobTypes,
      visitPrice,
      orderId,
      phone,
    } = request.body;

    const requiredKeys = [
      'customer',
      'address',
      'visitPrice',
      'serviceMan',
      'parts',
      'jobTypes',
      'orderId',
      'phone',
    ];

    for (let i = 0; i < requiredKeys.length; i += 1) {
      if (!Object.keys(request.body).includes(requiredKeys[i])) {
        return response.status(400).json({
          message: `Request body not have required key: ${requiredKeys[i]}`,
        });
      }
    }

    const checkStatus = await db.query(
      `
        SELECT
          statuses.code
        FROM
          "${process.env.DB_NAME}".orders
        LEFT JOIN
          "${process.env.DB_NAME}"."dictOrderStatuses" as statuses
        ON
          orders.status = statuses.id
        WHERE
          orders.id = $1 AND
          orders."isActive" = true;
      `,
      [orderId]
    );

    for (let i = 0; i < checkStatus.rows.length; i += 1) {
      if (
        checkStatus.rows[i].code === 'DONE' ||
        checkStatus.rows[i].code === 'CANCELED'
      ) {
        return response.status(400).json({
          message: `Order cannot be edit on status DONE or CANCELED`,
        });
      }
    }

    const updateOrder = await db.query(
      `
        UPDATE
          "${process.env.DB_NAME}"."orders" as orders
        SET
          "customerId" = $1,
          address = $2,
          "updatedDate" = NOW(),
          "serviceManId" = $3,
          phone = $6,
          "visitPrice" = $7,
          comment = $4
        WHERE
          orders.id = $5
        RETURNING
          *;
      `,
      [customer.id, address, serviceMan.id, comment, orderId, phone, visitPrice]
    );

    const disableOldSoldParts = await db.query(
      `
        UPDATE
          "${process.env.DB_NAME}"."soldParts"
        SET
          "isActive" = false,
          "updatedDate" = NOW()
        WHERE
          "orderId" = $1
        RETURNING
          *;
      `,
      [orderId]
    );

    for (let i = 0; i < disableOldSoldParts.rows.length; i += 1) {
      const returnQuantity = await db.query(
        `
          UPDATE
            "${process.env.DB_NAME}"."dictParts"
          SET
            quantity = quantity + $1
          WHERE
            id = $2;
        `,
        [disableOldSoldParts.rows[i].quantity, disableOldSoldParts.rows[i].id]
      );
    }

    let partsTotal: number = 0;
    for (let i = 0; i < parts.length; i += 1) {
      const { selectedPrice, soldQuantity, id, daysOfGuarantee, quantity } =
        parts[i];
      const insertSoldPart = await db.query(
        `
          INSERT INTO
            "${process.env.DB_NAME}"."soldParts" (price, quantity, sum, "orderId", "partId", "daysOfGuarantee", "createdDate", "updatedDate")
          VALUES($1, $2, $3, $4, $5, $6, NOW(), NOW())
          RETURNING
            *;
        `,
        [
          selectedPrice,
          soldQuantity,
          selectedPrice * soldQuantity,
          updateOrder.rows[0].id,
          id,
          daysOfGuarantee,
        ]
      );

      const subQuantity = await db.query(
        `
          UPDATE
            "${process.env.DB_NAME}"."dictParts"
          SET
            quantity = quantity - $1
          WHERE
            id = $2;
        `,
        [soldQuantity, id]
      );

      partsTotal += selectedPrice * soldQuantity;
    }

    const disableOldSoldJobTypes = await db.query(
      `
        UPDATE
          "${process.env.DB_NAME}"."soldJobTypes"
        SET
          "isActive" = false,
          "updatedDate" = NOW()
        WHERE
          "orderId" = $1
        RETURNING
          *;
      `,
      [orderId]
    );

    let jobTotal: number = 0;
    for (let i = 0; i < jobTypes.length; i += 1) {
      const { id, selectedPrice, soldQuantity, daysOfGuarantee } = jobTypes[i];
      const insertSoldJobTypes = await db.query(
        `
          INSERT INTO
            "${process.env.DB_NAME}"."soldJobTypes" ("jobTypeId", price, quantity, sum, "orderId", "daysOfGuarantee", "createdDate", "updatedDate")
          VALUES($1, $2, $3, $4, $5, $6, NOW(), NOW())
          RETURNING
            *;
        `,
        [
          id,
          selectedPrice,
          soldQuantity,
          selectedPrice * soldQuantity,
          updateOrder.rows[0].id,
          daysOfGuarantee,
        ]
      );

      jobTotal += selectedPrice * soldQuantity;
    }

    const serviceManPercents: any = await db.query(
      `
        SELECT
          users."percentFromVisit",
          users."percentFromParts",
          users."percentFromJob"
        FROM
          "${process.env.DB_NAME}"."users" as users
        WHERE
          users.id = $1
        ORDER BY
          users.id;
      `,
      [serviceMan.id]
    );

    const serviceManPartsPaidOut =
      (partsTotal / 100) * serviceManPercents.rows[0].percentFromParts;
    const serviceManJobPaidOut =
      (jobTotal / 100) * serviceManPercents.rows[0].percentFromJob;
    const serviceManVisitPaidOut =
      (visitPrice / 100) * serviceManPercents.rows[0].percentFromVisit;

    const insertTotalSum = await db.query(
      `
        UPDATE
          "${process.env.DB_NAME}"."orders"
        SET
          "totalSum" = $1
        WHERE
          id = $2;
      `,
      [partsTotal + jobTotal + visitPrice, updateOrder.rows[0].id]
    );

    const insertPaidOut: any = await db.query(
      `
        UPDATE
          "${process.env.DB_NAME}"."serviceManPaidOuts"
        SET
          "userId" = $1,
          "job" = $2,
          "parts" = $3,
          "visit" = $4,
          "updatedDate" = NOW()
        WHERE
          "orderId" = $5
        RETURNING
          *;
      `,
      [
        serviceMan.id,
        serviceManJobPaidOut,
        serviceManPartsPaidOut,
        serviceManVisitPaidOut,
        updateOrder.rows[0].id,
      ]
    );

    response.json(updateOrder.rows);
  } catch (error: any) {
    response.status(400).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   get order by id
// @route  GET /api/orders/:id
// @access Private
const getOrderById = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { id } = request.params;
    const user = request.user;

    if (!id) {
      return response.status(400).json({
        message: `Order ID is required`,
      });
    }

    const getOrderById = await db.query(
      `
        SELECT
          orders.id as "orderId",
          orders.address,
          orders."visitPrice",
          orders.comment,
          orders."serviceManId",
          orders."boilerId",
          orders."customerId",
          orders."createdDate",
          orders."updatedDate",
          orders.phone,
          statuses.name as "status"
        FROM
          "${process.env.DB_NAME}"."orders" as orders
        LEFT JOIN
          "${process.env.DB_NAME}"."dictOrderStatuses" as statuses
        ON
          orders."status" = statuses.id
        WHERE
          orders.id = $1;
      `,
      [id]
    );

    if (getOrderById.rowCount === 0) {
      return response.status(400).json({
        message: `Cannot find order with id ${id}`,
      });
    }

    if (
      getOrderById.rows[0]?.serviceManId !== user?.id &&
      user?.roleCode !== 'SUPER_ADMIN' &&
      user?.roleCode !== 'ADMIN'
    ) {
      return response.status(401).json({
        message: 'Нет доступа к заказу',
      });
    }

    const soldParts = await db.query(
      `
        SELECT
          "soldParts"."partId" as "partId",
          "soldParts"."quantity" as "quantity",
          "soldParts"."price" as "price"
        FROM
          "${process.env.DB_NAME}"."soldParts" as "soldParts"
        WHERE
          "soldParts"."orderId" = $1 AND
          "soldParts"."isActive" = true;
      `,
      [id]
    );

    const parts = [];
    for (let i = 0; i < soldParts.rows.length; i += 1) {
      const partInfo = await db.query(
        `
          SELECT
            *
          FROM
            "${process.env.DB_NAME}"."dictParts" as parts
          WHERE
            id = $1;
        `,
        [soldParts.rows[i].partId]
      );

      const result = partInfo.rows.reduce((acc, item) => {
        const prices = [
          {
            name: 'Цена',
            value: item.price,
          },
          {
            name: 'Цена 1',
            value: item.price1,
          },
          {
            name: 'Цена 2',
            value: item.price2,
          },
          {
            name: 'Цена 3',
            value: item.price3,
          },
        ];

        const resItem = {
          ...item,
          prices,
        };

        delete resItem.price;
        delete resItem.price1;
        delete resItem.price2;
        delete resItem.price3;

        acc.push(resItem);

        return acc;
      }, []);

      parts.push({
        ...result[0],
        soldQuantity: soldParts.rows[i].quantity,
        selectedPrice: soldParts.rows[i].price,
      });
    }

    const soldJobTypes = await db.query(
      `
        SELECT
          "jobTypeId",
          quantity,
          price
        FROM
          "${process.env.DB_NAME}"."soldJobTypes" as "soldJobTypes"
        WHERE
          "soldJobTypes"."orderId" = $1 AND
          "soldJobTypes"."isActive" = true;
      `,
      [id]
    );

    const jobTypes = [];
    for (let i = 0; i < soldJobTypes.rows.length; i += 1) {
      const jobInfo = await db.query(
        `
          SELECT
            *
          FROM
            "${process.env.DB_NAME}"."dictJobTypes" as jobTypes
          WHERE
            id = $1;
        `,
        [soldJobTypes.rows[i].jobTypeId]
      );

      const result = jobInfo.rows.reduce((acc, item) => {
        const prices = [
          {
            name: 'Цена',
            value: item.price,
          },
          {
            name: 'Цена 1',
            value: item.price1,
          },
          {
            name: 'Цена 2',
            value: item.price2,
          },
          {
            name: 'Цена 3',
            value: item.price3,
          },
        ];

        const resItem = {
          ...item,
          prices,
        };

        delete resItem.price;
        delete resItem.price1;
        delete resItem.price2;
        delete resItem.price3;

        acc.push(resItem);

        return acc;
      }, []);

      jobTypes.push({
        ...result[0],
        soldQuantity: soldJobTypes.rows[i].quantity,
        selectedPrice: soldJobTypes.rows[i].price,
      });
    }

    const customer = await db.query(
      `
        SELECT
          *
        FROM
          "${process.env.DB_NAME}"."customers"
        WHERE
          id = $1;
      `,
      [getOrderById.rows[0].customerId]
    );

    const boiler = await db.query(
      `
        SELECT
          *
        FROM
          "${process.env.DB_NAME}"."dictBoilers" as "dictBoilers"
        WHERE
          "dictBoilers".id = $1 AND
          "dictBoilers"."isActive" = true;
      `,
      [getOrderById.rows[0].boilerId]
    );

    const serviceMan = await db.query(
      `
        SELECT
          "id",
          "login",
          "birthDay",
          "phone",
          "createdDate",
          "updatedDate",
          "fullName",
          "roleId",
          "percentFromJob",
          "percentFromParts",
          "percentFromVisit",
          "isActive"
        FROM
          "${process.env.DB_NAME}"."users"
        WHERE
          id = $1;
      `,
      [getOrderById.rows[0].serviceManId]
    );

    delete getOrderById.rows[0].serviceManId;
    delete getOrderById.rows[0].customerId;
    delete getOrderById.rows[0].boilerId;

    const result = {
      ...getOrderById.rows[0],
      parts,
      jobTypes,
      customer: {
        ...customer.rows[0],
        purchaseDate: moment(customer.rows[0].purchaseDate).format(
          'DD/MM/YYYY'
        ),
        boiler: boiler.rows[0],
      },
      serviceMan: serviceMan.rows[0],
    };

    response.json(result);
  } catch (error: any) {
    response.status(400).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   get orders by role
// @route  GET /api/orders
// @access Private
const getOrders = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { page, count, searchValue, sort = 'id,desc' } = request.query;
    const sortBy = (<string>sort).split(',')[0];
    const order = (<string>sort).split(',')[1];
    const roleCode = request.user?.roleCode || '';
    const userId = request.user?.id || '';

    let offset = 0;

    if (page && count) {
      offset = Number(page) * Number(count);
    } else {
      return response.status(400).json({
        message: 'Wrong GET params',
      });
    }

    let orders = [];
    let total = null;

    if (roleCode === 'ADMIN' || roleCode === 'SUPER_ADMIN') {
      const getAllOrders = await db.query(
        `
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
            "${process.env.DB_NAME}"."orders" as orders
          LEFT JOIN
            "${process.env.DB_NAME}"."dictOrderStatuses" as status
          ON
            orders.status = status.id
          LEFT JOIN
            "${process.env.DB_NAME}"."customers" as customers
          ON
            orders."customerId" = customers.id
          LEFT JOIN
            "${process.env.DB_NAME}"."users" as users
          ON
            orders."serviceManId" = users.id
          LEFT JOIN
            "${process.env.DB_NAME}"."dictBoilers" as boilers
          ON
            customers."boilerId" = boilers.id
          WHERE
            orders."isActive" = true AND
            (LOWER(customers."fullName") LIKE $3 OR
            orders.id::text LIKE $3 OR
            LOWER(orders.address) LIKE $3 OR
            LOWER(users."fullName") LIKE $3 OR
            LOWER(customers."boilerSerial") LIKE $3 OR
            LOWER(boilers.name) LIKE $3 OR
            LOWER(status.name) LIKE $3 OR
            LOWER(orders.comment) LIKE $3)
          ORDER BY
            ${format('%I', sortBy)} ${format('%s', order)}
          LIMIT
            $1
          OFFSET
            $2;
        `,
        [count, offset, `%${searchValue}%`.toLowerCase()]
      );

      total = await db.query(
        `
          SELECT
            count(*) AS total
          FROM
            "${process.env.DB_NAME}"."orders"
          LEFT JOIN
            "${process.env.DB_NAME}"."customers" as customers
          ON
            orders."customerId" = customers.id
          LEFT JOIN
            "${process.env.DB_NAME}"."dictOrderStatuses" as status
          ON
            orders.status = status.id
          LEFT JOIN
            "${process.env.DB_NAME}"."users" as users
          ON
            orders."serviceManId" = users.id
          LEFT JOIN
            "${process.env.DB_NAME}"."dictBoilers" as boilers
          ON
            customers."boilerId" = boilers.id
          WHERE
            orders."isActive" = true AND
            (LOWER(customers."fullName") LIKE $1 OR
            orders.id::text LIKE $1 OR
            LOWER(orders.address) LIKE $1 OR
            LOWER(users."fullName") LIKE $1 OR
            LOWER(boilers.name) LIKE $1 OR
            LOWER(status.name) LIKE $1 OR
            LOWER(orders.comment) LIKE $1);
        `,
        [`%${searchValue}%`.toLowerCase()]
      );

      orders = getAllOrders.rows;
    } else {
      const getUserOrders = await db.query(
        `
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
            "${process.env.DB_NAME}"."orders" as orders
            LEFT JOIN
              "${process.env.DB_NAME}"."dictOrderStatuses" as status
            ON
              orders.status = status.id
            LEFT JOIN
              "${process.env.DB_NAME}"."users" as users
            ON
              orders."serviceManId" = users.id
            LEFT JOIN
              "${process.env.DB_NAME}"."customers" as customers
            ON
              orders."customerId" = customers.id
            LEFT JOIN
              "${process.env.DB_NAME}"."dictBoilers" as boilers
            ON
              customers."boilerId" = boilers.id
          WHERE
            orders."serviceManId" = $3 AND
            orders."isActive" = true AND
            (LOWER(customers."fullName") LIKE $4 OR
            orders.id::text LIKE $4 OR
            LOWER(orders.address) LIKE $4 OR
            LOWER(users."fullName") LIKE $4 OR
            LOWER(customers."boilerSerial") LIKE $4 OR
            LOWER(boilers.name) LIKE $4 OR
            LOWER(status.name) LIKE $4 OR
            LOWER(orders.comment) LIKE $4)
          ORDER BY
            ${format('%I', sortBy)} ${format('%s', order)}
          LIMIT
            $1
          OFFSET
            $2;
        `,
        [count, offset, userId, `%${searchValue}%`.toLowerCase()]
      );

      total = await db.query(
        `
          SELECT
            count(*) AS total
          FROM
            "${process.env.DB_NAME}"."orders" as orders
          LEFT JOIN
            "${process.env.DB_NAME}"."dictOrderStatuses" as status
          ON
            orders.status = status.id
          LEFT JOIN
            "${process.env.DB_NAME}"."customers" as customers
          ON
            orders."customerId" = customers.id
          LEFT JOIN
            "${process.env.DB_NAME}"."users" as users
          ON
            orders."serviceManId" = users.id
          LEFT JOIN
            "${process.env.DB_NAME}"."dictBoilers" as boilers
          ON
            customers."boilerId" = boilers.id
          WHERE
            orders."serviceManId" = $1 AND
            orders."isActive" = true AND
            (LOWER(customers."fullName") LIKE $2 OR
            orders.id::text LIKE $2 OR
            LOWER(orders.address) LIKE $2 OR
            LOWER(users."fullName") LIKE $2 OR
            LOWER(boilers.name) LIKE $2 OR
            LOWER(status.name) LIKE $2 OR
            LOWER(orders.comment) LIKE $2);
        `,
        [userId, `%${searchValue}%`.toLowerCase()]
      );

      orders = getUserOrders.rows;
    }

    for (let i = 0; i < orders.length; i += 1) {
      const orderJobs = await db.query(
        `
          SELECT
            *
          FROM
            "${process.env.DB_NAME}"."soldJobTypes"
          WHERE
            "orderId" = $1 AND
            "isActive" = true
          ORDER BY
            id;
        `,
        [orders[i].id]
      );

      const orderParts = await db.query(
        `
          SELECT
            *
          FROM
            "${process.env.DB_NAME}"."soldParts"
          WHERE
            "orderId" = $1 AND
            "isActive" = true
          ORDER BY
            id;
        `,
        [orders[i].id]
      );

      const customer = await db.query(
        `
          SELECT
            *
          FROM
            "${process.env.DB_NAME}"."customers"
          WHERE
            "id" = $1;
        `,
        [orders[i].customerId]
      );

      const serviceMan = await db.query(
        `
          SELECT
            id,
            login,
            phone,
            "fullName",
            "percentFromJob",
            "percentFromParts",
            "percentFromVisit"
          FROM
            "${process.env.DB_NAME}"."users"
          WHERE
            "id" = $1;
        `,
        [orders[i].serviceManId]
      );

      const createdBy = await db.query(
        `
          SELECT
            login,
            "fullName",
            phone
          FROM
            "${process.env.DB_NAME}"."users"
          WHERE
            "id" = $1;
        `,
        [orders[i].createdBy]
      );

      orders[i].jobs = orderJobs.rows;
      orders[i].parts = orderParts.rows;
      orders[i].customer = customer.rows.length > 0 ? customer.rows[0] : {};
      orders[i].serviceMan =
        serviceMan.rows.length > 0 ? serviceMan.rows[0] : {};
      orders[i].createdBy = createdBy.rows.length > 0 ? createdBy.rows[0] : {};
    }

    response.json({
      orders: orders,
      total: +total.rows[0]?.total || 0,
    });
  } catch (error: any) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   get order actions
// @route  GET /api/orders/:id/actions
// @access Private
const getOrderActions = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { id } = request.params;
    const user = request.user || null;

    const order = await db.query(
      `
        SELECT
          orders.id,
          orders.status,
          orders."serviceManId",
          statuses.code as "statusCode"
        FROM
          "${process.env.DB_NAME}"."orders" as orders
        LEFT JOIN
          "${process.env.DB_NAME}"."dictOrderStatuses" as statuses
        ON
          statuses.id = orders.status
        WHERE
          orders.id = $1 AND
          orders."isActive" = true;
      `,
      [id]
    );

    if (order.rows[0]?.statusCode === 'DONE') {
      return response.json([]);
    }

    if (
      order.rows[0]?.serviceManId !== user?.id &&
      user?.roleCode !== 'SUPER_ADMIN' &&
      user?.roleCode !== 'ADMIN'
    ) {
      return response.status(401).json({
        message: 'Нет доступа к изменению статуса',
      });
    }

    const availableStatuses = await db.query(
      `
        SELECT
          statuses.code as "code",
          statuses.action as "action",
          statuses."commentRequired" as "commentRequired",
          statuses."availableOn" as "availableOn"
        FROM
          "${process.env.DB_NAME}"."dictOrderStatuses" as statuses
        WHERE
          statuses."availableOn" LIKE $1 AND
          statuses."isActive" = true;
      `,
      [`%${order.rows[0]?.statusCode}%`]
    );

    if (
      availableStatuses.rows[0]?.availableOn === 'SERVICE_DONE' &&
      user?.roleCode !== 'SUPER_ADMIN' &&
      user?.roleCode !== 'ADMIN'
    ) {
      return response.json([]);
    }

    response.json(availableStatuses.rows);
  } catch (error: any) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   execute action
// @route  POST /api/orders/execute-action
// @access Private
const executeAction = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { orderId, code, comment } = request.body;
    const user = request.user || null;

    const order = await db.query(
      `
        SELECT
          orders.id,
          orders.status,
          orders."serviceManId"
        FROM
          "${process.env.DB_NAME}"."orders" as orders
        WHERE
          orders.id = $1 AND
          orders."isActive" = true;
      `,
      [orderId]
    );

    const getStatusInfo = await db.query(
      `
        SELECT
          *
        FROM
          "${process.env.DB_NAME}"."dictOrderStatuses" as status
        WHERE
          status.code = $1;
      `,
      [code]
    );

    if (
      order.rows[0]?.serviceManId !== user?.id &&
      user?.roleCode !== 'SUPER_ADMIN' &&
      user?.roleCode !== 'ADMIN'
    ) {
      return response.status(401).json({
        message: 'Нет доступа к изменению статуса',
      });
    }

    const changeStatus = await db.query(
      `
        UPDATE
          "${process.env.DB_NAME}"."orders" as orders
        SET
          status = $1,
          "updatedDate" = NOW()
          ${code === 'DONE' ? ', "doneDate" = NOW()' : ''}
        WHERE
          orders.id = $2
        RETURNING
          *;
      `,
      [getStatusInfo.rows[0].id, orderId]
    );

    // UPDATE CASH TABLE IF ORDER STATUS === 'DONE'
    if (code === 'DONE') {
      const paidOutSum = await db.query(
        `
          SELECT
            *
          FROM
            "${process.env.DB_NAME}"."serviceManPaidOuts"
          WHERE
            "orderId" = $1;
        `,
        [orderId]
      );

      const getCashItem = await db.query(
        `
          SELECT
            *
          FROM
            "${process.env.DB_NAME}"."cash"
          WHERE
            "userId" = $1;
        `,
        [order.rows[0]?.serviceManId]
      );

      if (getCashItem.rows.length === 0) {
        const insertRow = await db.query(
          `
            INSERT INTO
              "${process.env.DB_NAME}"."cash" ("userId", "notReadySum", "createdDate", "updatedDate")
            VALUES($1, $2, NOW(), NOW())
            RETURNING
              *;
          `,
          [
            order.rows[0]?.serviceManId,
            +paidOutSum.rows[0].parts +
              +paidOutSum.rows[0].job +
              +paidOutSum.rows[0].visit || 0,
          ]
        );
      } else {
        const updateRow = await db.query(
          `
            UPDATE
              "${process.env.DB_NAME}"."cash"
            SET
              "notReadySum" = $1,
              "updatedDate" = NOW()
            WHERE
              "userId" = $2
            RETURNING
              *;
          `,
          [
            +getCashItem.rows[0].notReadySum +
              +paidOutSum.rows[0].parts +
              +paidOutSum.rows[0].job +
              +paidOutSum.rows[0].visit || getCashItem.rows[0].readySum,
            order.rows[0]?.serviceManId,
          ]
        );
      }
    }

    const insertOrderHistory = await db.query(
      `
        INSERT INTO
          "${process.env.DB_NAME}"."ordersStatusHistory" ("orderId", "status", "comment", "createdBy")
        VALUES($1, $2, $3, $4)
        RETURNING
          *;
      `,
      [orderId, getStatusInfo.rows[0].id, comment, user?.id || 1]
    );

    // Return quantity, if code === 'CANCELED'
    if (code === 'CANCELED') {
      const disableOldSoldParts = await db.query(
        `
          SELECT
            *
          FROM
            "${process.env.DB_NAME}"."soldParts"
          WHERE
            "orderId" = $1 AND
            "isActive" = true;
        `,
        [orderId]
      );

      for (let i = 0; i < disableOldSoldParts.rows.length; i += 1) {
        const returnQuantity = await db.query(
          `
            UPDATE
              "${process.env.DB_NAME}"."dictParts"
            SET
              quantity = quantity + $1
            WHERE
              id = $2;
          `,
          [
            disableOldSoldParts.rows[i].quantity,
            disableOldSoldParts.rows[i].partId,
          ]
        );
      }
    }

    await sendMessageToBot(
      `
<b>Смена статуса завки №${orderId}</b>

Новый статус: "${getStatusInfo.rows[0].name}"
Комментарий: ${comment}
Дата: ${moment(new Date()).format('DD.MM.YYYY HH:mm:ss')}
    `,
      '-1001613758269'
    );

    response.json(changeStatus.rows);
  } catch (error: any) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   get order status history
// @route  POST /api/orders/:id/history
// @access Private
const getOrderStatusHistory = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { id } = request.params;

    const statusHistory = await db.query(
      `
        SELECT
          "statusHistory".id,
          "statusHistory"."orderId",
          "statusHistory".status,
          "statusHistory".comment,
          "statusHistory"."createdDate",
          "statusHistory"."createdBy",
          status.name as "statusName",
          users."fullName" as "createdFullName"
        FROM
          "${process.env.DB_NAME}"."ordersStatusHistory" as "statusHistory"
        LEFT JOIN
          "${process.env.DB_NAME}"."dictOrderStatuses" as "status"
        ON
          status.id = "statusHistory".status
        LEFT JOIN
          "${process.env.DB_NAME}"."users" as "users"
        ON
          users.id = "statusHistory"."createdBy"
        WHERE
          "statusHistory"."orderId" = $1
        ORDER BY
          "statusHistory".id DESC;
      `,
      [id]
    );

    const result = statusHistory.rows.reduce((acc, item) => {
      acc.push({
        id: item.id,
        orderId: item.orderId,
        createdBy: item.createdFullName,
        status: item.statusName,
        comment: item.comment,
        createdDate: item.createdDate,
      });

      return acc;
    }, []);

    response.json(result);
  } catch (error: any) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

export {
  createOrder,
  getOrders,
  updateOrder,
  getOrderById,
  getOrderActions,
  executeAction,
  getOrderStatusHistory,
};
