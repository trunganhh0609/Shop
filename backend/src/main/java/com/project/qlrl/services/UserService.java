package com.project.qlrl.services;

import com.project.qlrl.models.User;
import com.project.qlrl.repository.ProductRepository;
import com.project.qlrl.repository.UserRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService {
    @Autowired
    UserRepos userRepos;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    ProductService productService;

    public User getUserByUserName(String param){
        return userRepos.getUserByUserName(param);
    }

    public List<Map> getAllUser(){
        return userRepos.getAllUser();
    }

    public Map getUserRole(Map param){
        return userRepos.getUserRole(param);
    }

    public Map getUserInfo(Map param){
        return userRepos.getUserInfo(param);
    }

    public Map<Object, Object> addUser(Map param){
        Map<Object,Object> result = new HashMap<>();
        try {
            if(getUserByUserName(param.get("userName").toString()) != null){
                result.put("existUserName", "true");
            }else{
                param.put("pwd",passwordEncoder.encode(param.get("password").toString()));
                userRepos.addUser(param);
                param.put("userId", userRepos.getLastInsert());
                result.put("success", userRepos.addUserCart(param));
            }

        }catch (Exception e){
            e.printStackTrace();
            result.put("error","error");
        }
        return result;
    }

    public Map<Object,Object> registerUser(Map param){
        Map<Object,Object> result = new HashMap<>();
        try {
            if(userRepos.checkExitsPhoneNumber(param) > 0){
                result.put("existPhone", "true");
            }
            else if(getUserByUserName(param.get("userName").toString()) != null){
                result.put("existUserName", "true");
            }else{
                param.put("role","0");
                param.put("pwd",passwordEncoder.encode(param.get("password").toString()));
                userRepos.addUser(param);
                param.put("userId", userRepos.getLastInsert());
                result.put("success", userRepos.addUserCart(param));
            }

        }catch (Exception e){
            e.printStackTrace();
            result.put("error","error");
        }
        return result;
    }

    public Map<Object,Object> updateUser(Map param){
        Map<Object,Object> result = new HashMap<>();
        try{
            if(param.get("password") != null){
                param.put("pwd", passwordEncoder.encode(param.get("password").toString()));
            }
            param.put("birthDate", param.get("dob").toString() + " 00:00:00");
            result.put("success",userRepos.updateUser(param));

        }catch (Exception e){
            e.printStackTrace();
            result.put("error","error");
        }
        return result;
    }

    public Map<Object, Object> blockUser(Map param){
        Map<Object,Object> result = new HashMap<>();
        try {
            result.put("success", userRepos.blockUser(param));
        }catch (Exception e){
            e.printStackTrace();
            result.put("error", "error");
        }
        return result;
    }

    public Map<Object, Object> activeUser(Map param){
        Map<Object,Object> result = new HashMap<>();
        try {
            result.put("success", userRepos.activeUser(param));
        }catch (Exception e){
            e.printStackTrace();
            result.put("error", "error");
        }
        return result;
    }

}
