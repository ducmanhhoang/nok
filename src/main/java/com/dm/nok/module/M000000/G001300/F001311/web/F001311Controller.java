/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001300.F001311.web;

import com.dm.nok.module.M000000.G001300.F001311.service.F001311MenuVO;
import com.dm.nok.module.M000000.G000000.F000000.service.ResultVO;
import com.dm.nok.module.M000000.G000000.F000000.web.BaseController;
import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.dm.nok.module.M000000.G001300.F001311.service.F001311Service;

/**
 *
 * @author Hoang Duc Manh
 */
@Controller
@RequestMapping(value = "/M000000/G001300/")
public class F001311Controller extends BaseController {
    
    @Autowired
    @Resource(name = "f001311Service")
    private F001311Service f001311Service;
    
    @ResponseBody
    @RequestMapping(value = "F001311/selectAuthMenuTopList.json")
    public List<F001311MenuVO> selectAuthMenuTopList(F001311MenuVO param, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()) {
            throw new IOException(bindingResult.getGlobalError().getDefaultMessage());
        }
        return f001311Service.selectAuthMenuTopList(bindAuditData(param));
    }
    
    @ResponseBody
    @RequestMapping(value = "F001311/selectAuthMenuTabList.json")
    public List<ResultVO> selectAuthMenuTabList(F001311MenuVO param, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()) {
            throw new IOException(bindingResult.getGlobalError().getDefaultMessage());
        }
        return f001311Service.selectAuthMenuTabList(bindAuditData(param));
    }
}
