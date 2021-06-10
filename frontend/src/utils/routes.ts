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
];

export const subRoutes = [
  {
    path: '/administration/roles',
    code: 'dictRoles',
    name: 'Роли',
  },
  {
    path: '/administration/work-types',
    code: 'dictWorkTypes',
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
];
