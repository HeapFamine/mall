package com.mall.pojo;

import java.util.Date;

public class User {
    private Integer id;

    private String name;

    private String password;

    private Date registerDate;

    private String mobile;

    private String address;
    
    
    //修改User, 增加一个getAnonymousName方法用于在显示评价者的时候进行匿名显示
	public String getAnonymousName(){
	    if(null==name)
	        return null;
	
	    if(name.length()<=1)
	        return "*";
	
	    if(name.length()==2)
	        return name.substring(0,1) +"*";
	
	    char[] cs =name.toCharArray();
	    for (int i = 1; i < cs.length-1; i++) {
	        cs[i]='*';
	    }
	    return new String(cs);
	}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }
}