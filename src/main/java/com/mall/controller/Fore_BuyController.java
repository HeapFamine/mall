package com.mall.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.math.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mall.pojo.Order;
import com.mall.pojo.OrderItem;
import com.mall.pojo.Product;
import com.mall.pojo.User;
import com.mall.service.CategoryService;
import com.mall.service.OrderItemService;
import com.mall.service.OrderService;
import com.mall.service.ProductImageService;
import com.mall.service.ProductService;
import com.mall.service.ReviewService;
import com.mall.service.UserService;

@Controller
@RequestMapping("")
public class Fore_BuyController {
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductService productService;
    @Autowired
    UserService userService;
    @Autowired
    ProductImageService productImageService;

    @Autowired
    OrderService orderService;
    @Autowired
    OrderItemService orderItemService;
    @Autowired
    ReviewService reviewService;
    
    @RequestMapping("forebuyone")
    public String buyone(int pid, int num, HttpSession session) {
        Product p = productService.get(pid);
        int oiid = 0;

        User user =(User)  session.getAttribute("user");
        boolean found = false;
        List<OrderItem> ois = orderItemService.listByUser(user.getId());
        for (OrderItem oi : ois) {
            if(oi.getProduct().getId().intValue()==p.getId().intValue()){
                oi.setNumber(oi.getNumber()+num);
                orderItemService.update(oi);
                found = true;
                oiid = oi.getId();
                break;
            }
        }

        if(!found){
            OrderItem oi = new OrderItem();
            oi.setUid(user.getId());
            oi.setNumber(num);
            oi.setPid(pid);
            orderItemService.add(oi);
            oiid = oi.getId();
        }
        return "redirect:forebuy?oiid="+oiid;
    }
    
    @RequestMapping("forebuy")
    public String buy( Model model,String[] oiid,HttpSession session){
        List<OrderItem> ois = new ArrayList<>();
        float total = 0;

        for (String strid : oiid) {
            int id = Integer.parseInt(strid);
            OrderItem oi= orderItemService.get(id);
            total +=oi.getProduct().getPromotePrice()*oi.getNumber();
            ois.add(oi);
        }
        

        session.setAttribute("ois", ois);
        model.addAttribute("total", total);
        return "fore/buy";
    }
    
    @RequestMapping("forealipay")
    public String alipay(){
        return "fore/alipay";
    }


    @RequestMapping("forecreateOrder")
    public String createOrder( Model model,Order order,HttpSession session){
        User user =(User)  session.getAttribute("user");
        
        user.setMobile(order.getMobile());
        user.setAddress(order.getAddress());
        
        String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + RandomUtils.nextInt(10000);
        order.setOrderCode(orderCode);
        order.setCreateDate(new Date());
        order.setUid(user.getId());
        order.setStatus(OrderService.waitPay);
        List<OrderItem> ois= (List<OrderItem>)  session.getAttribute("ois");
        
        //更新用户信息
        userService.update(user);
        //设置session
        session.setAttribute("user", user);

        float total =orderService.add(order,ois);
        return "redirect:forealipay?oid="+order.getId() +"&total="+total;
    }


    @RequestMapping("forepayed")
    public String payed(int oid, float total, Model model) {
        Order order = orderService.get(oid);
        order.setStatus(OrderService.waitDelivery);
        order.setPayDate(new Date());
        orderService.update(order);
        model.addAttribute("o", order);
        return "fore/payed";
    }

    @RequestMapping("forebought")
    public String bought( Model model,HttpSession session) {
        User user =(User)  session.getAttribute("user");
        List<Order> os= orderService.list(user.getId(),OrderService.delete);

        orderItemService.fill(os);

        model.addAttribute("os", os);

        return "fore/bought";
    }

    @RequestMapping("foreconfirmPay")
    public String confirmPay( Model model,int oid) {
        Order o = orderService.get(oid);
        orderItemService.fill(o);
        model.addAttribute("o", o);
        return "fore/confirmPay";
    }
    @RequestMapping("foreorderConfirmed")
    public String orderConfirmed( Model model,int oid) {
        Order o = orderService.get(oid);
        o.setStatus(OrderService.waitReview);
        o.setConfirmDate(new Date());
        orderService.update(o);
        return "fore/orderConfirmed";
    }
    @RequestMapping("foredeleteOrder")
    @ResponseBody
    public String deleteOrder( Model model,int oid){
        Order o = orderService.get(oid);
        o.setStatus(OrderService.delete);
        orderService.update(o);
        return "success";
    }
}
