/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001200.F001211.service.impl;

import com.dm.nok.module.M000000.G000000.F000000.service.ResultVO;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211CodeGroupVO;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211CodeVO;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211Service;

/**
 *
 * @author Hoang Duc Manh
 */
@Service(value = "f001211Service")
public class F001211ServiceImpl implements F001211Service {
    
    @Autowired
    @Resource(name = "f001211Mapper")
    private F001211Mapper f001211Mapper;
    

    @Override
    public List<ResultVO> selectCodeList(F001211CodeVO param) throws Exception {
        return f001211Mapper.selectCodeList(param);
    }

    @Override
    public List<ResultVO> selectCodeGroupList(F001211CodeGroupVO param) throws Exception {
        return f001211Mapper.selectCodeGroupList(param);
    }

    @Override
    public List<ResultVO> selectCodeGroupIdExisted(F001211CodeGroupVO param) throws Exception {
        return f001211Mapper.selectCodeGroupIdExisted(param);
    }
    
}
