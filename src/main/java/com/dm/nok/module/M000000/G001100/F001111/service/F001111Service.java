/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001100.F001111.service;

import com.dm.nok.module.M000000.G000000.F000000.service.ResultVO;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Hoang Duc Manh
 */
public interface F001111Service {
    /**
     * Uploading file
     * @param param
     * @return
     * @throws Exception 
     */
    public F001111FileVO uploadFile(MultipartFile param) throws Exception;
    
    /**
     * Download File
     * @param param
     * @return
     * @throws Exception 
     */
    public F001111FileVO downloadFile(String name, String saveName) throws Exception;
    
    /**
     * Select File list
     * @param param
     * @return
     * @throws Exception 
     */
    public List<ResultVO> selectFileList(F001111FileVO param) throws Exception;
    
    /**
     * Save File
     * @param param
     * @throws Exception 
     */
    public void saveFile(F001111FileVO param) throws Exception;
    
    /**
     * Delete File
     * @param param
     * @return
     * @throws Exception 
     */
    public F001111FileVO deleteFile(F001111FileVO param) throws Exception;
}
