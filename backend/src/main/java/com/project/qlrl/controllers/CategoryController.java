package com.project.qlrl.controllers;

import com.project.qlrl.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api")
public class CategoryController {

    @Autowired
    CategoryService categoryService;

    @GetMapping("/searchCategory")
    public Map<Object,Object> search (@RequestParam Map param){
        return categoryService.search(param);
    }

    @PostMapping("/saveCategory")
    public Map<Object,Object> saveCategory(@RequestBody Map param){
        return categoryService.saveCategory(param);
    }

    @PostMapping("/deleteCategory")
    public Map<Object,Object> deleteCategory(@RequestBody Map param){
        return categoryService.deleteCategory(param);
    }

}
