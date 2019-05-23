

package com.mall.service;
 
import java.util.List;
import java.util.Map;

import com.mall.pojo.Review;

public interface ReviewService {
     

    void add(Review c);

    void delete(int id);
    void update(Review c);
    Review get(int id);
    List list(int pid);

    
    //获取评论数量
    int getCount(int pid);
    
    List<Review> getReviewList(Map<String, Object> map);
    
    int getReviewListCount(Map<String, Object> map);
}

