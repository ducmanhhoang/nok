/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001100.F001111.web;

import com.dm.nok.module.M000000.G001100.F001111.service.F001111FileVO;
import com.dm.nok.module.M000000.G001100.F001111.service.F001111Service;
import com.dm.nok.module.M000000.G000000.F000000.service.impl.DownloadViewUtil;
import com.dm.nok.module.M000000.G000000.F000000.service.ResultVO;
import com.dm.nok.module.M000000.G000000.F000000.web.BaseController;
import java.util.List;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Hoang Duc Manh
 */
@Controller
@RequestMapping(value = "/M000000/G001100/")
public class F001111Controller extends BaseController {

    private Logger logger = LoggerFactory.getLogger(F001111Controller.class);
    
    @Autowired
    @Resource(name = "f001111Service")
    private F001111Service f001111Service;
    
    @Autowired
    @Resource(name = "downloadViewUtil")
    private DownloadViewUtil downloadViewUtil;

    @RequestMapping(value = {"F001111.do"})
    public String loadF001111(Model model) throws Exception {
        return "module/M000000/G001100/F001111";
    }

    @ResponseBody
    @RequestMapping(value = "F001111/uploadFile.do")
    public F001111FileVO uploadFile(@RequestParam("fileData") MultipartFile param) throws Exception {
        return f001111Service.uploadFile(param);
    }
    
    @ResponseBody
    @RequestMapping(value = "F001111/downloadFile.do")
    public DownloadViewUtil downloadFile(@RequestParam("name") String name, @RequestParam("saveName") String saveName, ModelMap modelMap) {
        try {
            modelMap.put("file", f001111Service.downloadFile(name, saveName));
        } catch (Exception e) {
        }
        return downloadViewUtil;
    }
    
    @ResponseBody
    @RequestMapping(value = "F001111/selectFileList.do")
    public List<ResultVO> selectFileList(@RequestBody F001111FileVO param) throws Exception {
        return f001111Service.selectFileList(param);
    }
    
    @ResponseBody
    @RequestMapping(value = "F001111/deleteFile.do")
    public F001111FileVO deleteFile(F001111FileVO param) throws Exception {
        return f001111Service.deleteFile(param);
    }
}
