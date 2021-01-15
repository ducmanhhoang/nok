/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.common.auth.menu.service;

import java.util.List;

/**
 *
 * @author Hoang Duc Manh
 */
public class AuthMenuVO {
    private int menuId;
    private String label;
    private int upMenuId;
    private String url;
    private String systemId;
    private List<AuthMenuVO> cn;

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public int getUpMenuId() {
        return upMenuId;
    }

    public void setUpMenuId(int upMenuId) {
        this.upMenuId = upMenuId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getSystemId() {
        return systemId;
    }

    public void setSystemId(String systemId) {
        this.systemId = systemId;
    }

    public List<AuthMenuVO> getCn() {
        return cn;
    }

    public void setCn(List<AuthMenuVO> cn) {
        this.cn = cn;
    }
}
