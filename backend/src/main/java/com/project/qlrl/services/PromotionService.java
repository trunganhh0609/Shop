package com.project.qlrl.services;

import com.project.qlrl.repository.PromotionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PromotionService {
    @Autowired
    PromotionRepository promotionRepository;

    public Map<Object,Object> getAll(){
        Map<Object,Object> result = new HashMap<>();
        try {
            result.put("lstPromotion", promotionRepository.getAll());
        }catch (Exception e){
            e.printStackTrace();
            result.put("error", "error");
        }
        return result;
    }

    public Map savePromotion(Map param){
        Map<Object, Object> result = new HashMap<>();
        try{
            param.put("startTime", param.get("startDate").toString()+" 00:00:00");
            param.put("endTime", param.get("endDate").toString()+" 00:00:00");
            if(param.get("promotionId") == null){
                result.put("success",promotionRepository.addPromotion(param));
            }else {
                result.put("success",promotionRepository.updatePromotion(param));
            }

        }catch (Exception e){
            e.printStackTrace();
            result.put("error", "error");
        }
        return result;
    }

    public Map delete(Map param){
        Map<Object,Object> result = new HashMap<>();
        try {
            result.put("success", promotionRepository.deletePromotion(param));
        }catch (Exception e){
            e.printStackTrace();
            result.put("error", "error");
        }
        return result;
    }

    public Map<Object,Object> getPromotionType(){
        Map<Object,Object> result = new HashMap<>();
        try {
            result.put("data", promotionRepository.getPromotionType());
        }catch (Exception e){
            e.printStackTrace();
            result.put("error", "error");
        }
        return result;
    }
}
