package com.dm.nok.module.common.home.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dm.nok.module.common.base.service.BaseVO;
import com.dm.nok.module.common.home.service.HomeService;

@Service(value = "homeService")
public class HomeServiceImpl implements HomeService {
	
	@Autowired
	@Resource(name = "homeMapper")
	private HomeMapper homeMapper;

	@Override
	public BaseVO hello() throws Exception {
		// TODO Auto-generated method stub
		return homeMapper.test();
	}

}
