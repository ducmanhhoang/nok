/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.common.auth.menu.service.impl;

import com.dm.nok.module.common.auth.menu.service.AuthMenuService;
import com.dm.nok.module.common.auth.menu.service.AuthMenuVO;
import com.dm.nok.module.common.base.service.BaseVO;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 *
 * @author Hoang Duc Manh
 */
@Service(value = "authMenuService")
public class AuthMenuServiceImpl implements AuthMenuService {

    @Autowired
    @Resource(name = "authMenuMapper")
    private AuthMenuMapper authMenuMapper;

    public List<AuthMenuVO> selectAuthMenuTopList(AuthMenuVO param) throws Exception {
        List<AuthMenuVO> authMenuTreeList = authMenuMapper.selectAuthMenuTreeList(param);
        List<AuthMenuVO> authMenuModuleList = new ArrayList<AuthMenuVO>();
        List<AuthMenuVO> authMenuGroupAllList = new ArrayList<AuthMenuVO>();
        List<AuthMenuVO> authMenuFunctionAllList = new ArrayList<AuthMenuVO>();

        for (AuthMenuVO item : authMenuTreeList) {
            item.setUrl("javascript:pageObj.goLink('" + item.getUrl() + ".do');");
            if (item.getLevel() == 1) {
                authMenuModuleList.add(item);
            }
            if (item.getLevel() == 2) {
                authMenuGroupAllList.add(item);
            }
            if (item.getLevel() == 3) {
                authMenuFunctionAllList.add(item);
            }
        }

        for (AuthMenuVO item : authMenuModuleList) {
            List<AuthMenuVO> authMenuGroupList = new ArrayList<AuthMenuVO>();
            for (AuthMenuVO item2 : authMenuGroupAllList) {
                if (item.getMenuId().equals(item2.getUpMenuId())) {
                    authMenuGroupList.add(item2);
                }
                List<AuthMenuVO> authMenuFunctionList = new ArrayList<AuthMenuVO>();
                for (AuthMenuVO item3 : authMenuFunctionAllList) {
                    if (item2.getMenuId().equals(item3.getUpMenuId())) {
                        authMenuFunctionList.add(item3);
                    }
                }
                //item2.setCn(authMenuFunctionList);
                if (!authMenuFunctionList.isEmpty()) {
                    item2.setUrl(authMenuFunctionList.get(0).getUrl());
                }
            }
            if (!authMenuGroupList.isEmpty()) {
                item.setUrl(authMenuGroupList.get(0).getUrl());
            }
            item.setCn(authMenuGroupList);
        }

        return authMenuModuleList;
    }

    public List<BaseVO> selectAuthMenuTabList(AuthMenuVO amvo) throws Exception {
        return authMenuMapper.selectAuthMenuTabList(amvo);
    }
}
