/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001100.F001111.service.impl;

import com.dm.nok.module.M000000.G001100.F001111.service.F001111FileVO;
import com.dm.nok.module.M000000.G001100.F001111.service.F001111Service;
import com.dm.nok.module.M000000.G001200.F001211.service.impl.F001211DateUtil;
import com.dm.nok.module.common.base.service.ResultVO;
import java.io.File;
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
    @Resource(name = "f001111Mapper")
    private F001111Mapper f001111Mapper;

    public F001111FileVO uploadFile(MultipartFile param) throws Exception {
        String rootDir = System.getProperty("catalina.home") + File.separator + applicationProperties.getProperty("FILE.DIR") + File.separator + System.getProperty("SERVER_MODE");
        String uploadedPath = rootDir + File.separator + F001211DateUtil.getDate(applicationProperties.getProperty("DATE.FORMAT"));
        
        // Set file property values
        F001111FileVO file = new F001111FileVO();
        file.setFileId(1);
        file.setSeq(f001111Mapper.selectFileSeq(file));
        file.setName(param.getOriginalFilename());
        file.setType(param.getOriginalFilename().substring(param.getOriginalFilename().lastIndexOf(".") + 1));
        file.setSaveName(F001211DateUtil.getTimeStamp());
        file.setFileSize(String.valueOf(param.getSize()));
        file.setUploadedPath("../../M000000/G001100/F001111/downloadFile.do?name=" + file.getName() + "&saveName=");
        file.setThumbPath("../../M000000/G001100/F001111/downloadFile.do?name=" + file.getName() + "&saveName=" + file.getSaveName());
        file.setCUD("C");
        saveFile(file);
        
        
        // Creating directory
        File rootDirCheck = new File(uploadedPath);
        if (!rootDirCheck.exists()) {
            rootDirCheck.mkdirs();
        }

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
        file.setThumbPath(null);
        return file;
    }

    public List<ResultVO> selectFileList(F001111FileVO ffvo) throws Exception {
        List<ResultVO> fileList = f001111Mapper.selectFileList(ffvo);
        /*
        for (int i = 0; i < 2; i ++) {
            ffvo = new F001111FileVO();
            ffvo.setFileId(0);
            ffvo.setSeq(i);
            ffvo.setName("MF_AX_" + i +".jpg");
            ffvo.setSaveName("MF_AX_" + i +".jpg");
            ffvo.setType(".jpg");
            ffvo.setFileSize("500");
            ffvo.setUploadedPath("/samples/AXUpload5/files/");
            ffvo.setThumbPath("../../M000000/G001100/F001111/downloadFile.do?name=20210127011242283&saveName=20210127011242283");
            fileList.add(ffvo);
        }*/
        return fileList;
    }

    public void saveFile(F001111FileVO param) throws Exception {
        String cud = param.getCUD();
        int count = 0;
        try {
            switch (cud) {
                case "C":
                    count = f001111Mapper.insertFile(param);
                    if (count == 0) {
                        throw new Exception(cud);
                    }
                    break;
                case "U":
                    count = 0;
                    if (count == 0) {
                        throw new Exception(cud);
                    }
                    break;
                case "D":
                    count = 0;
                    if (count == 0) {
                        throw new Exception(cud);
                    }
                    break;
                default:
                    throw new Exception(cud);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
