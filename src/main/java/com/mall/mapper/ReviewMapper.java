package com.mall.mapper;

import com.mall.pojo.Review;
import com.mall.pojo.ReviewExample;

import java.util.List;
import java.util.Map;

public interface ReviewMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Review record);

    int insertSelective(Review record);

    List<Review> selectByExample(ReviewExample example);

    Review selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Review record);

    int updateByPrimaryKey(Review record);
    
    List<Review> getReviewList(Map<String, Object> map);
    
    int getReviewListCount(Map<String, Object> map);
    
}