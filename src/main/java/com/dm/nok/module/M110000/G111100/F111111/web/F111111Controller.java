/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M110000.G111100.F111111.web;

import com.dm.nok.module.M000000.G000000.F000000.web.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Hoang Duc Manh
 */
@Controller
@RequestMapping(value = "/M110000/G111100/")
public class F111111Controller extends BaseController {
    
    @RequestMapping(value = {"F111111.do"})
    public String loadF111111(Model model) throws Exception {
        return "module/M110000/G111100/F111111";
    }
}
