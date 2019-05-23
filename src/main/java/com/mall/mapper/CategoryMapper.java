package com.mall.mapper;

import com.mall.pojo.Category;
import com.mall.pojo.CategoryExample;
import java.util.List;
import java.util.Map;

public interface CategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Category record);

    int insertSelective(Category record);

    List<Category> selectByExample(CategoryExample example);

    Category selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
    
	List<Category> getCategoryList(Map<String, Object> map);
	    
	int getCategoryListCount(Map<String, Object> map);
}