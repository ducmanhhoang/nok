/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001200.F001211.web;

import com.dm.nok.module.M000000.G000000.F000000.service.ResultListVO;
import com.dm.nok.module.M000000.G000000.F000000.web.BaseController;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211CodeGroupLangVO;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211CodeGroupListVO;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211CodeGroupVO;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211CodeLangVO;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211CodeVO;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211Service;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
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
    @RequestMapping(value = "F001211/selectCodeList.json")
    public ResultListVO selectCodeList(F001211CodeVO param, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()) {
            throw new IOException(bindingResult.getGlobalError().getDefaultMessage());
        }
        
        return this.addResult(f001211Service.selectCodeList(bindAuditData(param)));
    }
    
    
    @ResponseBody
    @RequestMapping(value = "F001211/selectCodeGroupList.do")
    public ResultListVO selectCodeGroupList(F001211CodeGroupVO param, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()) {
            throw new IOException(bindingResult.getGlobalError().getDefaultMessage());
        }
        
        List<F001211CodeGroupLangVO> codeGroupLangList = new ArrayList<F001211CodeGroupLangVO>();
        List<Map<String, String>> langList = this.getlangList();
        for(Map<String, String> item: langList) {
            F001211CodeGroupLangVO codeGroupLang = new F001211CodeGroupLangVO();
            codeGroupLang.setLangCd(item.get("langCd"));
            codeGroupLangList.add(codeGroupLang);
        }
        param.setCodeGroupLangList(codeGroupLangList);
        
        return this.addResult(f001211Service.selectCodeGroupList(bindAuditData(param)));
    }
    
    @ResponseBody
    @RequestMapping(value = "F001211/selectCodeGroupIdExisted.do")
    public ResultListVO selectCodeGroupIdExisted(@RequestBody F001211CodeGroupVO param, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()) {
            throw new IOException(bindingResult.getGlobalError().getDefaultMessage());
        }
        
        return this.addResult(f001211Service.selectCodeGroupIdExisted(bindAuditData(param)));
    }
    
    @ResponseBody
    @RequestMapping(value = "F001211/saveCodeGroup.do")
    public ResultListVO saveCodeGroup(@RequestBody F001211CodeGroupListVO param, BindingResult bindingResult) throws Exception {
        
        if (bindingResult.hasErrors()) {
            throw new IOException(bindingResult.getGlobalError().getDefaultMessage());
        }
        
        if (param.getCodeGroupList() != null)
            for (F001211CodeGroupVO item: param.getCodeGroupList()) {
                f001211Service.saveCodeGroup(bindAuditData(item));
            }
        
        return this.addResult(param);
    }
    
    @ResponseBody
    @RequestMapping(value = "F001211/selectCodeList2.do")
    public ResultListVO selectCodeList2(@RequestBody F001211CodeVO param, BindingResult bindingResult) throws Exception {
        
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@: " + param.getCodeGroupId());
        
        if (bindingResult.hasErrors()) {
            throw new IOException(bindingResult.getGlobalError().getDefaultMessage());
        }
        
        List<F001211CodeLangVO> codeLangList = new ArrayList<F001211CodeLangVO>();
        List<Map<String, String>> langList = this.getlangList();
        for(Map<String, String> item: langList) {
            F001211CodeLangVO codeLang = new F001211CodeLangVO();
            codeLang.setLangCd(item.get("langCd"));
            codeLangList.add(codeLang);
        }
        param.setCodeLangList(codeLangList);
        
        return this.addResult(f001211Service.selectCodeList2(bindAuditData(param)));
    }
}
