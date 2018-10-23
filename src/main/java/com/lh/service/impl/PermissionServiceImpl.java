package com.lh.service.impl;

import com.lh.bean.*;
import com.lh.mapper.PermissionMapper;
import com.lh.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.logging.Logger;

@Service
public class PermissionServiceImpl implements PermissionService {
    Logger logger = Logger.getLogger(PermissionServiceImpl.class.getName());
    @Autowired
    PermissionMapper permissionMapper;
    @Autowired
    ModuleService moduleService;
    @Autowired
    OperationService operationService;
    @Autowired
    RolePermissionService rolePermissionService;


    @Override
    public int add(Permission permission) {
        return permissionMapper.insert(permission);
    }

    @Override
    public void delete(int id) {
        permissionMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Permission permission) {
        permissionMapper.updateByPrimaryKey(permission);
    }

    @Override
    public Permission get(int id) {
        return permissionMapper.selectByPrimaryKey(id);
    }

    @Override
    public Permission get(int mid, int oid) {
        PermissionExample example = new PermissionExample();
        example.createCriteria().andMidEqualTo(mid).andOidEqualTo(oid);
        List<Permission> permissions = permissionMapper.selectByExample(example);
        if (permissions.size()==0)
            return null;
        return permissions.get(0);
    }

    @Override
    public List<Permission> list() {
        PermissionExample example = new PermissionExample();
        example.setOrderByClause("id desc");
        return permissionMapper.selectByExample(example);
    }


    @Override
    public List<Map<String, Object>> listForTree(int id) {
        List<Map<String, Object>> list = new ArrayList<>();
        List<Module> modules = moduleService.list();
        List<Module> modules1 = moduleService.listByRole(id);
        int i = 0;
        for (Module module :
                modules) {
            boolean found = false;
            Map<String, Object> map = new HashMap<>();
            map.put("parent_id", module.getModulePid());
            map.put("layer_name", module.getModuleDesc());
            map.put("EquIndex",i );
            map.put("id", module.getId());
            for (Module module1:
                 modules1) {
                if(module1.getId()==module.getId())
                {
                    found = true;
                    break;
                }
            }
            Map<String, Object> state = new HashMap<>();
            if (found)
                state.put("checked",true);
            else
                state.put("checked",false);
            map.put("state",state);
            list.add(map);
            i++;
        }
        return list;
    }

    @Override
    public HashMap<String, List<String>> formatPermission(List<Permission> permissions) {
        HashMap<String, List<String>> map = new HashMap<>();
        for (Permission permission :
                permissions) {
            String s = "";
            Module module = permission.getModule();
            Operation operation = permission.getOperation();
            if (moduleService.hasChild(module))
                if(module.getModulePid()==0)
                    s=module.getModuleUrl()+"/";
                else
                    s = module.getModuleUrl();
            else
                s = moduleService.getChildURL(module.getModuleUrl());
            if (map.containsKey(s)) {
                List<String> list = map.get(s);
                list.add(operation.getOperationName());
                map.put(s,list);
            }
            else
            {
                List<String> list = new ArrayList<>();
                list.add(operation.getOperationName());
                map.put(s,list);
            }
        }
        return map;
    }

    @Override
    public void fill(Permission permission) {
        int mid = permission.getMid();
        permission.setModule(moduleService.get(mid));
        int oid = permission.getOid();
        permission.setOperation(operationService.get(oid));
    }

    @Override
    public void fill(List<Permission> permissions) {
        for (Permission permission :
                permissions) {
            fill(permission);
        }
    }

    @Override
    public List<Permission> listByModule(int mid) {
        PermissionExample example = new PermissionExample();
        example.setOrderByClause("id desc");
        example.createCriteria().andMidEqualTo(mid);
        return permissionMapper.selectByExample(example);
    }

    @Override
    public void setOperations(Module module, int[] oids) {
        deleteByModule(module.getId());
        for (int i = 0; i < oids.length; i++) {
            Permission permission = new Permission();
            permission.setMid(module.getId());
            permission.setOid(oids[i]);
            add(permission);
        }
    }

    @Override
    public void deleteByModule(int mid) {
        for (Permission permission :
                listByModule(mid)) {
            delete(permission.getId());
        }
    }

    @Override
    public boolean hasPermission(String username, String url, String method) {
        List<Permission> permissions = rolePermissionService.listPermissionByUser(username);
//        System.out.println("---------------------------");
        fill(permissions);
        HashMap<String, List<String>> map = formatPermission(permissions);
//        System.out.println(map);
        for (String key :
                map.keySet()) {
            if (key.equals(url)) {
                for (String val:
                map.get(key)) {
                    if (val.equals(method))
                        return true;
                }

            }
        }
        return false;
    }

    @Override
    public boolean needInterceptor(String url) {
        List<String> urls = moduleService.listURL();
        for (String url1 :
                urls) {
            if (url.equals(url1)||url.equals("/admin/"))
                return true;
        }
        return false;
    }

}
