package com.mall.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mall.pojo.Category;
import com.mall.pojo.Product;
import com.mall.service.CategoryService;
import com.mall.service.ProductService;


@Controller
@RequestMapping("")
public class ProductController {
	
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductService productService;
    
    //获取产品列表，跳转到产品页面
    @RequestMapping("admin_product_list")
    public String list(int cid, Model model){
      Category c = categoryService.get(cid);
      model.addAttribute("c", c);
      return "admin/listProduct";
    }
    
    //获取产品列表
    @RequestMapping("getProductList")
    @ResponseBody
    public Map<String, Object> list(Integer page, Integer limit,Integer cid,String searContent){
    	Map<String, Object> map = new HashMap<>();
        map.put("page", (page - 1) * limit);
        map.put("limit", limit);
        map.put("cid", cid);
        map.put("searContent", searContent);
        
        List<Product> data = productService.getProductList(map);
        int count = productService.getProductListCount(map);
        Map<String, Object> result = new HashMap<>();
        result.put("code", 0);
        result.put("msg", "");
        result.put("data", data);
        result.put("count", count);
        return result;
    }
    
    //跳转到产品添加页面
    @RequestMapping("addProduct")
    public String add(int cid, Model model) {
        Category c = categoryService.get(cid);
        model.addAttribute("c", c);
        return "admin/addProduct";
    }
    //增加产品
    @RequestMapping("admin_product_add")
    public String add(Model model, Product p) {
    	p.setCreateDate(new Date());
        productService.add(p);
        return "redirect:admin_product_list?cid="+p.getCid();
    }
    
    //编辑产品
    @RequestMapping("admin_product_edit")
    public String edit(int id,Model model) throws IOException {
    	Product p= productService.get(id);
        model.addAttribute("p", p);
        return "admin/editProduct";
    }
    
    @RequestMapping("admin_product_update")
    public String update(Product p) throws IOException {
    	productService.update(p);
        return "redirect:/admin_product_list?cid="+p.getCid();
    }
    
    //删除产品
    @RequestMapping("admin_product_delete")
    public String delete(int id) throws IOException {
    	Product p= productService.get(id);
    	productService.delete(id);
        return "redirect:/admin_product_list?cid="+p.getCid();
    }
    
}
