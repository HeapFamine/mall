package com.mall.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.mapper.UserMapper;
import com.mall.pojo.User;
import com.mall.pojo.UserExample;
import com.mall.service.UserService;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    UserMapper userMapper;
    
    @Override
    public List<User> getUserList(Map<String, Object> map){
        return userMapper.getUserList(map);

    }
    @Override
	public int getUserListCount(Map<String, Object> map) {
		return userMapper.getUserListCount(map);
	}

    @Override
    public List<User> list() {
        UserExample example =new UserExample();
        example.setOrderByClause("id desc");
        return userMapper.selectByExample(example);
    }

    @Override
    public void add(User user) {
    	userMapper.insert(user);
    }

    @Override
    public void delete(int id) {
    	userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public User get(int id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(User user) {
    	userMapper.updateByPrimaryKeySelective(user);
    }
    
    @Override
    public boolean isExist(String name) {
        UserExample example =new UserExample();
        example.createCriteria().andNameEqualTo(name);
        List<User> result= userMapper.selectByExample(example);
        if(!result.isEmpty())
            return true;
        return false;

    }

    @Override
    public User get(String name, String password) {
        UserExample example =new UserExample();
        example.createCriteria().andNameEqualTo(name).andPasswordEqualTo(password);
        List<User> result= userMapper.selectByExample(example);
        if(result.isEmpty())
            return null;
        return result.get(0);
    }
}
