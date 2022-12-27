package com.project.qlrl.repository;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CategoryRepository {

    List<Map<Object,Object>> search(Map param);

    int addCategory(Map param);

    int updateCategory(Map param);

    int deleteCategory(Map param);

}
