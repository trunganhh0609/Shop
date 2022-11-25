package com.project.qlrl.controllers;

import com.project.qlrl.models.User;
import com.project.qlrl.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

//@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/api")
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping("/all-user")
    public List<Map> getAllUser(){
        return userService.getAllUser();
    }

    @GetMapping("/userRole")
    public Map getUserRole(@RequestParam Map param){
        return userService.getUserRole(param);
    }

    @GetMapping("/userInfo")
    public Map getUserInfo(@RequestParam Map param){
        return userService.getUserInfo(param);
    }
}
