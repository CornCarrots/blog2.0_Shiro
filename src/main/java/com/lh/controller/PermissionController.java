package com.lh.controller;

import com.alibaba.fastjson.JSONObject;
import com.lh.bean.Operation;
import com.lh.bean.Permission;
import com.lh.bean.Role;
import com.lh.bean.RolePermission;
import com.lh.service.OperationService;
import com.lh.service.PermissionService;
import com.lh.service.RolePermissionService;
import com.lh.service.RoleService;
import com.lh.util.TreeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/system/roles/permission")
public class PermissionController {
    @Autowired
    RoleService roleService;
    @Autowired
    PermissionService permissionService;
    @Autowired
    RolePermissionService rolePermissionService;
    @Autowired
    OperationService operationService;

    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public ModelAndView listPermission(@PathVariable("id") int id)
    {
        ModelAndView modelAndView = new ModelAndView("back/listPermission");
//        List<RolePermission> rolePermissions = rolePermissionService.listByRole(id);
//        rolePermissionService.fillRolePermission(rolePermissions);
        Role role = roleService.get(id);
        List<Operation> operations = operationService.list();

//        modelAndView.addObject("rolePermissions",rolePermissions);
        modelAndView.addObject("role",role);
        modelAndView.addObject("operations",operations);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/{id}",method = RequestMethod.POST)
    public String listPermissionTree(@PathVariable("id") int id)
    {
        JSONObject object = new JSONObject();
        try {

            List<Map<String, Object>> mList = permissionService.listForTree(id);
//            System.out.println(mList);
            List<Map<String, Object>> resultList = TreeUtil.treeViewDataTransform(mList);
//            System.out.println(resultList);
            object.put("result","success");
            object.put("data",resultList);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return object.toJSONString();
    }

    @ResponseBody
    @RequestMapping(value = "{rid}/operation/{mid}",method = RequestMethod.POST)
    public String listOperationTree(@PathVariable("mid")int id,@PathVariable("rid")int rid)
    {
        List<Operation> operations1 = operationService.listByModuleAndRole(id,rid);
        JSONObject object = new JSONObject();
        object.put("list",operations1);
        return object.toJSONString();
    }

    @ResponseBody
    @RequestMapping(value = "{rid}/operation",method = RequestMethod.POST)
    public String addPermission(@PathVariable("rid")int rid, @RequestBody JSONObject object)
    {
        try {
            int mid = Integer.parseInt(object.get("mid").toString());
            int oid = Integer.parseInt(object.get("oid").toString());
            Permission permission = permissionService.get(mid,oid);
            int pid = 0;
            if(null==permission)
            {
                Permission permission1 = new Permission();
                permission1.setMid(mid);
                permission1.setOid(oid);
                permissionService.add(permission1);
                pid = permissionService.get(mid,oid).getId();
            }
            else
                pid = permission.getId();
            RolePermission rolePermission = new RolePermission();
            rolePermission.setRid(rid);
            rolePermission.setPid(pid);
            rolePermissionService.add(rolePermission);
            object.put("result","success");
        }
        catch (Exception e)
        {
            object.put("result","fail");
        }

        return object.toJSONString();
    }

    @ResponseBody
    @RequestMapping(value = "{rid}/operation",method = RequestMethod.DELETE)
    public String deletePermission(@PathVariable("rid")int rid, @RequestBody JSONObject object)
    {
        try {
            int mid = Integer.parseInt(object.get("mid").toString());
            int oid = Integer.parseInt(object.get("oid").toString());
            Permission permission = permissionService.get(mid,oid);
            RolePermission rolePermission = rolePermissionService.get(permission.getId(),rid);
            rolePermissionService.delete(rolePermission.getId());
            object.put("result","success");
        }
        catch (Exception e)
        {
            object.put("result","fail");
        }

        return object.toJSONString();
    }
}
