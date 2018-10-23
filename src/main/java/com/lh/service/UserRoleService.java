package com.lh.service;

import com.lh.bean.Role;
import com.lh.bean.User;
import com.lh.bean.UserRole;

import java.util.List;
import java.util.Set;

public interface UserRoleService {
    void add(UserRole userRole);
    void delete(int id);
    void update(UserRole userRole);
    UserRole get(int id);
    List<UserRole> list();
    void init(User user);
    void fill(UserRole userRole);
    void fill(List<UserRole> userRoles);

    List<UserRole> listByUser(int uid);
    List<UserRole> listByRole(int rid);
    void setRoles(User user, Set<Integer> rids);
    void deleteByUser(int uid);
    void deleteByRole(int rid);
}
