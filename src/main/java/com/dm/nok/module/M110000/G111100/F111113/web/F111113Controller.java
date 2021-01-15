/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M110000.G111100.F111113.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Hoang Duc Manh
 */
@Controller
@RequestMapping(value = "/M110000/G111100/")
public class F111113Controller {
    
    @RequestMapping(value = {"F111113.do"})
    public String loadF111113() throws Exception {
        return "module/M110000/G111100/F111113";
    }
}
