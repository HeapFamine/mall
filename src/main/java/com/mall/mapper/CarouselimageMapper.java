package com.mall.mapper;

import com.mall.pojo.Carouselimage;
import com.mall.pojo.CarouselimageExample;
import java.util.List;

public interface CarouselimageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Carouselimage record);

    int insertSelective(Carouselimage record);

    List<Carouselimage> selectByExample(CarouselimageExample example);

    Carouselimage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Carouselimage record);

    int updateByPrimaryKey(Carouselimage record);
}