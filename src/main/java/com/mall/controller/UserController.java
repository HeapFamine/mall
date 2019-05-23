package com.mall.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mall.pojo.User;
import com.mall.service.UserService;

@Controller
@RequestMapping("")
public class UserController {
    @Autowired
    UserService userService;
    
    @RequestMapping("admin_user_list")
    public String admin_User_list(){
        return "admin/listUser";
    }
  
    //获取分类列表
    @RequestMapping("getUserList")
    @ResponseBody
    public Map<String, Object> list(Integer page, Integer limit,String searContent){
    	Map<String, Object> map = new HashMap<>();
        map.put("page", (page - 1) * limit);
        map.put("limit", limit);
        map.put("searContent", searContent);
        
        List<User> data = userService.getUserList(map);
        int count = userService.getUserListCount(map);
        Map<String, Object> result = new HashMap<>();
        result.put("code", 0);
        result.put("msg", "");
        result.put("data", data);
        result.put("count", count);
        return result;
    }
    
    //删除分类
    @RequestMapping("admin_user_delete")
    public String delete(int id) throws IOException {
    	userService.delete(id);
        return "redirect:/admin_user_list";
    }
	

}
