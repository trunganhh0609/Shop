package com.project.qlrl.services;

import com.project.qlrl.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@Service
public class HomePageService {

    @Autowired
    ProductRepository productRepository;

    public Map getDataHomePage() {
        Map result = new HashMap<>();

        try {
            result.put("lstPromotionProduct", productRepository.getLstPromotionProduct());
            result.put("lstNewProduct", productRepository.getNewProduct());
        }catch (Exception e){
            result.put("err","err");
        }
        return result;
    }
}
