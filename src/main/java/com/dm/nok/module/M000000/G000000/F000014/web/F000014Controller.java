/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G000000.F000014.web;

import com.dm.nok.module.M000000.G000000.F000000.web.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Hoang Duc Manh
 */
@Controller
@RequestMapping(value = "/")
public class F000014Controller extends BaseController {
    
    @RequestMapping(value = "login.do")
    public String loadF000014() throws Exception {
        return "/module/M000000/G000000/F000014";
    }
}
