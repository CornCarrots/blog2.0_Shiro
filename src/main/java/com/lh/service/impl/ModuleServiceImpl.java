package com.lh.service.impl;

import com.lh.bean.*;
import com.lh.mapper.ModuleMapper;
import com.lh.service.ModuleService;
import com.lh.service.OperationService;
import com.lh.service.PermissionService;
import com.lh.service.RolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@Service
public class ModuleServiceImpl implements ModuleService {

    @Autowired
    ModuleMapper moduleMapper;
    @Autowired
    PermissionService permissionService;
    @Autowired
    OperationService operationService;
    @Autowired
    RolePermissionService rolePermissionService;

    @Override
    public void add(Module module) {
        moduleMapper.insert(module);
    }

    @Override
    public void delete(int id) {
        moduleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Module module) {
        moduleMapper.updateByPrimaryKey(module);
    }

    @Override
    public Module get(int id) {
        return moduleMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Module> list() {
        ModuleExample example = new ModuleExample();
        return moduleMapper.selectByExample(example);
    }

    @Override
    public List<Module> listByRole(int rid) {
        List<Module> modules = new ArrayList<>();
        List<RolePermission> rolePermissionList = rolePermissionService.listByRole(rid);
        rolePermissionService.fillRolePermission(rolePermissionList);
        for (RolePermission rolePermission:
                rolePermissionList) {
            Permission permission = rolePermission.getPermission();
            permissionService.fill(permission);
            modules.add(permission.getModule());
        }
        return modules;
    }

    @Override
    public List<String> listURL() {
        List<String> urls = new ArrayList<>();
//        int i = 1;
        for (Module module :
                listRoot()) {
            String url = "";
            url += module.getModuleUrl();
//            System.out.println(i+" "+url);
            if (hasChild(module)) {
                urls.addAll(listURLByParent(url,module.getId()));
            }
            else
            {
                urls.add(url);
            }
        }
        return urls;
    }

    @Override
    public List<String> listURLByParent(String s, int pid) {
        List<String> urls = new ArrayList<>();
//        int i = 2;
        for (Module module :
                listByParent(pid)) {
            s += module.getModuleUrl();
//            System.out.println(i+" "+s);
//            i++;
            if (hasChild(module))
                urls.addAll(listURLByParent(s, module.getId()));
            else
                urls.add(s);
            s=s.substring(0,s.lastIndexOf("/"));
        }
        return urls;
    }

    @Override
    public String getChildURL(String url) {
        for (String url1:
             listURL()) {
            if(url1.contains(url))
            {
                return url1;
            }
        }
        return null;
    }


    @Override
    public List<Module> listByParent(int pid) {
        ModuleExample example = new ModuleExample();
        example.createCriteria().andModulePidEqualTo(pid);
        return moduleMapper.selectByExample(example);
    }

    @Override
    public List<Module> listExclude(int id) {
        Module module = get(id);
        fill(module);
        List<Module> child = module.getChilds();
        List<Module> modules = list();
//        System.out.println("原来的："+modules);
//        System.out.println("儿子的："+child);
        modules.removeAll(child);
        modules.remove(module);
//        System.out.println("后来的："+modules);

        return modules;
    }

    @Override
    public boolean hasChild(Module module) {
        int mid = module.getId();
        return listByParent(mid).size() != 0;
    }

    @Override
    public void fill(Module module) {
        List<Operation> operations = new ArrayList<>();
        for (Permission permission :
                permissionService.listByModule(module.getId())) {
            int id = permission.getOid();
            operations.add(operationService.get(id));
        }
        module.setOperations(operations);
        module.setChilds(listByParent(module.getId()));
    }

    @Override
    public void fill(List<Module> modules) {
        for (Module module :
                modules) {
            fill(module);
        }
    }
//
//    @Override
//    public List<String> listRootURL() {
//        List<String> urls = new ArrayList<>();
//        for (Module module :
//                listRoot()) {
//            urls.add(module.getModuleUrl());
//        }
//        return urls;
//    }

    @Override
    public List<Module> listRoot() {
        ModuleExample example = new ModuleExample();
        example.setOrderByClause("id desc");
        example.createCriteria().andModulePidEqualTo(0);
        return moduleMapper.selectByExample(example);
    }
//
//    @Override
//    public List<String> listSecondURL() {
//        List<String> urls = new ArrayList<>();
//        for (Module module :
//                listSecond()) {
//            urls.add(module.getModuleUrl());
//        }
//        return urls;
//    }
//
//    @Override
//    public List<Module> listSecond() {
//        List<Module> modules = new ArrayList<>();
//        ModuleExample example;
//        for (Module module :
//                listRoot()) {
//            example = new ModuleExample();
//            example.setOrderByClause("id desc");
//            ModuleExample.Criteria criteria = example.createCriteria();
//            criteria.andModulePidEqualTo(module.getId());
//            modules.addAll(moduleMapper.selectByExample(example));
//
//        }
//        return modules;
//    }
}
