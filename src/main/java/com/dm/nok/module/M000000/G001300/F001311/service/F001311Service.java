/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001300.F001311.service;

import com.dm.nok.module.M000000.G000000.F000000.service.ResultVO;
import java.util.List;

/**
 *
 * @author Hoang Duc Manh
 */
public interface F001311Service {
    /**
     * Select Authentication Menu list
     * @return
     * @throws Exception 
     */
    public List<F001311MenuVO> selectAuthMenuTopList(F001311MenuVO param) throws Exception;
    
    /**
     * Select Authentication Menu Tab list
     * @param param
     * @return
     * @throws Exception 
     */
    public List<ResultVO> selectAuthMenuTabList(F001311MenuVO param) throws Exception;
}
