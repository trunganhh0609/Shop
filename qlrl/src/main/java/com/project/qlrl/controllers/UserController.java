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

    @PostMapping("/addUser")
    public Map addUser(@RequestBody Map param){
        return userService.addUser(param);
    }

    @PostMapping("/updateUser")
    public Map updateUser(@RequestBody Map param){
        return userService.updateUser(param);
    }

    @PostMapping("/blockUser")
    public Map blockUser(@RequestBody Map param){
        return userService.blockUser(param);
    }

    @PostMapping("/activeUser")
    public Map activeUser(@RequestBody Map param){
        return userService.activeUser(param);
    }

    @PostMapping("/public/register")
    public Map register(@RequestBody Map param){
        return userService.registerUser(param);
    }
}
