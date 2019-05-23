package com.mall.controller;

import com.github.pagehelper.PageHelper;
import com.mall.pojo.*;
import com.mall.service.*;
import comparator.*;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("")
public class ForeController {
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductService productService;
    @Autowired
    UserService userService;
    @Autowired
    ProductImageService productImageService;

    @Autowired
    OrderService orderService;
    @Autowired
    OrderItemService orderItemService;
    @Autowired
    ReviewService reviewService;
    
    @Autowired
    CarouselImageService  carouselimageService;
    
    @RequestMapping("forehome")
    public String home(Model model) {
    	
        List<Category> cs= categoryService.list();
        List<Carouselimage> cis = carouselimageService.list();
        
        //为分类列表填充产品集合
        productService.fill(cs);
        
        //为多个分类填充推荐产品集合，即把分类下的产品集合，按照8个为一行，拆成多行，以利于后续页面上进行显示
        productService.fillByRow(cs);
        
        model.addAttribute("cs", cs);
        model.addAttribute("cis", cis);
        return "fore/home";
    }
    


    //显示产品
    @RequestMapping("foreproduct")
    public String product( int pid, Model model) {
        Product p = productService.get(pid);

        //获取图片
        List<ProductImage> productSingleImages = productImageService.list(p.getId(), ProductImageService.type_single);
        List<ProductImage> productDetailImages = productImageService.list(p.getId(), ProductImageService.type_detail);
       
        //设置图片
        p.setProductSingleImages(productSingleImages);
        p.setProductDetailImages(productDetailImages);

        //获取评论列表
        List<Review> reviews = reviewService.list(p.getId());
        
        //为产品设置销量和评论
        productService.setSaleAndReviewNumber(p);

        model.addAttribute("reviews", reviews);
        model.addAttribute("p", p);
        return "fore/product";
    }


   
    
    //分类排序
    @RequestMapping("forecategory")
    public String category(int cid,String sort, Model model) {
        Category c = categoryService.get(cid);
        productService.fill(c);
        productService.setSaleAndReviewNumber(c.getProducts());

        if(null!=sort){
            switch(sort){
                case "review":
                    Collections.sort(c.getProducts(),new ProductReviewComparator());
                    break;
                case "date" :
                    Collections.sort(c.getProducts(),new ProductDateComparator());
                    break;

                case "saleCount" :
                    Collections.sort(c.getProducts(),new ProductSaleCountComparator());
                    break;

                case "price":
                    Collections.sort(c.getProducts(),new ProductPriceComparator());
                    break;

                case "all":
                    Collections.sort(c.getProducts(),new ProductAllComparator());
                    break;
            }
        }

        model.addAttribute("c", c);
        return "fore/category";
    }

    @RequestMapping("foresearch")
    public String search( String keyword,Model model){

        PageHelper.offsetPage(0,20);
        List<Product> ps= productService.search(keyword);
        productService.setSaleAndReviewNumber(ps);
        model.addAttribute("ps",ps);
        return "fore/searchResult";
    }

    @RequestMapping("forereview")
    public String review( Model model,int oid) {
        Order o = orderService.get(oid);
        orderItemService.fill(o);
        Product p = o.getOrderItems().get(0).getProduct();
        List<Review> reviews = reviewService.list(p.getId());
        productService.setSaleAndReviewNumber(p);
        model.addAttribute("p", p);
        model.addAttribute("o", o);
        model.addAttribute("reviews", reviews);
        return "fore/review";
    }
    @RequestMapping("foredoreview")
    public String doreview( Model model,HttpSession session,@RequestParam("oid") int oid,@RequestParam("pid") int pid,String content) {
        Order o = orderService.get(oid);
        o.setStatus(OrderService.finish);
        orderService.update(o);

        Product p = productService.get(pid);
        content = HtmlUtils.htmlEscape(content);

        User user =(User)  session.getAttribute("user");
        Review review = new Review();
        review.setContent(content);
        review.setPid(pid);
        review.setCreateDate(new Date());
        review.setUid(user.getId());
        reviewService.add(review);

        return "redirect:forereview?oid="+oid+"&showonly=true";
    }

}