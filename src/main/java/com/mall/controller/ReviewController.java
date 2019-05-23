package com.mall.controller;


import com.mall.pojo.Review;
import com.mall.service.CategoryService;
import com.mall.service.ReviewService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
 
@Controller
@RequestMapping("")
public class ReviewController {
    @Autowired
    ReviewService reviewService;
    
    @RequestMapping("admin_review_list")
    public String admin_category_list(){
        return "admin/listReview";
    }
  
    //获取分类列表
    @RequestMapping("getReviewList")
    @ResponseBody
    public Map<String, Object> list(Integer page, Integer limit,String searContent){
    	Map<String, Object> map = new HashMap<>();
        map.put("page", (page - 1) * limit);
        map.put("limit", limit);
        map.put("searContent", searContent);
        
        List<Review> data = reviewService.getReviewList(map);
        int count = reviewService.getReviewListCount(map);
        Map<String, Object> result = new HashMap<>();
        result.put("code", 0);
        result.put("msg", "");
        result.put("data", data);
        result.put("count", count);
        return result;
    }
    

    
    //编辑评论
    @RequestMapping("admin_review_edit")
    public String edit(int id,Model model) throws IOException {
    	Review c= reviewService.get(id);
        model.addAttribute("c", c);
        return "admin/editReview";
    }
    
    @RequestMapping("admin_review_update")
    public String update(Review c) throws IOException {
    	reviewService.update(c);
        return "redirect:/admin_review_list";
    }
    
    //删除评论
    @RequestMapping("admin_review_delete")
    public String delete(int id) throws IOException {
    	reviewService.delete(id);
        return "redirect:/admin_review_list";
    }
}