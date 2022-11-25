package com.project.qlrl.services;

import com.project.qlrl.models.User;
import com.project.qlrl.repository.UserRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserService {
    @Autowired
    UserRepos userRepos;

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
}
