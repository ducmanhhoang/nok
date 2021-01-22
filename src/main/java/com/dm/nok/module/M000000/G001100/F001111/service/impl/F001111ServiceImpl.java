/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001100.F001111.service.impl;

import com.dm.nok.module.M000000.G001100.F001111.service.F001111FileVO;
import com.dm.nok.module.M000000.G001100.F001111.service.F001111Service;
import com.dm.nok.module.M000000.G001200.F001211.service.impl.F001211DateUtil;
import com.dm.nok.module.M000000.G001200.F001211.service.impl.F001211DownloadViewUtil;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
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
    
    @Autowired
    @Resource(name = "f001211DownloadViewUtil")
    private F001211DownloadViewUtil f001211DownloadViewUtil;

    public F001111FileVO uploadFile(MultipartFile param) throws Exception {
        String rootDir = System.getProperty("catalina.home") + File.separator + applicationProperties.getProperty("FILE.DIR") + File.separator + System.getProperty("SERVER_MODE");
        // Creating directory
        String uploadedPath = rootDir + File.separator + F001211DateUtil.getDate(applicationProperties.getProperty("DATE.FORMAT"));
        File rootDirCheck = new File(uploadedPath);
        if (!rootDirCheck.exists()) {
            rootDirCheck.mkdirs();
        }

        // Set file property values
        F001111FileVO file = new F001111FileVO();
        file.setFileId(0);
        file.setName(param.getOriginalFilename());
        file.setType(param.getOriginalFilename().substring(param.getOriginalFilename().lastIndexOf(".") + 1));
        file.setSaveName(F001211DateUtil.getTimeStamp());
        file.setFileSize(String.valueOf(param.getSize()));
        file.setUploadedPath(uploadedPath);
        //file.setThumbUrl(file.getUploadedPath() + File.separator + file.getSaveName());
        file.setThumbUrl("/common/file/imgSrc.do");
        file.setThumbPath("/common/file/imgSrc.do");

        // Save file into the server disk
        if (!"".equals(param.getOriginalFilename())) {
            param.transferTo(new File(uploadedPath + File.separator + file.getSaveName()));
        }

        return file;
    }

    public F001111FileVO downloadFile(String name, String saveName) throws Exception {
        String rootDir = System.getProperty("catalina.home") + File.separator + applicationProperties.getProperty("FILE.DIR") + File.separator + System.getProperty("SERVER_MODE");
        F001111FileVO file = new F001111FileVO();
        String uploadedPath = rootDir + File.separator + saveName.substring(0, 8);
        file.setFileId(0);
        file.setName(name);
        file.setType(null);
        file.setSaveName(saveName);
        file.setFileSize(null);
        file.setUploadedPath(uploadedPath);
        file.setThumbUrl(null);
        file.setThumbPath(null);
        return file;
    }

    public List<F001111FileVO> selectFileList(F001111FileVO ffvo) throws Exception {
        List<F001111FileVO> fileList = new ArrayList<F001111FileVO>();
        for (int i = 0; i < 4; i ++) {
            ffvo.setId(i);
            fileList.add(ffvo);
        }
        return fileList;
    }
}
