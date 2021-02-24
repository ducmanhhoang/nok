/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001400.F001411.web;

import com.dm.nok.module.M000000.G000000.F000000.service.ResultListVO;
import com.dm.nok.module.M000000.G000000.F000000.service.ResultVO;
import com.dm.nok.module.M000000.G000000.F000000.web.BaseController;
import com.dm.nok.module.M000000.G001400.F001411.service.F001411CodeVO;
import com.dm.nok.module.M000000.G001400.F001411.service.F001411Service;
import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Hoang Duc Manh
 */
@Controller
@RequestMapping(value = "/M000000/G001400/")
public class F001411Controller extends BaseController {
    
    @Autowired
    @Resource(name = "f001411Service")
    private F001411Service f001411Service;
    
    @ResponseBody
    @RequestMapping(value = "/F001411/selectCodeList.do")
    public ResultListVO selectCodeList(F001411CodeVO param, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()) {
            throw new IOException(bindingResult.getGlobalError().getDefaultMessage());
        }
        
        return this.addResult(f001411Service.selectCodeList(bindAuditData(param)));
    }
}
