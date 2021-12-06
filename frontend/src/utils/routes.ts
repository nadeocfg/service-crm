export const routes = [
  {
    path: '/',
    code: 'home',
    name: 'Главная',
  },
  {
    path: '/users',
    code: 'users',
    name: 'Пользователи',
  },
  {
    path: '/customers',
    code: 'customers',
    name: 'Клиенты',
  },
  {
    path: '/orders',
    code: 'orders',
    name: 'Заказы',
  },
  {
    path: '/paids',
    code: 'paids',
    name: 'Выплаты',
  },
];

export const adminRoutes = [
  {
    path: '/administration/roles',
    code: 'dictRoles',
    name: 'Роли',
  },
  {
    path: '/administration/job-types',
    code: 'dictJobTypes',
    name: 'Виды работ',
  },
  {
    path: '/administration/boilers',
    code: 'dictBoilers',
    name: 'Котлы',
  },
  {
    path: '/administration/parts',
    code: 'dictParts',
    name: 'Запчасти',
  },
  {
    path: '/administration/order-statuses',
    code: 'dictOrderStatuses',
    name: 'Статусы заказов',
  },
];
