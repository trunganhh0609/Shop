package com.project.qlrl.models;
public class User {
    long USER_ID;
    String USER_NAME;
    String PASSWORD;
    String ROLE_ID;

    public User() {
    }

    public User(long id, String userName, String password, String role) {
        this.USER_ID = id;
        this.USER_NAME = userName;
        this.PASSWORD = password;
        this.ROLE_ID = role;
    }

    public long getId() {
        return USER_ID;
    }

    public void setId(long id) {
        this.USER_ID = id;
    }

    public String getUserName() {
        return USER_NAME;
    }

    public void setUserName(String userName) {
        this.USER_NAME = userName;
    }

    public String getPassword() {
        return PASSWORD;
    }

    public void setPassword(String password) {
        this.PASSWORD = password;
    }

    public String getRole() {
        return ROLE_ID;
    }

    public void setRole(String role) {
        this.ROLE_ID = role;
    }
}
