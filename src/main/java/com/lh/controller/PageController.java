package com.lh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {

    @RequestMapping(value = "/loginPage",method = RequestMethod.GET)
    public ModelAndView loginPage()
    {
        ModelAndView modelAndView = new ModelAndView("fore/login");
        return modelAndView;
    }

    @RequestMapping(value = "/register/page",method = RequestMethod.GET)
    public ModelAndView registerPage()
    {
        ModelAndView modelAndView = new ModelAndView("fore/register");
        return modelAndView;
    }

    @RequestMapping(value = "/registerSuccess",method = RequestMethod.GET)
    public ModelAndView registerSuccessPage()
    {
        ModelAndView modelAndView = new ModelAndView("fore/registerSuccess");
        return modelAndView;
    }

    @RequestMapping(value = "/unauthorized",method = RequestMethod.GET)
    public ModelAndView unauthorized()
    {
        ModelAndView modelAndView = new ModelAndView("error/unauthorized");
        return modelAndView;
    }
}
