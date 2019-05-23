package com.mall.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.mapper.AdminMapper;
import com.mall.pojo.Admin;
import com.mall.pojo.AdminExample;
import com.mall.service.AdminService;


@Service
public class AdminServiceImpl implements AdminService{
    @Autowired
    AdminMapper adminMapper;
    
    @Override
    public List<Admin> getAdminList(Map<String, Object> map){
        return adminMapper.getAdminList(map);

    }
    @Override
	public int getAdminListCount(Map<String, Object> map) {
		return adminMapper.getAdminListCount(map);
	}

    @Override
    public List<Admin> list() {
        AdminExample example =new AdminExample();
        example.setOrderByClause("id desc");
        return adminMapper.selectByExample(example);
    }

    @Override
    public void add(Admin Admin) {
    	adminMapper.insert(Admin);
    }

    @Override
    public void delete(int id) {
    	adminMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Admin get(int id) {
        return adminMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(Admin Admin) {
    	adminMapper.updateByPrimaryKeySelective(Admin);
    }
    
    @Override
    public boolean isExist(String name) {
        AdminExample example =new AdminExample();
        example.createCriteria().andNameEqualTo(name);
        List<Admin> result= adminMapper.selectByExample(example);
        if(!result.isEmpty())
            return true;
        return false;

    }

    @Override
    public Admin get(String name, String password) {
        AdminExample example =new AdminExample();
        example.createCriteria().andNameEqualTo(name).andPasswordEqualTo(password);
        List<Admin> result= adminMapper.selectByExample(example);
        if(result.isEmpty())
            return null;
        return result.get(0);
    }
}
