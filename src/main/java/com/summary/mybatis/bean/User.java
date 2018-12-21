package com.summary.mybatis.bean;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id;
    private String userName;
    private String nickName;
    private String password;
    private String phoneNumber;
    private String email;
    private Integer status;
    private String avatar;
    private String ipLogin;
    private Date dateLogin;
    private Date registerTime;

    public User() {}

    public User(Integer id, String userName, Date registerTime) {
        this.id = id;
        this.userName = userName;
        this.registerTime = registerTime;
    }

    public User(String userName, String nickName, String password,
                String phoneNumber, String email, Integer status,
                String avatar, String ipLogin, Date dateLogin,
                Date registerTime) {
        this.userName = userName;
        this.nickName = nickName;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.status = status;
        this.avatar = avatar;
        this.ipLogin = ipLogin;
        this.dateLogin = dateLogin;
        this.registerTime = registerTime;

    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getIpLogin() {
        return ipLogin;
    }

    public void setIpLogin(String ipLogin) {
        this.ipLogin = ipLogin;
    }

    public Date getDateLogin() {
        return dateLogin;
    }

    public void setDateLogin(Date dateLogin) {
        this.dateLogin = dateLogin;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", nickName='" + nickName + '\'' +
                ", password='" + password + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", email='" + email + '\'' +
                ", status=" + status +
                ", avatar='" + avatar + '\'' +
                ", ipLogin='" + ipLogin + '\'' +
                ", dateLogin=" + dateLogin +
                ", registerTime=" + registerTime +
                '}';
    }


    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }

        if (this.getClass() != obj.getClass()) {
            return false;
        }
        User user = (User) obj;

        if (this.userName != null && user.userName != null) {
            return this.userName.equals(user.userName);
        }

        return false;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        return prime * result + ((userName == null) ? 0 : userName.hashCode());
    }
}
