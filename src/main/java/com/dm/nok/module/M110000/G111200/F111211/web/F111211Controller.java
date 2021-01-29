/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M110000.G111200.F111211.web;

import com.dm.nok.module.M000000.G000000.F000000.web.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Hoang Duc Manh
 */
@Controller
@RequestMapping(value = "/M110000/G111200/")
public class F111211Controller extends BaseController {
    
    @RequestMapping(value = {"F111211.do"})
    public String loadF111211(Model model) throws Exception {
        return "module/M110000/G111200/F111211";
    }
}
