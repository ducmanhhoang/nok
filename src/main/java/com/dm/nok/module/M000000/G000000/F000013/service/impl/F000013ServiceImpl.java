package com.dm.nok.module.M000000.G000000.F000013.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dm.nok.module.M000000.G000000.F000000.service.ResultVO;
import com.dm.nok.module.M000000.G000000.F000013.service.F000013Service;

@Service(value = "f000013Service")
public class F000013ServiceImpl implements F000013Service {

    @Autowired
    @Resource(name = "f000013Mapper")
    private F000013Mapper f000013Mapper;

    @Autowired
    @Resource(name = "f000013Mapper1")
    private F000013Mapper1 f000013Mapper1;

    @Override
    public ResultVO test() throws Exception {
        return f000013Mapper.test();
    }

    @Override
    public ResultVO test1() throws Exception {
        return f000013Mapper1.test();
    }

}
