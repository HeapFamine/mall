package com.mall.service;

import java.util.List;
import java.util.Map;

import com.mall.pojo.Category;
import com.mall.pojo.User;

public interface UserService {
    List<User> list();

    void add(User user);

    void delete(int id);

    User get(int id);

    void update(User user);
    
    List<User> getUserList(Map<String, Object> map);
    
    int getUserListCount(Map<String, Object> map);
    
    //判断某个名称是否已经被使用过了
    boolean isExist(String name);

    User get(String name, String password);

}
