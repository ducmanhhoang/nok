package com.dm.nok.module.common.home.web;

import java.io.IOException;

import javax.annotation.Resource;

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
	
	@Autowired
	@Resource(name = "homeService")
	private HomeService homeService;

	@RequestMapping(value = {"default.do"})
	public String loadHome() throws Exception {
		return "module/common/home";
	}
	
	@RequestMapping(value = "/test.do")
	public String loadTest() throws Exception {
		if(false) {
			throw new IOException("this is io exception");
		}
		return "module/common/hello";
	}
	
	@ResponseBody
	@RequestMapping(value = "/test2.do")
	public ResultVO loadTest2(@ModelAttribute("userForm") Object userForm, BindingResult bindingResult) throws Exception {
		if (bindingResult.hasErrors()) {
			throw new IOException(bindingResult.getGlobalError().getDefaultMessage());
		}
		return addResult(homeService.hello());
	}
	
	@RequestMapping(value = {"decorator.do"})
	public String loadDecorator() throws Exception {
		return "layout/decorator";
	}
}
