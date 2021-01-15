/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.common.auth.menu.service.impl;

import com.dm.nok.module.common.auth.menu.service.AuthMenuVO;
import com.dm.nok.module.common.base.service.BaseVO;
import java.util.List;

/**
 *
 * @author Hoang Duc Manh
 */
public interface AuthMenuMapper {
    /**
     * Select Authentication Menu Tree list
     * @param param
     * @return
     * @throws Exception 
     */
    public List<AuthMenuVO> selectAuthMenuTreeList(AuthMenuVO param) throws Exception;
    
    /**
     * Select Authentication Menu Tab list
     * @param param
     * @return
     * @throws Exception 
     */
    public List<BaseVO> selectAuthMenuTabList(AuthMenuVO param) throws Exception;
}
