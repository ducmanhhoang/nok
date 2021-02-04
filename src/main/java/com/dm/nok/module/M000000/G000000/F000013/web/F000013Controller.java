package com.dm.nok.module.M000000.G000000.F000013.web;

import java.io.IOException;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.nok.module.M000000.G000000.F000000.service.ResultVO;
import com.dm.nok.module.M000000.G000000.F000000.web.BaseController;
import com.dm.nok.module.M000000.G000000.F000013.service.F000013Service;

@Controller
@RequestMapping(value = "/M000000/G000000/")
public class F000013Controller extends BaseController {

    private Logger logger = LoggerFactory.getLogger(F000013Controller.class);

    @Autowired
    @Resource(name = "f000013Service")
    private F000013Service f000013Service;
    
    @RequestMapping(value = {"F000013.do"})
    public String loadF000013() throws Exception {
        return "module/M000000/G000000/F000013";
    }

    @ResponseBody
    @RequestMapping(value = "F000013/test.json")
    public ResultVO test(@ModelAttribute("userForm") Object userForm, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()) {
            throw new IOException(bindingResult.getGlobalError().getDefaultMessage());
        }
        return f000013Service.test();
    }

    @ResponseBody
    @RequestMapping(value = "F000013/test1.json")
    public ResultVO test1(@ModelAttribute("userForm") Object userForm, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()) {
            throw new IOException(bindingResult.getGlobalError().getDefaultMessage());
        }
        return f000013Service.test1();
    }
    
    
}
