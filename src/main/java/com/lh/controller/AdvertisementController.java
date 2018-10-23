package com.lh.controller;

import com.lh.bean.Advertisement;
import com.lh.service.AdvertiseService;
import com.lh.util.ImageUtil;
import com.lh.util.UploadFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/admin/show/advertisements")
public class AdvertisementController {
    @Autowired
    AdvertiseService advertiseService;

    @RequestMapping(value = "",method = RequestMethod.GET)
    public ModelAndView listAdv()
    {
        ModelAndView modelAndView = new ModelAndView("back/addAdvertisement");
        List<Advertisement> advertisements = advertiseService.list();
        modelAndView.addObject("advertisements",advertisements);
        return modelAndView;
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.POST)
    public ModelAndView updateAdv(UploadFile file, @PathVariable("id")int id, HttpSession session) throws IOException {
        ModelAndView modelAndView = new ModelAndView("redirect:/admin/show/advertisements");
        Advertisement advertisement = advertiseService.get(id);
        String oldPath = session.getServletContext().getRealPath(advertisement.getAdvertisementPath());
//        System.out.println(oldPath);
        File file1 = new File(oldPath);
        file1.delete();
        file.getImage().transferTo(file1);
        BufferedImage img = ImageUtil.change2jpg(file1);
        ImageIO.write(img, "jpg", file1);
        return modelAndView;
    }
}
