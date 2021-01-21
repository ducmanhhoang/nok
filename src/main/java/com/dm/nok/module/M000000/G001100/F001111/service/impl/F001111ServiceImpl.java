/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001100.F001111.service.impl;

import com.dm.nok.module.M000000.G001100.F001111.service.F001111FileVO;
import com.dm.nok.module.M000000.G001100.F001111.service.F001111Service;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211DateUtil;
import java.io.File;
import java.util.Properties;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Hoang Duc Manh
 */
@Service(value = "f001111Service")
public class F001111ServiceImpl implements F001111Service {
    
    private Logger logger = LoggerFactory.getLogger(F001111ServiceImpl.class);

    @Autowired
    @Resource(name = "applicationProperties")
    private Properties applicationProperties;

    public F001111FileVO uploadFile(MultipartFile param) throws Exception {
        // Creating directory
        String rootDir = System.getProperty("catalina.home") + File.separator + applicationProperties.getProperty("FILE.DIR") + File.separator + System.getProperty("SERVER_MODE");
        rootDir = rootDir + File.separator + F001211DateUtil.getDate(applicationProperties.getProperty("DATE.FORMAT"));
        File rootDirCheck = new File(rootDir);
        if (!rootDirCheck.exists()) {
            rootDirCheck.mkdirs();
        }

        // Set file property values
        F001111FileVO file = new F001111FileVO();
        file.setFileId(0);
        file.setName(param.getOriginalFilename());
        file.setType(param.getOriginalFilename().substring(param.getOriginalFilename().lastIndexOf(".") + 1));
        file.setSaveName(F001211DateUtil.getTimeStamp());
        file.setFileSize(param.getSize());
        file.setUploadedPath(rootDir);
        file.setThumbUrl(file.getUploadedPath() + File.separator + file.getSaveName());

        // Save file into the server disk
        if (!"".equals(param.getOriginalFilename())) {
            param.transferTo(new File(rootDir + File.separator + file.getSaveName()));
        }

        return file;
    }

}
