/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001400.F001411.service.impl;

import com.dm.nok.module.M000000.G000000.F000000.service.ResultVO;
import com.dm.nok.module.M000000.G001400.F001411.service.F001411CodeVO;
import java.util.List;

/**
 *
 * @author Hoang Duc Manh
 */
public interface F001411Mapper {
    /**
     * Select Code list
     * @param param
     * @return
     * @throws Exception 
     */
    public List<ResultVO> selectCodeList(F001411CodeVO param) throws Exception;
}
