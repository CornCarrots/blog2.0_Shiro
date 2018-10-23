package com.lh.service.impl;

import com.lh.bean.Role;
import com.lh.bean.User;
import com.lh.bean.UserRole;
import com.lh.bean.UserRoleExample;
import com.lh.mapper.UserRoleMapper;
import com.lh.service.RoleService;
import com.lh.service.UserRoleService;
import com.lh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
public class UserRoleServiceImpl implements UserRoleService {
    @Autowired
    UserRoleMapper userRoleMapper;
    @Autowired
    UserService userService;
    @Autowired
    RoleService roleService;

    @Override
    public void add(UserRole userRole) {
        userRoleMapper.insert(userRole);
    }

    @Override
    public void delete(int id) {
        userRoleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(UserRole userRole) {
        userRoleMapper.updateByPrimaryKey(userRole);
    }

    @Override
    public UserRole get(int id) {
        return userRoleMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<UserRole> list() {
        UserRoleExample example = new UserRoleExample();
        example.setOrderByClause("id desc");
        return userRoleMapper.selectByExample(example);
    }

    @Override
    public void init(User user) {
        UserRole userRole = new UserRole();
        userRole.setUid(user.getId());
        userRole.setRid(14);
        add(userRole);
    }

    @Override
    public void fill(UserRole userRole) {
        userRole.setRole(roleService.get(userRole.getRid()));
        userRole.setUser(userService.get(userRole.getUid()));
    }

    @Override
    public void fill(List<UserRole> userRoles) {
        for (UserRole userRole:
             userRoles) {
            fill(userRole);
        }
    }

    @Override
    public List<UserRole> listByUser(int uid) {
        UserRoleExample example = new UserRoleExample();
        example.setOrderByClause("id desc");
        example.createCriteria().andUidEqualTo(uid);
        return userRoleMapper.selectByExample(example);
    }

    @Override
    public List<UserRole> listByRole(int rid) {
        UserRoleExample example = new UserRoleExample();
        example.setOrderByClause("id desc");
        example.createCriteria().andRidEqualTo(rid);
        return userRoleMapper.selectByExample(example);
    }

    @Override
    public void setRoles(User user, Set<Integer> rids) {
        deleteByUser(user.getId());
        for (int rid:
             rids) {
            UserRole userRole = new UserRole();
            userRole.setUid(user.getId());
            userRole.setRid(rid);
            add(userRole);
        }
    }

    @Override
    public void deleteByUser(int uid) {
        List<UserRole> urs= listByUser(uid);
        for (UserRole userRole : urs) {
            delete(userRole.getId());
        }
    }

    @Override
    public void deleteByRole(int rid) {
        List<UserRole> urs= listByRole(rid);
        for (UserRole userRole : urs) {
            delete(userRole.getId());
        }
    }
}
