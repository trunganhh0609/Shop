package com.project.qlrl.controllers;

import com.project.qlrl.services.PromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api")
public class PromotionController {

    @Autowired
    PromotionService promotionService;

    @GetMapping("/getAllPromotion")
    public Map getList(){
        return promotionService.getAll();
    }

    @PostMapping("savePromotion")
    public Map save(@RequestBody Map param){
        return promotionService.savePromotion(param);
    }

    @PostMapping("deletePromotion")
    public Map delete(@RequestBody Map param){
        return promotionService.delete(param);
    }

    @GetMapping("/getLstType")
    public Map getPromotionType(){
        return promotionService.getPromotionType();
    }
}
