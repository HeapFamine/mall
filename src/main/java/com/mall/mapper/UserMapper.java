package com.mall.mapper;

import com.mall.pojo.User;
import com.mall.pojo.UserExample;
import java.util.List;
import java.util.Map;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    List<User> getUserList(Map<String, Object> map);
    
    int getUserListCount(Map<String, Object> map);
}