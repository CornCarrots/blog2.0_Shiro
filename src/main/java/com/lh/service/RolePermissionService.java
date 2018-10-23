package com.lh.service;

import com.lh.bean.Permission;
import com.lh.bean.Role;
import com.lh.bean.RolePermission;

import java.util.List;
import java.util.Set;

public interface RolePermissionService {
    void add(RolePermission rolePermission);
    void delete(int id);
    void update(RolePermission rolePermission);
    RolePermission get(int id);
    RolePermission get(int pid,int rid);
    List<RolePermission> list();

    Set<String> listByUser(String username);
    void fillRolePermission(RolePermission rolePermission);
    void fillRolePermission(List<RolePermission> rolePermissions);
    List<RolePermission> listByRole(int rid);
    void setPermissions(Role role, int[] pids);
    void deleteByRole(int rid);

    List<Permission> listPermissionByUser(String username);
}
