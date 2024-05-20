export interface UserModel {
  id?: number;
  login?: string;
  fullName?: string;
  birthDay?: string;
  phone?: string;
  roleId?: number;
  roleName?: string;
  roleCode?: string;
  updatedDate?: string;
  createdDate?: string;
  percentFromJob?: number;
  percentFromParts?: number;
  percentFromVisit?: number;
}

export const enum UserRolesEnum {
  SUPER_ADMIN = 'SUPER_ADMIN',
  ADMIN = 'ADMIN',
  SERVICE_MAN = 'SERVICE_MAN',
}
