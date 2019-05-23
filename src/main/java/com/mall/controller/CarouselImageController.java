package com.mall.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mall.pojo.Carouselimage;
import com.mall.pojo.Category;
import com.mall.service.CarouselImageService;
import com.mall.util.ImageUtil;
import com.mall.util.UploadedImageFile;


@Controller
@RequestMapping("")
public class CarouselImageController {

    @Autowired
    CarouselImageService carouselImageService;


    @RequestMapping("admin_CarouselImage_add")
    public String add(Carouselimage  ci, HttpSession session, UploadedImageFile uploadedImageFile) {
    	ci.setCreateDate(new Date());
        carouselImageService.add(ci);
        String fileName = ci.getId()+ ".png";
        String imageFolder,imageFolder_small;
        
        imageFolder= session.getServletContext().getRealPath("img/lunbo");
        imageFolder_small= session.getServletContext().getRealPath("img/lunbo_small");

        File f = new File(imageFolder, fileName);
        f.getParentFile().mkdirs();
        try {
            uploadedImageFile.getImage().transferTo(f);
            BufferedImage img = ImageUtil.change2jpg(f);
            ImageIO.write(img, "png", f);
            
            File f_small = new File(imageFolder_small, fileName);
            ImageUtil.resizeImage(f, 56, 56, f_small);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:admin_CarouselImage_list";
    }

    @RequestMapping("admin_CarouselImage_delete")
    public String delete(int id,HttpSession session) {
        Carouselimage ci = carouselImageService.get(id);

        String fileName = ci.getId()+ ".png";
        String imageFolder,imageFolder_small;


        imageFolder= session.getServletContext().getRealPath("img/lunbo");
        imageFolder_small= session.getServletContext().getRealPath("img/lunbo_small");

        File imageFile = new File(imageFolder,fileName);
        File imageFile_small = new File(imageFolder_small,fileName);

        imageFile.delete();
        imageFile_small.delete();
        
        carouselImageService.delete(id);

        return "redirect:admin_CarouselImage_list";
    }

    @RequestMapping("admin_CarouselImage_list")
    public String list(Model model) {
    	List<Carouselimage> ci= carouselImageService.list();
    	model.addAttribute("ci", ci);

        return "admin/listCarouselImage";
    }
}
