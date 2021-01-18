/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.common.auth.menu.web;

import com.dm.nok.module.common.auth.menu.service.AuthMenuService;
import com.dm.nok.module.common.auth.menu.service.AuthMenuVO;
import com.dm.nok.module.common.base.service.ResultVO;
import com.dm.nok.module.common.base.web.BaseController;
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
@RequestMapping(value = "/common/auth/")
public class AuthMenuController extends BaseController {
    
    @Autowired
    @Resource(name = "authMenuService")
    private AuthMenuService authMenuService;
    
    @ResponseBody
    @RequestMapping(value = "selectAuthMenuTopList.json")
    public ResultVO selectAuthMenuTopList(AuthMenuVO param, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()) {
            throw new IOException(bindingResult.getGlobalError().getDefaultMessage());
        }
        return addResult(authMenuService.selectAuthMenuTopList(bindAuditData(param)));
    }
    
    @ResponseBody
    @RequestMapping(value = "selectAuthMenuTabList.json")
    public ResultVO selectAuthMenuTabList(AuthMenuVO param, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()) {
            throw new IOException(bindingResult.getGlobalError().getDefaultMessage());
        }
        return addResult(authMenuService.selectAuthMenuTabList(bindAuditData(param)));
    }
}
