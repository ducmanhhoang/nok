/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001100.F001111.service.impl;

import com.dm.nok.module.M000000.G001100.F001111.service.F001111FileVO;
import com.dm.nok.module.common.base.service.BaseVO;
import java.util.List;

/**
 *
 * @author Hoang Duc Manh
 */
public interface F001111Mapper {
    /**
     * Select File list
     * @param param
     * @return
     * @throws Exception 
     */
    public List<BaseVO> selectFileList(F001111FileVO param) throws Exception;
}
