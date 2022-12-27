package com.project.qlrl.services;

import com.project.qlrl.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class CategoryService {
    @Autowired
    CategoryRepository categoryRepository;

    public Map<Object,Object> search(Map param){
        Map<Object,Object> result = new HashMap<>();

        try {
            result.put("data", categoryRepository.search(param));
        }catch (Exception e){
            e.printStackTrace();
            result.put("error", "error");
        }
        return result;
    }

    public Map<Object,Object> saveCategory(Map param){
        Map<Object,Object> result = new HashMap<>();
        try {
            if(param.get("CATEGORY_ID") == null){
                result.put("success", categoryRepository.addCategory(param));
            }else {
                result.put("success", categoryRepository.updateCategory(param));
            }
        }catch (Exception e){
            e.printStackTrace();
            result.put("error", "error");
        }
        return result;
    }

    public Map<Object,Object> deleteCategory(Map param){
        Map<Object,Object> result = new HashMap<>();
        try {
            result.put("success", categoryRepository.deleteCategory(param));
        }catch (Exception e){
            e.printStackTrace();
            result.put("error", "error");
        }
        return result;
    }
}
