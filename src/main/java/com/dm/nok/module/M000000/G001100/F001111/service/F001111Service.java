/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001100.F001111.service;

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
}
