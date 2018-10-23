package com.lh.service;

import com.lh.bean.Role;
import com.lh.bean.User;

import java.util.List;
import java.util.Set;

public interface RoleService {
    void add(Role role);
    void delete(int id);
    void update(Role role);
    Role get(int id);
    List<Role> list();

    Set<String> listRoleNamesByUser(String userName);
    Set<Role> listRolesByUserName(String userName);
    List<Role> listRolesByUser(User user);
}
