/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.common.home.service.impl;

import com.dm.nok.module.common.base.service.ResultVO;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author HOANG DUC MANH
 */
@Repository(value = "homeMapper1")
public class HomeMapper1 {

    @Autowired
    @Resource(name = "sqlSession")
    private SqlSessionTemplate sqlSession;

    public ResultVO test() throws Exception {
        return sqlSession.selectOne("com.dm.nok.module.common.home.service.impl.HomeMapper.test");
    }
}
