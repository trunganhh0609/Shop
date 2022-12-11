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

    int addUser(Map param);

    int updateUser(Map param);

    int blockUser(Map param);

    int activeUser(Map param);

    int checkExitsPhoneNumber(Map param);

    int addUserCart(Map param);

    int getLastInsert();

    int deleteUserCart(Map param);

    int deleteCartDetail(Map param);
}
