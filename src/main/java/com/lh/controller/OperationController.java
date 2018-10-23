package com.lh.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lh.bean.Operation;
import com.lh.service.OperationService;
import com.lh.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/admin/system/operations")
public class OperationController {
    @Autowired
    OperationService operationService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView listOperation(Page page) {
        ModelAndView modelAndView = new ModelAndView("back/addOperation");
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Operation> operations = operationService.list();
        int total = (int)new PageInfo<>(operations).getTotal();
        page.setTotal(total);
        modelAndView.addObject("operations", operations);
        return modelAndView;
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public ModelAndView addOperation(Operation operation){
        ModelAndView modelAndView = new ModelAndView("redirect:/admin/system/operations");
        operationService.add(operation);
        return modelAndView;
    }


    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public ModelAndView updateOperation(Operation operation) {
        ModelAndView modelAndView = new ModelAndView("redirect:/admin/system/operations");
        operationService.update(operation);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String deleteModule(@PathVariable("id") int oid) {
        JSONObject object = new JSONObject();
        try {
                operationService.delete(oid);
                object.put("result","success");
        }
        catch (Exception e)
        {
            object.put("result","fail");
        }
        return object.toJSONString();
    }
}
