/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.common.auth.menu.service;

import com.dm.nok.module.common.base.service.BaseSaveVO;
import java.util.List;

/**
 *
 * @author Hoang Duc Manh
 */
public class AuthMenuVO extends BaseSaveVO {
    private String menuId;
    private String menuDesc;
    private String upMenuId;
    private String systemId;
    
    private int level;
    private String url;
    private String label;
    private List<AuthMenuVO> cn;

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId;
    }

    public String getMenuDesc() {
        return menuDesc;
    }

    public void setMenuDesc(String menuDesc) {
        this.menuDesc = menuDesc;
    }

    public String getUpMenuId() {
        return upMenuId;
    }

    public void setUpMenuId(String upMenuId) {
        this.upMenuId = upMenuId;
    }

    public String getSystemId() {
        return systemId;
    }

    public void setSystemId(String systemId) {
        this.systemId = systemId;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public List<AuthMenuVO> getCn() {
        return cn;
    }

    public void setCn(List<AuthMenuVO> cn) {
        this.cn = cn;
    }
}
