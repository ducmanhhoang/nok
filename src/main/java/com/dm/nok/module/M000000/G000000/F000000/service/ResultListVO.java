/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G000000.F000000.service;

/**
 *
 * @author Hoang Duc Manh
 */
public class ResultListVO {
    private String msg;
    private Object list;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getList() {
        return list;
    }

    public void setList(Object list) {
        this.list = list;
    }
    
    public ResultListVO(Object list) {
        this.msg = "ok";
        this.list = list;
    }
}