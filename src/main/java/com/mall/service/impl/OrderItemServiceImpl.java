package com.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.mapper.OrderItemMapper;
import com.mall.pojo.Order;
import com.mall.pojo.OrderItem;
import com.mall.pojo.OrderItemExample;
import com.mall.pojo.Product;
import com.mall.service.OrderItemService;
import com.mall.service.ProductService;




@Service
public class OrderItemServiceImpl implements OrderItemService {
    @Autowired
    OrderItemMapper orderItemMapper;
    @Autowired
    ProductService productService;

    @Override
    public void add(OrderItem c) {
        orderItemMapper.insert(c);
    }

    @Override
    public void delete(int id) {
        orderItemMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(OrderItem c) {
        orderItemMapper.updateByPrimaryKeySelective(c);
    }

    @Override
    public OrderItem get(int id) {
        OrderItem result = orderItemMapper.selectByPrimaryKey(id);
        setProduct(result);
        return result;
    }

    public List<OrderItem> list(){
        OrderItemExample example =new OrderItemExample();
        example.setOrderByClause("id desc");
        return orderItemMapper.selectByExample(example);

    }

    //循环遍历订单列表，循环填充订单项
    @Override
    public void fill(List<Order> os) {
        for (Order o : os) {
            fill(o);
        }
    }

    @Override
    public int getSaleCount(int pid) {
        OrderItemExample example =new OrderItemExample();
        example.createCriteria().andPidEqualTo(pid);
        List<OrderItem> ois =orderItemMapper.selectByExample(example);
        int result =0;
        for (OrderItem oi : ois) {
            result+=oi.getNumber();
        }
        return result;
    }

    @Override
    public List<OrderItem> listByUser(int uid) {
        OrderItemExample example =new OrderItemExample();
        example.createCriteria().andUidEqualTo(uid).andOidIsNull();
        List<OrderItem> result =orderItemMapper.selectByExample(example);
        setProduct(result);
        return result;
    }

    
    //根据每个订单的id，找出每个订单对应的订单项，计算总金额和数量，根据订单项获取对应的产品
    public void fill(Order o) {
    	//根据每个订单的id，找出每个订单对应的订单项
        OrderItemExample example =new OrderItemExample();
        example.createCriteria().andOidEqualTo(o.getId());
        example.setOrderByClause("id desc");
        List<OrderItem> ois =orderItemMapper.selectByExample(example);
        
        //根据订单项获取对应的产品
        setProduct(ois);

        float total = 0;
        int totalNumber = 0;
        //计算总金额和数量
        for (OrderItem oi : ois) {
            total+=oi.getNumber()*oi.getProduct().getPromotePrice();
            totalNumber+=oi.getNumber();
        }
        
        //订单设置总金额和数量
        o.setTotal(total);
        o.setTotalNumber(totalNumber);
        
        //订单设置订单项列表
        o.setOrderItems(ois);
    }
    
    //遍历订单项获取产品
    public void setProduct(List<OrderItem> ois){
        for (OrderItem oi: ois) {
            setProduct(oi);
        }
    }
    //获取产品
    private void setProduct(OrderItem oi) {
        Product p = productService.get(oi.getPid());
        //订单项设置产品
        oi.setProduct(p);
    }
}

