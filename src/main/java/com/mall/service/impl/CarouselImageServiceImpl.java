package com.mall.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.mapper.CarouselimageMapper;
import com.mall.pojo.Carouselimage;
import com.mall.pojo.CarouselimageExample;
import com.mall.service.CarouselImageService;



@Service
public class CarouselImageServiceImpl implements CarouselImageService{
    @Autowired
    CarouselimageMapper carouselimageMapper;

    @Override
    public List<Carouselimage> list() {
    	CarouselimageExample example =new CarouselimageExample();
        example.setOrderByClause("id");
        return carouselimageMapper.selectByExample(example);
    }

    @Override
    public void add(Carouselimage carouselimage) {
    	carouselimageMapper.insert(carouselimage);
    }

    @Override
    public void delete(int id) {
    	carouselimageMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Carouselimage get(int id) {
        return carouselimageMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(Carouselimage carouselimage) {
    	carouselimageMapper.updateByPrimaryKeySelective(carouselimage);
    }
    

}
