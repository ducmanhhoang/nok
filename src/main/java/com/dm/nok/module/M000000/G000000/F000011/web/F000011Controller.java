/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G000000.F000011.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author HOANG DUC MANH
 */
@Controller
@RequestMapping("/M000000/G000000/")
public class F000011Controller {
    
    @RequestMapping(value = {"F000011.do"})
    public String loadF000011() throws Exception {
        return "module/M000000/G000000/F000011";
    }
}
