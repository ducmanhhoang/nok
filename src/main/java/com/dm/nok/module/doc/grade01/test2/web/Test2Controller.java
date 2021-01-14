/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.doc.grade01.test2.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Hoang Duc Manh
 */
@Controller
@RequestMapping(value = "/doc/grade01/")
public class Test2Controller {
    
    
    @RequestMapping(value = {"test2.do"})
    public String loadTest2() throws Exception {
        return "module/doc/grade01/test2";
    }
}
