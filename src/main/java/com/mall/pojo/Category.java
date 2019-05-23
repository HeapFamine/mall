package com.mall.pojo;

import java.util.Date;
import java.util.List;

public class Category {
    private Integer id;

    private String name;

    private Date createDate;
    
    
	/*如下是非数据库字段*/
	private List<Product> products;
	
	//productsByRow这个属性的类型是List<List<Product>> productsByRow。
	//即一个分类又对应多个 List<Product>，提供这个属性，是为了在首页竖状导航的分类名称右边显示推荐产品列表。
	private List<List<Product>> productsByRow;
	
	public List<Product> getProducts() {
		return products;
	}
	
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
	public List<List<Product>> getProductsByRow() {
		return productsByRow;
	}
	
	public void setProductsByRow(List<List<Product>> productsByRow) {
		this.productsByRow = productsByRow;
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

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}