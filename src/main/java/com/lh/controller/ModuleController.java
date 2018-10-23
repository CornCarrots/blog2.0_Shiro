package com.lh.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lh.bean.Module;
import com.lh.service.ModuleService;
import com.lh.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/system/modules")
public class ModuleController {
    @Autowired
    ModuleService moduleService;


    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView listModule() {
        ModelAndView modelAndView = new ModelAndView("back/addModule");
        List<Module> modules = moduleService.list();
        moduleService.fill(modules);
        modelAndView.addObject("modules", modules);
        return modelAndView;
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public ModelAndView addModule(Module module){
        ModelAndView modelAndView = new ModelAndView("redirect:/admin/system/modules");
        moduleService.add(module);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String getModules(@PathVariable("id")int id, HttpSession session)
    {
        List<Module> modules = moduleService.listExclude(id);
        JSONObject object = new JSONObject();
        object.put("modules",modules);
        return object.toJSONString();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public ModelAndView updateModule(Module module) {
        ModelAndView modelAndView = new ModelAndView("redirect:/admin/system/modules");
        moduleService.update(module);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String deleteModule(@PathVariable("id") int mid) {
        JSONObject object = new JSONObject();
        try {
            Module module = moduleService.get(mid);
            if(moduleService.hasChild(module))
            {
                object.put("result","child");

            }
            else
            {
                moduleService.delete(mid);
                object.put("result","success");
            }
        }
        catch (Exception e)
        {
            object.put("result","fail");
        }
        return object.toJSONString();
    }
}
