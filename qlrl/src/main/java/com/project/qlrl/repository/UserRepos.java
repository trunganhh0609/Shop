package com.project.qlrl.repository;

import com.project.qlrl.models.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper

public interface UserRepos {
    User getUserByUserName(String param);
    List<Map> getAllUser();
    Map getUserRole(Map param);

    Map getUserInfo(Map param);
}
