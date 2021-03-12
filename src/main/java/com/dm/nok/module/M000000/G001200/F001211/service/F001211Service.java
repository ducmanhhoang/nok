/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001200.F001211.service;

import com.dm.nok.module.M000000.G000000.F000000.service.ResultVO;
import java.util.List;

/**
 *
 * @author Hoang Duc Manh
 */
public interface F001211Service {
    /**
     * Select Code list
     * @param param
     * @return
     * @throws Exception 
     */
    public List<ResultVO> selectCodeList(F001211CodeVO param) throws Exception;
    
    /**
     * Select Code group list
     * @param param
     * @return
     * @throws Exception 
     */
    public List<ResultVO> selectCodeGroupList(F001211CodeGroupVO param) throws Exception;
    
    /**
     * Select Code group ID existed
     * @param param
     * @return
     * @throws Exception 
     */
    public List<ResultVO> selectCodeGroupIdExisted(F001211CodeGroupVO param) throws Exception;
    
    /**
     * Save Code group
     * @param param
     * @throws Exception 
     */
    public void saveCodeGroup(F001211CodeGroupVO param) throws Exception;
    
    /**
     * Save Code group lang
     * @param param
     * @throws Exception 
     */
    public void saveCodeGroupLang(F001211CodeGroupLangVO param) throws Exception;
    
    /**
     * Select Code list
     * @param param
     * @return
     * @throws Exception 
     */
    public List<ResultVO> selectCodeList2(F001211CodeVO param) throws Exception;
    
    /**
     * Save Code
     * @param param
     * @throws Exception 
     */
    public void saveCode(F001211CodeVO param) throws Exception;
    
    /**
     * Save Code lang
     * @param param
     * @throws Exception 
     */
    public void saveCodeLang(F001211CodeLangVO param) throws Exception;
}
