package com.lh.controller;

import com.alibaba.fastjson.JSONObject;
import com.lh.bean.Role;
import com.lh.bean.User;
import com.lh.bean.UserRole;
import com.lh.service.RoleService;
import com.lh.service.UserRoleService;
import com.lh.service.UserService;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
@RequestMapping("/admin/users")
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    UserRoleService userRoleService;
    @Autowired
    RoleService roleService;

    @RequestMapping(value = "",method = RequestMethod.GET)
    public ModelAndView listUser()
    {
        ModelAndView modelAndView = new ModelAndView("back/listUser");
        List<User> users = userService.list();
        userService.fillUser(users);
        List<Role> roles = roleService.list();
        modelAndView.addObject("users",users);
        modelAndView.addObject("roles",roles);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "role/{id}",method = RequestMethod.PUT)
    public String editUserRole(@PathVariable("id")int id, @RequestBody Set<Integer> list)
    {
        User user = userService.get(id);
//        System.out.println(list);
        userRoleService.setRoles(user,list);
        JSONObject object = new JSONObject();
        userService.fillUser(user);
        object.put("roles",user.getRoles());
        return object.toJSONString();
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    public ModelAndView deleteUser(@PathVariable("id")int id)
    {
        User user = userService.get(id);
        user.setUserStatus(2);
        userService.update(user);
        userRoleService.deleteByUser(user.getId());
        ModelAndView modelAndView = new ModelAndView("redirect:/admin/users");
        return modelAndView;
    }
}
