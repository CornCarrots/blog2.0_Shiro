package com.lh.service.impl;

import com.lh.bean.*;
import com.lh.mapper.RoleMapper;
import com.lh.service.RoleService;
import com.lh.service.UserRoleService;
import com.lh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleMapper roleMapper;
    @Autowired
    UserRoleService userRoleService;
    @Autowired
    UserService userService;

    @Override
    public void add(Role role) {
        roleMapper.insert(role);
    }

    @Override
    public void delete(int id) {
        roleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Role role) {
        roleMapper.updateByPrimaryKey(role);
    }

    @Override
    public Role get(int id) {
        return roleMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Role> list() {
        RoleExample roleExample = new RoleExample();
        roleExample.setOrderByClause("id desc");
        return roleMapper.selectByExample(roleExample);
    }

    @Override
    public Set<String> listRoleNamesByUser(String userName) {
        Set<Role> roles = listRolesByUserName(userName);
        Set<String> names = new HashSet<>();
        for (Role role:
             roles) {
            names.add(role.getRoleName());
        }
        return names;
    }

    @Override
    public Set<Role> listRolesByUserName(String userName) {
        User user = userService.getByName(userName);
        return new HashSet<>(listRolesByUser(user));
    }

    @Override
    public List<Role> listRolesByUser(User user) {
        List<Role> roles = new ArrayList<>();
        List<UserRole> userRoles = userRoleService.listByUser(user.getId());
        for (UserRole userRole : userRoles) {
            Role role = get(userRole.getRid());
            roles.add(role);
        }
        return roles;
    }
}
