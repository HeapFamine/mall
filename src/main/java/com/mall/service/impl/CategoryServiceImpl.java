package com.mall.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.mapper.CategoryMapper;
import com.mall.pojo.Category;
import com.mall.pojo.CategoryExample;
import com.mall.service.CategoryService;

import java.util.List;
import java.util.Map;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryMapper categoryMapper;
    
    @Override
    public List<Category> getCategoryList(Map<String, Object> map){
        return categoryMapper.getCategoryList(map);

    }
    @Override
	public int getCategoryListCount(Map<String, Object> map) {
		return categoryMapper.getCategoryListCount(map);
	}

    @Override
    public List<Category> list() {
        CategoryExample example =new CategoryExample();
        example.setOrderByClause("id");
        return categoryMapper.selectByExample(example);
    }

    @Override
    public void add(Category category) {
        categoryMapper.insert(category);
    }

    @Override
    public void delete(int id) {
        categoryMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Category get(int id) {
        return categoryMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(Category category) {
        categoryMapper.updateByPrimaryKeySelective(category);
    }
}