export const userRoles = {
  master: 'Master', // Мастер
  admin: 'Admin', // Админ
  inspector: 'Inspector', // Контролёр
  technologist: 'Technologist',
  chief: 'Chief', // Начальник цеха
  plantManager: 'PlantManager', // Руководитель завода
  ukkRepresentative: 'UkkRepresentative', // Представитель УКК
};

export const isMaster = role =>
  role === userRoles.master || role === userRoles.admin;

export const isInspector = role =>
  role === userRoles.inspector || role === userRoles.admin;

export const isMasterOrInspector = role =>
  role === userRoles.master ||
  role === userRoles.admin ||
  role === userRoles.inspector;
