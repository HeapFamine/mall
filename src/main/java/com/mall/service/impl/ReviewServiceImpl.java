package com.mall.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.mapper.ReviewMapper;
import com.mall.pojo.Category;
import com.mall.pojo.Review;
import com.mall.pojo.ReviewExample;
import com.mall.pojo.User;
import com.mall.service.ReviewService;
import com.mall.service.UserService;

@Service
public class ReviewServiceImpl implements ReviewService {
    @Autowired
    ReviewMapper reviewMapper;
    @Autowired
    UserService userService;
    
    
    @Override
    public List<Review> getReviewList(Map<String, Object> map){
        return reviewMapper.getReviewList(map);

    }
    @Override
	public int getReviewListCount(Map<String, Object> map) {
		return reviewMapper.getReviewListCount(map);
	}

    @Override
    public void add(Review c) {
        reviewMapper.insert(c);
    }

    @Override
    public void delete(int id) {
        reviewMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Review c) {
        reviewMapper.updateByPrimaryKeySelective(c);
    }

    @Override
    public Review get(int id) {
        return reviewMapper.selectByPrimaryKey(id);
    }

    public List<Review> list(int pid){
        ReviewExample example =new ReviewExample();
        example.createCriteria().andPidEqualTo(pid);
        example.setOrderByClause("id desc");

        List<Review> result =reviewMapper.selectByExample(example);
        setUser(result);
        return result;
    }

    public void setUser(List<Review> reviews){
        for (Review review : reviews) {
            setUser(review);
        }
    }

    private void setUser(Review review) {
        int uid = review.getUid();
        User user =userService.get(uid);
        review.setUser(user);
    }

    @Override
    public int getCount(int pid) {
        return list(pid).size();
    }

}
