package com.mall.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.mapper.ProductMapper;
import com.mall.pojo.Category;
import com.mall.pojo.Product;
import com.mall.pojo.ProductExample;
import com.mall.pojo.ProductImage;
import com.mall.service.CategoryService;
import com.mall.service.OrderItemService;
import com.mall.service.ProductImageService;
import com.mall.service.ProductService;
import com.mall.service.ReviewService;

@Service
public class ProductServiceImpl implements ProductService {
	 	@Autowired
	    ProductMapper productMapper;
	    @Autowired
	    CategoryService categoryService;
	    @Autowired
	    ProductImageService productImageService;
	    @Autowired
	    OrderItemService orderItemService;
	    @Autowired
	    ReviewService reviewService;
	 
	    
	    @Override
	    public List<Product> getProductList(Map<String, Object> map){
	        return productMapper.getProductList(map);

	    }
	    @Override
		public int getProductListCount(Map<String, Object> map) {
	        
			return productMapper.getProductListCount(map);
		}

	    @Override
	    public List<Product> list() {
	        ProductExample example =new ProductExample();
	        example.setOrderByClause("id desc");
	        return productMapper.selectByExample(example);
	    }

	    @Override
	    public void add(Product product) {
	    	productMapper.insert(product);
	    }

	    @Override
	    public void delete(int id) {
	    	productMapper.deleteByPrimaryKey(id);
	    }

	    @Override
	    public Product get(int id) {
	        Product p = productMapper.selectByPrimaryKey(id);
	        //设置第一张图片和分类
	        setFirstProductImage(p);
	        setCategory(p);
	        return p;
	    }

	    @Override
	    public void update(Product product) {
	    	productMapper.updateByPrimaryKeySelective(product);
	    }
	   
	    
	    //设置销量和评论
	    @Override
	    public void setSaleAndReviewNumber(List<Product> ps) {
	        for (Product p : ps) {
	            setSaleAndReviewNumber(p);
	        }
	    }
	    @Override
	    public void setSaleAndReviewNumber(Product p) {
	        int saleCount = orderItemService.getSaleCount(p.getId());
	        p.setSaleCount(saleCount);

	        int reviewCount = reviewService.getCount(p.getId());
	        p.setReviewCount(reviewCount);
	    }

	    //搜索
	    @Override
	    public List<Product> search(String keyword) {
	        ProductExample example = new ProductExample();
	        example.createCriteria().andNameLike("%" + keyword + "%");
	        example.setOrderByClause("id desc");
	        List result = productMapper.selectByExample(example);
	        setFirstProductImage(result);
	        setCategory(result);
	        return result;
	    }
	    

	    //为多个分类填充推荐产品集合，即把分类下的产品集合，按照8个为一行，拆成多行
	    @Override
	    public void fillByRow(List<Category> cs) {
	        int productNumberEachRow = 8;
	        for (Category c : cs) {
	            List<Product> products =  c.getProducts();
	            List<List<Product>> productsByRow =  new ArrayList<>();
	            for (int i = 0; i < products.size(); i+=productNumberEachRow) {
	                int size = i+productNumberEachRow;
	                size= size>products.size()?products.size():size;
	                List<Product> productsOfEachRow =products.subList(i, size);
	                productsByRow.add(productsOfEachRow);
	            }
	            c.setProductsByRow(productsByRow);
	        }
	    }
	    //为分类填充产品
	    @Override
	    public void fill(List<Category> cs) {
	        for (Category c : cs) {
	            fill(c);
	        }
	    }
	    @Override
	    public void fill(Category c) {
	        List<Product> ps = list(c.getId());
	        c.setProducts(ps);
	    }
	    
	    //获取产品列表，并设置第一张图片和分类
	    @Override
	    public List list(int cid) {
	        ProductExample example = new ProductExample();
	        example.createCriteria().andCidEqualTo(cid);
	        example.setOrderByClause("id");
	        List result = productMapper.selectByExample(example);
	        setFirstProductImage(result);
	        setCategory(result);
	        return result;
	    }

	    
	    //设置第一张图片
	    @Override
	    public void setFirstProductImage(Product p) {
	        List<ProductImage> pis = productImageService.list(p.getId(), ProductImageService.type_single);
	        if (!pis.isEmpty()) {
	            ProductImage pi = pis.get(0);
	            p.setFirstProductImage(pi);
	        }
	    }
	    public void setFirstProductImage(List<Product> ps) {
	        for (Product p : ps) {
	            setFirstProductImage(p);
	        }
	    }
	    
	    //设置分类
	    public void setCategory(List<Product> ps){
	        for (Product p : ps)
	            setCategory(p);
	    }
	    public void setCategory(Product p){
	        int cid = p.getCid();
	        Category c = categoryService.get(cid);
	        p.setCategory(c);
	    }

}
