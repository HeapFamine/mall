package com.mall.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mall.pojo.Category;
import com.mall.pojo.Order;
import com.mall.service.OrderItemService;
import com.mall.service.OrderService;


@Controller
@RequestMapping("")
public class OrderController {
    @Autowired
    OrderService orderService;
    @Autowired
    OrderItemService orderItemService;

    @RequestMapping("admin_order_list")
    public String list(Model model){
        return "admin/listOrder";
    }
    
    @RequestMapping("admin_orderdetail_list")
    public String listDetail(int id,Model model){
        
        //填充订单，根据每个订单的id，找出每个订单对应的订单项
        //根据订单项获取对应的产品，计算总金额和数量
    	Order o = orderService.get(id);
        orderItemService.fill(o);
           
        model.addAttribute("o", o);
    	
    	
        return "admin/listOrderDetail";
    }
    
    //获取订单列表
    @RequestMapping("getOrderList")
    @ResponseBody
    public Map<String, Object> list(Integer page, Integer limit,String searContent){
    	Map<String, Object> map = new HashMap<>();
        map.put("page", (page - 1) * limit);
        map.put("limit", limit);
        map.put("searContent", searContent);
        
        List<Order> data = orderService.getOrderList(map);
        int count = orderService.getOrderListCount(map);
        Map<String, Object> result = new HashMap<>();
        result.put("code", 0);
        result.put("msg", "");
        result.put("data", data);
        result.put("count", count);
        return result;
    }

    @RequestMapping("admin_order_delivery")
    public String delivery(Order o) throws IOException {
        o.setDeliveryDate(new Date());
        o.setStatus(OrderService.waitConfirm);
        orderService.update(o);
        return "redirect:admin_order_list";
    }
}
