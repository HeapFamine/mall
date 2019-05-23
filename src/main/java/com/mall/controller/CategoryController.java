package com.mall.controller;


import com.mall.pojo.Category;
import com.mall.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
 
@Controller
@RequestMapping("")
public class CategoryController {
    @Autowired
    CategoryService categoryService;
    
    @RequestMapping("admin_category_list")
    public String admin_category_list(){
        return "admin/listCategory";
    }
  
    //获取分类列表
    @RequestMapping("getCategoryList")
    @ResponseBody
    public Map<String, Object> list(Integer page, Integer limit,String searContent){
    	Map<String, Object> map = new HashMap<>();
        map.put("page", (page - 1) * limit);
        map.put("limit", limit);
        map.put("searContent", searContent);
        
        List<Category> data = categoryService.getCategoryList(map);
        int count = categoryService.getCategoryListCount(map);
        Map<String, Object> result = new HashMap<>();
        result.put("code", 0);
        result.put("msg", "");
        result.put("data", data);
        result.put("count", count);
        return result;
    }
    
    //增加分类
    @RequestMapping("admin_category_add")
    public String add(Category c, HttpSession session) throws IOException {
    	c.setCreateDate(new Date());
        categoryService.add(c);
        
        return "redirect:/admin_category_list";
    }
    
    //编辑分类
    @RequestMapping("admin_category_edit")
    public String edit(int id,Model model) throws IOException {
        Category c= categoryService.get(id);
        model.addAttribute("c", c);
        return "admin/editCategory";
    }
    
    @RequestMapping("admin_category_update")
    public String update(Category c) throws IOException {
    	c.setCreateDate(new Date());
        categoryService.update(c);
        return "redirect:/admin_category_list";
    }
    //删除分类
    @RequestMapping("admin_category_delete")
    public String delete(int id,HttpSession session) throws IOException {
        categoryService.delete(id);
        return "redirect:/admin_category_list";
    }
}