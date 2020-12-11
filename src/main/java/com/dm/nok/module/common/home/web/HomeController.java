package com.dm.nok.module.common.home.web;

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

import com.dm.nok.module.common.base.service.ResultVO;
import com.dm.nok.module.common.base.web.BaseController;
import com.dm.nok.module.common.home.service.HomeService;

@Controller
public class HomeController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    @Resource(name = "homeService")
    private HomeService homeService;

    @RequestMapping(value = {"default.do"})
    public String loadHome() throws Exception {
        logger.debug("Hello Logback");
        logger.trace("doStuff needed more information - {}", 4);
        logger.debug("doStuff needed to debug - {}", 4);
        logger.info("doStuff took input - {}", 4);
        logger.warn("doStuff needed to warn - {}", 4);
        logger.error("doStuff encountered an error with value - {}", 4);
        return "module/common/home";
    }

    @RequestMapping(value = "/test.do")
    public String loadTest() throws Exception {
        if (false) {
            throw new IOException("this is io exception");
        }
        return "module/common/hello";
    }

    @ResponseBody
    @RequestMapping(value = "/test2.json")
    public ResultVO loadTest2(@ModelAttribute("userForm") Object userForm, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()) {
            throw new IOException(bindingResult.getGlobalError().getDefaultMessage());
        }
        return addResult(homeService.hello());
    }

    @ResponseBody
    @RequestMapping(value = "/test3.json")
    public ResultVO loadTest3(@ModelAttribute("userForm") Object userForm, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()) {
            throw new IOException(bindingResult.getGlobalError().getDefaultMessage());
        }
        return addResult(homeService.hello2());
    }

    @RequestMapping(value = {"decorator.do"})
    public String loadDecorator() throws Exception {
        return "layout/decorator";
    }
}
