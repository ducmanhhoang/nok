/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.common.base.service;

/**
 *
 * @author Hoang Duc Manh
 */
public class BaseVO {
    private String langCd;
    private String systemId;
    private String menuId;
    
    private String insrtUserId;
    private String insrtDt;
    private String updtUserId;
    private String updtDt;
    
    private String _CUD;

    public String getLangCd() {
        return langCd;
    }

    public void setLangCd(String langCd) {
        this.langCd = langCd;
    }

    public String getSystemId() {
        return systemId;
    }

    public void setSystemId(String systemId) {
        this.systemId = systemId;
    }

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId;
    }

    public String getInsrtUserId() {
        return insrtUserId;
    }

    public void setInsrtUserId(String insrtUserId) {
        this.insrtUserId = insrtUserId;
    }

    public String getInsrtDt() {
        return insrtDt;
    }

    public void setInsrtDt(String insrtDt) {
        this.insrtDt = insrtDt;
    }

    public String getUpdtUserId() {
        return updtUserId;
    }

    public void setUpdtUserId(String updtUserId) {
        this.updtUserId = updtUserId;
    }

    public String getUpdtDt() {
        return updtDt;
    }

    public void setUpdtDt(String updtDt) {
        this.updtDt = updtDt;
    }

    public String getCUD() {
        return _CUD;
    }

    public void setCUD(String _CUD) {
        this._CUD = _CUD;
    }
}
