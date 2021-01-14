/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.layout.decoration.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author HOANG DUC MANH
 */
@Controller
@RequestMapping("/layout/")
public class DecorationController {
    
    @RequestMapping(value = {"homeLayout.do"})
    public String loadHomeLayout() throws Exception {
        return "module/layout/homeLayout";
    }
    
    @RequestMapping(value = {"pageLayout.do"})
    public String loadPageLayout() throws Exception {
        return "module/layout/pageLayout";
    }
}
