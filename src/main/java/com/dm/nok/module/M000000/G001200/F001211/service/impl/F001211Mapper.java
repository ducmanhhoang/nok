/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001200.F001211.service.impl;

import com.dm.nok.module.M000000.G000000.F000000.service.ResultVO;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211CodeVO;
import java.util.List;

/**
 *
 * @author Hoang Duc Manh
 */
public interface F001211Mapper {
    /**
     * Select Code list
     * @param param
     * @return
     * @throws Exception 
     */
    public List<ResultVO> selectCodeList(F001211CodeVO param) throws Exception;
}
