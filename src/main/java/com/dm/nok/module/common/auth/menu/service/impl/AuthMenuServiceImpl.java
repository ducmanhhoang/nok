/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.common.auth.menu.service.impl;

import com.dm.nok.module.common.auth.menu.service.AuthMenuService;
import com.dm.nok.module.common.auth.menu.service.AuthMenuVO;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Hoang Duc Manh
 */
@Service(value = "authMenuService")
public class AuthMenuServiceImpl implements AuthMenuService {
    
    @Autowired
    @Resource(name = "authMenuMapper")
    private AuthMenuMapper authMenuMapper;

    public List<AuthMenuVO> selectAuthMenuTreeList(AuthMenuVO param) throws Exception {
        List<AuthMenuVO> authMenuList = selectAuthMenuUpList(param);
        for (AuthMenuVO item: authMenuList) {
            item.setUpMenuId(item.getMenuId());
            item.setCn(authMenuMapper.selectAuthMenuList(item));
            item.setUpMenuId(0);
        }
        return authMenuList;
    }

    public List<AuthMenuVO> selectAuthMenuUpList(AuthMenuVO param) throws Exception {
        return authMenuMapper.selectAuthMenuUpList(param);
    }

    public List<AuthMenuVO> selectAuthMenuList(AuthMenuVO param) throws Exception {
        return authMenuMapper.selectAuthMenuList(param);
    }
}
