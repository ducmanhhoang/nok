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
public interface AuthMenuService {
    /**
     * Select Authentication Menu list
     * @return
     * @throws Exception 
     */
    public List<AuthMenuVO> selectAuthMenuTreeList(AuthMenuVO param) throws Exception;
    
    /**
     * Select Authentication Menu Up list
     * @param param
     * @return
     * @throws Exception 
     */
    public List<AuthMenuVO> selectAuthMenuUpList(AuthMenuVO param) throws Exception;
    
    /**
     * Select Authentication Menu list
     * @return
     * @throws Exception 
     */
    public List<AuthMenuVO> selectAuthMenuList(AuthMenuVO param) throws Exception;
}
