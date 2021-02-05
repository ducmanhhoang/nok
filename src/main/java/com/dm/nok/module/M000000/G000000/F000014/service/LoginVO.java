/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G000000.F000014.service;

/**
 *
 * @author Hoang Duc Manh
 */
public class LoginVO {
    private int userId;
    private int userGrpId;
    
    private String loginId;
    private String loginPwd;
    
    private String userFstNm;
    private String userMidNm;
    private String userLstNm;
    
    private String userNm;
    private String useLangCd;
    private String lstLoginDt;
    private String lstLoginIp;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getUserGrpId() {
        return userGrpId;
    }

    public void setUserGrpId(int userGrpId) {
        this.userGrpId = userGrpId;
    }

    public String getLoginId() {
        return loginId;
    }

    public void setLoginId(String loginId) {
        this.loginId = loginId;
    }

    public String getLoginPwd() {
        return loginPwd;
    }

    public void setLoginPwd(String loginPwd) {
        this.loginPwd = loginPwd;
    }

    public String getUserFstNm() {
        return userFstNm;
    }

    public void setUserFstNm(String userFstNm) {
        this.userFstNm = userFstNm;
    }

    public String getUserMidNm() {
        return userMidNm;
    }

    public void setUserMidNm(String userMidNm) {
        this.userMidNm = userMidNm;
    }

    public String getUserLstNm() {
        return userLstNm;
    }

    public void setUserLstNm(String userLstNm) {
        this.userLstNm = userLstNm;
    }

    public String getUserNm() {
        return userNm;
    }

    public void setUserNm(String userNm) {
        this.userNm = userNm;
    }

    public String getUseLangCd() {
        return useLangCd;
    }

    public void setUseLangCd(String useLangCd) {
        this.useLangCd = useLangCd;
    }

    public String getLstLoginDt() {
        return lstLoginDt;
    }

    public void setLstLoginDt(String lstLoginDt) {
        this.lstLoginDt = lstLoginDt;
    }

    public String getLstLoginIp() {
        return lstLoginIp;
    }

    public void setLstLoginIp(String lstLoginIp) {
        this.lstLoginIp = lstLoginIp;
    }
    
}
