package com.project.qlrl.repository;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface ProductRepository {
    List<Map<Object,Object>> getLstPromotionProduct();

    List<Map<Object,Object>> getNewProduct();
}
