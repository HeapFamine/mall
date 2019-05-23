package com.mall.service;


import java.util.List;
import java.util.Map;

import com.mall.pojo.Category;

public interface CategoryService{
    List<Category> list();

    void add(Category category);

    void delete(int id);

    Category get(int id);

    void update(Category category);
    
    List<Category> getCategoryList(Map<String, Object> map);
    
    int getCategoryListCount(Map<String, Object> map);
}