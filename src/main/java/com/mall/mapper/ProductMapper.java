package com.mall.mapper;

import com.mall.pojo.Product;
import com.mall.pojo.ProductExample;

import java.util.List;
import java.util.Map;

public interface ProductMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Product record);

    int insertSelective(Product record);

    List<Product> selectByExample(ProductExample example);

    Product selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);
    
    List<Product> getProductList(Map<String, Object> map);
    
    int getProductListCount(Map<String, Object> map);
}