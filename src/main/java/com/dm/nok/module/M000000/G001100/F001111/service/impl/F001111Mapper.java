/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001100.F001111.service.impl;

import com.dm.nok.module.M000000.G001100.F001111.service.F001111FileVO;
import com.dm.nok.module.M000000.G000000.F000000.service.ResultVO;
import java.util.List;

/**
 *
 * @author Hoang Duc Manh
 */
public interface F001111Mapper {
    /**
     * Select File list
     * @param param
     * @return
     * @throws Exception 
     */
    public List<ResultVO> selectFileList(F001111FileVO param) throws Exception;
    
    /**
     * Insert File
     * @param param
     * @return
     * @throws Exception 
     */
    public int insertFile(F001111FileVO param) throws Exception;
    
    /**
     * Select File sequence
     * @param param
     * @return
     * @throws Exception 
     */
    public int selectFileSeq(F001111FileVO param) throws Exception;
    
    /**
     * Delete File
     * @param param
     * @return
     * @throws Exception 
     */
    public int deleteFile(F001111FileVO param) throws Exception;
}
