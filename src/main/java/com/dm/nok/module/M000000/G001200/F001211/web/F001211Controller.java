/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001200.F001211.web;

import com.dm.nok.module.M000000.G000000.F000000.service.ResultListVO;
import com.dm.nok.module.M000000.G000000.F000000.web.BaseController;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211CodeVO;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211Service;
import java.io.IOException;
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
@RequestMapping(value = "/M000000/G001200/")
public class F001211Controller extends BaseController {
    
    @Autowired
    @Resource(name = "f001211Service")
    private F001211Service f001211Service;
    
    @RequestMapping(value = "F001211.do")
    public String loadF001211() throws Exception {
        return "/module/M000000/G001200/F001211";
    }
    
    @ResponseBody
    @RequestMapping(value = "/F001211/selectCodeList.do")
    public ResultListVO selectCodeList(F001211CodeVO param, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()) {
            throw new IOException(bindingResult.getGlobalError().getDefaultMessage());
        }
        
        return this.addResult(f001211Service.selectCodeList(bindAuditData(param)));
    }
}
