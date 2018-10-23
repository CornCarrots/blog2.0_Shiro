package com.lh.service.impl;

import com.lh.bean.Operation;
import com.lh.bean.OperationExample;
import com.lh.bean.Permission;
import com.lh.bean.RolePermission;
import com.lh.mapper.OperationMapper;
import com.lh.service.OperationService;
import com.lh.service.PermissionService;
import com.lh.service.RolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class OperationServiceImpl implements OperationService {
    @Autowired
    OperationMapper operationMapper;
    @Autowired
    PermissionService permissionService;
    @Autowired
    RolePermissionService rolePermissionService;
    @Override
    public void add(Operation operation) {
        operationMapper.insert(operation);
    }

    @Override
    public void delete(int id) {
        operationMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Operation operation) {
        operationMapper.updateByPrimaryKey(operation);
    }

    @Override
    public Operation get(int id) {
        return operationMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Operation> list() {
        OperationExample example = new OperationExample();
        example.setOrderByClause("id desc");
        return operationMapper.selectByExample(example);
    }

    @Override
    public List<Operation> listByModule(int mid) {
        List<Operation> operations = new ArrayList<>();
        for (Permission permission:
        permissionService.listByModule(mid)) {
            operations.add(get(permission.getOid()));
        }
        return operations;
    }

    @Override
    public List<Operation> listByModuleAndRole(int mid, int rid) {
        List<Operation> operations = new ArrayList<>();
        List<RolePermission> rolePermissions = rolePermissionService.listByRole(rid);
        rolePermissionService.fillRolePermission(rolePermissions);
        for (RolePermission rolePermission:
             rolePermissions) {
//            System.out.println("1:"+rolePermission);
            Permission permission = rolePermission.getPermission();
//            System.out.println("2:"+permission);
            if(permission.getMid()==mid)
            {
                permissionService.fill(permission);
                operations.add(permission.getOperation());
            }
        }
        return operations;
    }
}
