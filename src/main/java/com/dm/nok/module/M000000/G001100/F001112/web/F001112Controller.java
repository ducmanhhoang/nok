/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001100.F001112.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Hoang Duc Manh
 */
@Controller
@RequestMapping(value = "/M000000/G001100/")
public class F001112Controller {
    
    @RequestMapping(value = "F001112.do")
    public String loadF001112() throws Exception {
        return "module/M000000/G001100/F001112";
    }
}
