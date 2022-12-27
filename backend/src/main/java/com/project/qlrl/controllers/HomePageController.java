package com.project.qlrl.controllers;

import com.project.qlrl.services.HomePageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/public")
public class HomePageController {

    @Autowired
    HomePageService homePageService;

    @GetMapping("homeData")
    public Map<Object, Object> homeData(){
        return homePageService.getDataHomePage();
    }
}
