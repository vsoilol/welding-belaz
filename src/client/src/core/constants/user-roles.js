export const userRoles = {
  master: 'Master',
  admin: 'Admin',
  inspector: 'Inspector',
  technologist: 'Technologist',
  chief: 'Chief',
  plantManager: 'PlantManager',
};

export const isMaster = role =>
  role === userRoles.master || role === userRoles.admin;

export const isInspector = role =>
  role === userRoles.inspector || role === userRoles.admin;

export const isMasterOrInspector = role =>
  role === userRoles.master ||
  role === userRoles.admin ||
  role === userRoles.inspector;
