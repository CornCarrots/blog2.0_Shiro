package com.lh.service.impl;

import com.lh.bean.*;
import com.lh.mapper.RolePermissionMapper;
import com.lh.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class RolePermissionServiceImpl implements RolePermissionService {
    @Autowired
    RolePermissionMapper rolePermissionMapper;
    @Autowired
    RoleService roleService;
    @Autowired
    PermissionService permissionService;
    @Autowired
    UserRoleService userRoleService;
    @Autowired
    UserService userService;

    @Override
    public void add(RolePermission rolePermission) {
        rolePermissionMapper.insert(rolePermission);
    }

    @Override
    public void delete(int id) {
        rolePermissionMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(RolePermission rolePermission) {
        rolePermissionMapper.updateByPrimaryKey(rolePermission);
    }

    @Override
    public RolePermission get(int id) {
        return rolePermissionMapper.selectByPrimaryKey(id);
    }

    @Override
    public RolePermission get(int pid, int rid) {
        RolePermissionExample example = new RolePermissionExample();
        example.createCriteria().andRidEqualTo(rid).andPidEqualTo(pid);
        List<RolePermission> rolePermissionList =  rolePermissionMapper.selectByExample(example);
        if(rolePermissionList.size()==0)
            return null;
        return rolePermissionList.get(0);
    }

    @Override
    public List<RolePermission> list() {
        RolePermissionExample example = new RolePermissionExample();
        example.setOrderByClause("id desc");
        return rolePermissionMapper.selectByExample(example);
    }

    @Override
    public Set<String> listByUser(String username) {
        Set<String> rolePermissions = new HashSet<>();
        Set<Role> roles = roleService.listRolesByUserName(username);
        for (Role role:
             roles) {
            List<RolePermission> rolePermissionList = listByRole(role.getId());
            fillRolePermission(rolePermissionList);
            for (RolePermission rolePermission:
                 rolePermissionList) {
                String name = rolePermission.getPermission().getModule().getModuleUrl();
                rolePermissions.add(name);
            }
        }
        return null;
    }

    @Override
    public void fillRolePermission(RolePermission rolePermission) {
        int rid = rolePermission.getRid();
        rolePermission.setRole(roleService.get(rid));
        int pid = rolePermission.getPid();
        rolePermission.setPermission(permissionService.get(pid));

    }

    @Override
    public void fillRolePermission(List<RolePermission> rolePermissions) {
        for (RolePermission rolePermission:
             rolePermissions) {
            fillRolePermission(rolePermission);
        }
    }

    @Override
    public List<RolePermission> listByRole(int rid) {
        RolePermissionExample example = new RolePermissionExample();
        example.setOrderByClause("id desc");
        example.createCriteria().andRidEqualTo(rid);
        return rolePermissionMapper.selectByExample(example);
    }

    @Override
    public void setPermissions(Role role, int[] pids) {
        deleteByRole(role.getId());
        for (int i = 0; i < pids.length; i++) {
            RolePermission rolePermission = new RolePermission();
            rolePermission.setPid(pids[i]);
            rolePermission.setRid(role.getId());
            add(rolePermission);
        }
    }

    @Override
    public void deleteByRole(int rid) {
        for (RolePermission rolePermission:
             listByRole(rid)) {
            delete(rolePermission.getId());
        }
    }

    @Override
    public List<Permission> listPermissionByUser(String username) {
        List<Permission> permissions = new ArrayList<>();
        User user = userService.getByName(username);
        List<UserRole> userRoles = userRoleService.listByUser(user.getId());
        for (UserRole userRole:
                userRoles) {
            int rid = userRole.getRid();
            List<RolePermission> rolePermissionList = listByRole(rid);
            for (RolePermission rolePermission:
                 rolePermissionList) {
                fillRolePermission(rolePermission);
                permissions.add(rolePermission.getPermission());
            }
        }
        return permissions;
    }

}
