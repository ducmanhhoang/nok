package com.dm.nok.module.common.home.service.impl;
import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dm.nok.module.common.base.service.BaseVO;

@Repository(value = "homeMapper")
public class HomeMapper {
	
	@Autowired
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
	public BaseVO test() throws Exception {
		return sqlSession.selectOne("homeMapper.test");
	}
}
