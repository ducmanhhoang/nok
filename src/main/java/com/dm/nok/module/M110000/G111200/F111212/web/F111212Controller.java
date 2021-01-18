/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M110000.G111200.F111212.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Hoang Duc Manh
 */
@Controller
@RequestMapping(value = "/M110000/G111200/")
public class F111212Controller {
    
    @RequestMapping(value = {"F111212.do"})
    public String loadF111212(Model model) throws Exception {
        return "module/M110000/G111200/F111212";
    }
}
