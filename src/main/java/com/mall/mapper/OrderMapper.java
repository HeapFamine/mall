package com.mall.mapper;

import com.mall.pojo.Order;
import com.mall.pojo.OrderExample;
import com.mall.pojo.Order;

import java.util.List;
import java.util.Map;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    List<Order> selectByExample(OrderExample example);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    
    List<Order> getOrderList(Map<String, Object> map);
    
    int getOrderListCount(Map<String, Object> map);
    
}