/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G000000.F000013.service.impl;

import com.dm.nok.module.M000000.G000000.F000000.service.ResultVO;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author HOANG DUC MANH
 */
@Repository(value = "f000013Mapper1")
public class F000013Mapper1 {

    @Autowired
    @Resource(name = "sqlSession")
    private SqlSessionTemplate sqlSession;

    public ResultVO test() throws Exception {
        return sqlSession.selectOne("com.dm.nok.module.M000000.G000000.F000013.service.impl.F000013Mapper.test");
    }
}
