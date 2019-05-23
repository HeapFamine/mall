package com.mall.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import com.mall.pojo.Admin;
import com.mall.pojo.Category;
import com.mall.pojo.User;
import com.mall.service.AdminService;



@Controller
@RequestMapping("")
public class AdminController {
    @Autowired
    AdminService adminService;
	
    @RequestMapping("admin_login")
    public String login(@RequestParam("name") String name, @RequestParam("password") String password, Model model, HttpSession session) {
        name = HtmlUtils.htmlEscape(name);
        Admin admin = adminService.get(name,password);

        if(null==admin){
            model.addAttribute("msg", "账号密码错误");
            return "redirect:admin";
        }
        
        admin.setUptime(new Date());
        adminService.update(admin);
        session.setAttribute("admin", admin);
        
        return "redirect:admin_category_list";
    }
    @RequestMapping("admin")
    public String admin_category_list(){
        return "admin/login";
    }
    
    @RequestMapping("admin_logout")
    public String logout( HttpSession session) {
        session.removeAttribute("admin");
        return "redirect:admin";
    }
    
    
    @RequestMapping("admin_list")
    public String admin_User_list(){
        return "admin/listAdmin";
    }
    
    //增加管理员
    @RequestMapping("admin_add")
    public String add(Admin a, HttpSession session) throws IOException {
    	adminService.add(a);
        return "redirect:/admin_list";
    }
    @RequestMapping("admin_add_list")
    public String addlist(Admin a, HttpSession session) throws IOException {
        return "admin/addAdmin";
    }
    
    //编辑管理员
    @RequestMapping("admin_edit_list")
    public String editlist(int id,Model model) throws IOException {
    	Admin a = adminService.get(id);
    	model.addAttribute("a", a);
        return "admin/editAdmin";
    }
    
    @RequestMapping("admin_update")
    public String update(Admin a) throws IOException {
    
    	adminService.update(a);
        return "redirect:/admin_list";
    }
  
    //获取管理员列表
    @RequestMapping("getAdminList")
    @ResponseBody
    public Map<String, Object> list(Integer page, Integer limit,String searContent){
    	Map<String, Object> map = new HashMap<>();
        map.put("page", (page - 1) * limit);
        map.put("limit", limit);
        map.put("searContent", searContent);
        
        List<Admin> data = adminService.getAdminList(map);
        int count = adminService.getAdminListCount(map);
        Map<String, Object> result = new HashMap<>();
        result.put("code", 0);
        result.put("msg", "");
        result.put("data", data);
        result.put("count", count);
        return result;
    }
    
    //删除管理员
    @RequestMapping("admin_delete")
    public String delete(int id) throws IOException {
    	adminService.delete(id);
        return "redirect:/admin_list";
    }
    
}
