/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001200.F001211.service.impl;

import com.dm.nok.module.M000000.G000000.F000000.service.ResultVO;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211CodeGroupLangVO;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211CodeGroupVO;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211CodeVO;
import java.util.List;

/**
 *
 * @author Hoang Duc Manh
 */
public interface F001211Mapper {
    /**
     * Select Code list
     * @param param
     * @return
     * @throws Exception 
     */
    public List<ResultVO> selectCodeList(F001211CodeVO param) throws Exception;
    
    /**
     * Select Code group list
     * @param sql
     * @return
     * @throws Exception 
     */
    public List<ResultVO> selectCodeGroupList(String sql) throws Exception;
    
    /**
     * Select Code group ID existed
     * @param param
     * @return
     * @throws Exception 
     */
    public List<ResultVO> selectCodeGroupIdExisted(F001211CodeGroupVO param) throws Exception;
    
    /**
     * Insert Code group
     * @param param
     * @return
     * @throws Exception 
     */
    public int insertCodeGroup(F001211CodeGroupVO param) throws Exception;
    
    /**
     * Update Code group
     * @param param
     * @return
     * @throws Exception 
     */
    public int updateCodeGroup(F001211CodeGroupVO param) throws Exception;
    
    /**
     * Delete Code group
     * @param param
     * @return
     * @throws Exception 
     */
    public int deleteCodeGroup(F001211CodeGroupVO param) throws Exception;
    
    /**
     * Merge Code group lang
     * @param param
     * @return
     * @throws Exception 
     */
    public int mergeCodeGroupLang(F001211CodeGroupLangVO param) throws Exception;
    
    /**
     * Delete Code group lang
     * @param param
     * @return
     * @throws Exception 
     */
    public int deleteCodeGroupLang(F001211CodeGroupLangVO param) throws Exception;
    
    /**
     * Select Code list
     * @param sql
     * @return
     * @throws Exception 
     */
    public List<ResultVO> selectCodeList2(String sql) throws Exception;
}
