package com.mall.service;

import java.util.List;
import java.util.Map;

import com.mall.pojo.Category;
import com.mall.pojo.Product;

public interface ProductService {
    List<Product> list();

    void add(Product product);

    void delete(int id);

    Product get(int id);

    void update(Product product);
    
    List<Product> getProductList(Map<String, Object> map);
    
    int getProductListCount(Map<String, Object> map);
    
    //前台
    List list(int cid);
    
    //设置第一张图片
    void setFirstProductImage(Product p);
    
    //为多个分类填充产品集合
    void fill(List<Category> cs);

    //为分类填充产品集合
    void fill(Category c);

    //为多个分类填充推荐产品集合，即把分类下的产品集合，按照8个为一行，拆成多行，以利于后续页面上进行显示
    void fillByRow(List<Category> cs);

    //产品设置销量和评价数量
    void setSaleAndReviewNumber(Product p);
    void setSaleAndReviewNumber(List<Product> ps);

    List<Product> search(String keyword);
}
