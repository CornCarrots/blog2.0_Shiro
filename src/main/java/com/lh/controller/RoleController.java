package com.lh.controller;

import com.alibaba.fastjson.JSONObject;
import com.lh.bean.*;
import com.lh.service.*;
import com.lh.util.TreeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/system/roles")
public class RoleController {
    @Autowired
    RoleService roleService;
    @Autowired
    ModuleService moduleService;
    @Autowired
    OperationService operationService;
    @Autowired
    PermissionService permissionService;
    @Autowired
    RolePermissionService rolePermissionService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView listRole() {
        ModelAndView modelAndView = new ModelAndView("back/listRole");
        List<Role> roles = roleService.list();
        modelAndView.addObject("roles", roles);
        return modelAndView;
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public ModelAndView addRole(Role role) {
        ModelAndView modelAndView = new ModelAndView("redirect:/admin/system/roles");
        roleService.add(role);
        return modelAndView;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ModelAndView deleteRole(@PathVariable("id") int rid) {
        ModelAndView modelAndView = new ModelAndView("redirect:/admin/system/roles");
        List<RolePermission> rolePermissionList = rolePermissionService.listByRole(rid);
        if (rolePermissionList.size() > 0)
            rolePermissionService.deleteByRole(rid);
        roleService.delete(rid);
        return modelAndView;
    }

    @RequestMapping(value = "/{rid}", method = RequestMethod.PUT)
    public ModelAndView updateRole(Role role) {
        ModelAndView modelAndView = new ModelAndView("redirect:/admin/system/roles");
        roleService.update(role);
        return modelAndView;
    }

}
