package com.project.qlrl.models;
public class User {
    long USER_ID;
    String USER_NAME;
    String FULL_NAME;
    String EMAIL;
    String PHONE_NUMBER;
    String PASSWORD;
    String ROLE;

    public User() {
    }

    public User(long USER_ID, String USER_NAME, String FULL_NAME, String EMAIL, String PHONE_NUMBER, String PASSWORD, String ROLE) {
        this.USER_ID = USER_ID;
        this.USER_NAME = USER_NAME;
        this.FULL_NAME = FULL_NAME;
        this.EMAIL = EMAIL;
        this.PHONE_NUMBER = PHONE_NUMBER;
        this.PASSWORD = PASSWORD;
        this.ROLE = ROLE;
    }

    public long getUSER_ID() {
        return USER_ID;
    }

    public void setUSER_ID(long USER_ID) {
        this.USER_ID = USER_ID;
    }

    public String getUSER_NAME() {
        return USER_NAME;
    }

    public void setUSER_NAME(String USER_NAME) {
        this.USER_NAME = USER_NAME;
    }

    public String getFULL_NAME() {
        return FULL_NAME;
    }

    public void setFULL_NAME(String FULL_NAME) {
        this.FULL_NAME = FULL_NAME;
    }

    public String getEMAIL() {
        return EMAIL;
    }

    public void setEMAIL(String EMAIL) {
        this.EMAIL = EMAIL;
    }

    public String getPHONE_NUMBER() {
        return PHONE_NUMBER;
    }

    public void setPHONE_NUMBER(String PHONE_NUMBER) {
        this.PHONE_NUMBER = PHONE_NUMBER;
    }

    public String getPASSWORD() {
        return PASSWORD;
    }

    public void setPASSWORD(String PASSWORD) {
        this.PASSWORD = PASSWORD;
    }

    public String getROLE() {
        return ROLE;
    }

    public void setROLE(String ROLE) {
        this.ROLE = ROLE;
    }
}
