package com.project.qlrl.repository;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface PromotionRepository {
    List<Map<Object, Object>> getAll();

    List<Map<Object, Object>> getPromotionType();

    int addPromotion(Map param);

    int updatePromotion(Map param);

    int deletePromotion(Map param);
}
