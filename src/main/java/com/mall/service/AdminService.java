package com.mall.service;

import java.util.List;
import java.util.Map;

import com.mall.pojo.Admin;

public interface AdminService {
    List<Admin> list();

    void add(Admin admin);

    void delete(int id);

    Admin get(int id);

    void update(Admin admin);
    
    List<Admin> getAdminList(Map<String, Object> map);
    
    int getAdminListCount(Map<String, Object> map);
    
    //判断某个名称是否已经被使用过了
    boolean isExist(String name);

    Admin get(String name, String password);
}
