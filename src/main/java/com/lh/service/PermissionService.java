package com.lh.service;

import com.lh.bean.Module;
import com.lh.bean.Operation;
import com.lh.bean.Permission;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public interface PermissionService {
    int add(Permission permission);
    void delete(int id);
    void update(Permission permission);
    Permission get(int id);
    Permission get(int mid,int oid);
    List<Permission> list();


    List<Map<String, Object>> listForTree(int id);
    HashMap<String,List<String>> formatPermission(List<Permission> permissions);

    void fill(Permission permission);
    void fill(List<Permission> permissions);
    List<Permission> listByModule(int mid);
    void setOperations(Module module, int[] oids);
    void deleteByModule(int mid);

    boolean hasPermission(String username,String url,String method);
    boolean needInterceptor(String url);


}
