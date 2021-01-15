package com.dm.nok.module.common.exception.web;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

//@ControllerAdvice
public class ExceptionController {

    @ExceptionHandler(Exception.class)
    public ModelAndView exception(Exception e) {
        ModelAndView mav = new ModelAndView("module/common/error");
        mav.addObject("name", e.getClass().getSimpleName());
        mav.addObject("message", e.toString());
        return mav;
    }
}
