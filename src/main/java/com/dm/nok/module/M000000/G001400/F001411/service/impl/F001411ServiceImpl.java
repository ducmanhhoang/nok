/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001400.F001411.service.impl;

import com.dm.nok.module.M000000.G000000.F000000.service.ResultVO;
import com.dm.nok.module.M000000.G001400.F001411.service.F001411CodeVO;
import com.dm.nok.module.M000000.G001400.F001411.service.F001411Service;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Hoang Duc Manh
 */
@Service(value = "f001411Service")
public class F001411ServiceImpl implements F001411Service {
    
    @Autowired
    @Resource(name = "f001411Mapper")
    private F001411Mapper f001411Mapper;
    

    @Override
    public List<ResultVO> selectCodeList(F001411CodeVO param) throws Exception {
        return f001411Mapper.selectCodeList(param);
    }
    
}
