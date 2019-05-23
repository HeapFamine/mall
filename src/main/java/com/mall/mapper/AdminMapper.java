package com.mall.mapper;

import com.mall.pojo.Admin;
import com.mall.pojo.AdminExample;
import java.util.List;
import java.util.Map;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);

    List<Admin> selectByExample(AdminExample example);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
    
	List<Admin> getAdminList(Map<String, Object> map);

	int getAdminListCount(Map<String, Object> map) ;
}