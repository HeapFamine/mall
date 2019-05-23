package com.mall.service;

import java.util.List;
import java.util.Map;

import com.mall.pojo.Admin;
import com.mall.pojo.Carouselimage;

public interface CarouselImageService {
    List<Carouselimage> list();

    void add(Carouselimage carouselimage);

    void delete(int id);

    Carouselimage get(int id);

    void update(Carouselimage carouselimage);
}
