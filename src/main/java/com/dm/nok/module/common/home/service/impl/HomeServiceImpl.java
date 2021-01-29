package com.dm.nok.module.common.home.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dm.nok.module.M000000.G000000.F000000.service.ResultVO;
import com.dm.nok.module.common.home.service.HomeService;

@Service(value = "homeService")
public class HomeServiceImpl implements HomeService {

    @Autowired
    @Resource(name = "homeMapper")
    private HomeMapper homeMapper;

    @Autowired
    @Resource(name = "homeMapper1")
    private HomeMapper1 homeMapper1;

    @Override
    public ResultVO hello() throws Exception {
        // TODO Auto-generated method stub
        return homeMapper.test();
    }

    public ResultVO hello2() throws Exception {
        return homeMapper1.test();
    }

}
