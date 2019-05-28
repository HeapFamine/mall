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
    
    //立即购买
    @RequestMapping("forebuyone")
    public String buyone(int pid, int num, HttpSession session) {
        Product p = productService.get(pid);
    
        session.setAttribute("p", p);
        session.setAttribute("num", num);
        
        //session.removeAttribute("user");
        
        return "fore/buyone";
    }
    @RequestMapping("buyone_createOrder")
    public String buyone_createOrder( Model model,Order order,HttpSession session){
    	//获取用户
        User user =(User) session.getAttribute("user");
        
        //设置用户属性
        user.setMobile(order.getMobile());
        user.setAddress(order.getAddress());
        
        //获取购买产品和购买数量
        Product p = (Product)session.getAttribute("p");
        int num = (int)session.getAttribute("num");
        
        //设置订单各项属性
        String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + RandomUtils.nextInt(10000);
        order.setOrderCode(orderCode);
        order.setCreateDate(new Date());
        order.setUid(user.getId());
        order.setStatus(OrderService.waitPay);
        
        //生成订单项
        OrderItem oi = new OrderItem();
        oi.setUid(user.getId());
        oi.setNumber(num);
        oi.setPid(p.getId());
        orderItemService.add(oi);
        
        //通过订单项id获取完整的订单项信息
        int oiid = oi.getId();
        OrderItem oi_T = orderItemService.get(oiid);
        
        //生成订单项集合
        List<OrderItem> ois = new ArrayList<>();
        ois.add(oi_T);
        
        
        //更新用户信息
        userService.update(user);
        
        //设置session
        session.setAttribute("user", user);
        
        //清空产品和数量
        session.removeAttribute("p");
        session.removeAttribute("num");

        //获取总价格、保存订单、设置订单项
        float total =orderService.add(order,ois);
        return "redirect:forealipay?oid="+order.getId() +"&total="+total;
    }

    
//    @RequestMapping("forebuyone")
//    public String buyone(int pid, int num, HttpSession session) {
//        Product p = productService.get(pid);
//        int oiid = 0;
//
//        User user =(User)  session.getAttribute("user");
//        boolean found = false;
//        List<OrderItem> ois = orderItemService.listByUser(user.getId());
//        for (OrderItem oi : ois) {
//            if(oi.getProduct().getId().intValue()==p.getId().intValue()){
//                oi.setNumber(oi.getNumber()+num);
//                orderItemService.update(oi);
//                found = true;
//                oiid = oi.getId();
//                break;
//            }
//        }
//
//        if(!found){
//            OrderItem oi = new OrderItem();
//            oi.setUid(user.getId());
//            oi.setNumber(num);
//            oi.setPid(pid);
//            orderItemService.add(oi);
//            oiid = oi.getId();
//        }
//        return "redirect:forebuy?oiid="+oiid;
//    }
//    
    
    //购物车结算
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
    
    //跳转到支付界面
    @RequestMapping("forealipay")
    public String alipay(){
        return "fore/alipay";
    }
    //支付
    @RequestMapping("forepayed")
    public String payed(int oid, float total, Model model) {
        Order order = orderService.get(oid);
        order.setStatus(OrderService.waitDelivery);
        order.setPayDate(new Date());
        orderService.update(order);
        model.addAttribute("o", order);
        return "fore/payed";
    }
    
    //订单管理
    @RequestMapping("forebought")
    public String bought( Model model,HttpSession session) {
        User user =(User)  session.getAttribute("user");
        List<Order> os= orderService.list(user.getId(),OrderService.delete);

        orderItemService.fill(os);

        model.addAttribute("os", os);

        return "fore/bought";
    }

    //确认收货
    @RequestMapping("foreorderConfirmed")
    public String orderConfirmed( Model model,int oid) {
        Order o = orderService.get(oid);
        o.setStatus(OrderService.waitReview);
        o.setConfirmDate(new Date());
        orderService.update(o);
        return "fore/orderConfirmed";
    }
    
    //删除订单项
    @RequestMapping("foredeleteOrder")
    public String deleteOrder( Model model,int oid){
        Order o = orderService.get(oid);
        o.setStatus(OrderService.delete);
        orderService.update(o);
        return "fore/bought";
    }
}
