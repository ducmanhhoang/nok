/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001300.F001311.service.impl;

import com.dm.nok.module.M000000.G001300.F001311.service.F001311MenuVO;
import com.dm.nok.module.M000000.G000000.F000000.service.ResultVO;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dm.nok.module.M000000.G001300.F001311.service.F001311Service;

/**
 *
 * @author Hoang Duc Manh
 */
@Service(value = "f001311Service")
public class F001311ServiceImpl implements F001311Service {

    @Autowired
    @Resource(name = "f001311Mapper")
    private F001311Mapper f001311Mapper;

    public List<F001311MenuVO> selectAuthMenuTopList(F001311MenuVO param) throws Exception {
        List<F001311MenuVO> authMenuTreeList = f001311Mapper.selectAuthMenuTreeList(param);
        List<F001311MenuVO> authMenuModuleList = new ArrayList<F001311MenuVO>();
        List<F001311MenuVO> authMenuGroupAllList = new ArrayList<F001311MenuVO>();
        List<F001311MenuVO> authMenuFunctionAllList = new ArrayList<F001311MenuVO>();

        for (F001311MenuVO item : authMenuTreeList) {
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

        for (F001311MenuVO item : authMenuModuleList) {
            List<F001311MenuVO> authMenuGroupList = new ArrayList<F001311MenuVO>();
            for (F001311MenuVO item2 : authMenuGroupAllList) {
                if (item.getMenuId().equals(item2.getUpMenuId())) {
                    authMenuGroupList.add(item2);
                }
                List<F001311MenuVO> authMenuFunctionList = new ArrayList<F001311MenuVO>();
                for (F001311MenuVO item3 : authMenuFunctionAllList) {
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

    public List<ResultVO> selectAuthMenuTabList(F001311MenuVO amvo) throws Exception {
        return f001311Mapper.selectAuthMenuTabList(amvo);
    }
}
