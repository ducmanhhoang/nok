/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001200.F001211.service;

import com.dm.nok.module.M000000.G000000.F000000.service.BaseVO;
import java.util.List;

/**
 *
 * @author Hoang Duc Manh
 */
public class F001211CodeGroupVO extends BaseVO {
    private String codeGroupId;
    private String useYn;
    private List<F001211CodeGroupLangVO> codeGroupLangList;

    public String getCodeGroupId() {
        return codeGroupId;
    }

    public void setCodeGroupId(String codeGroupId) {
        this.codeGroupId = codeGroupId;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    public List<F001211CodeGroupLangVO> getCodeGroupLangList() {
        return codeGroupLangList;
    }

    public void setCodeGroupLangList(List<F001211CodeGroupLangVO> codeGroupLangList) {
        this.codeGroupLangList = codeGroupLangList;
    }
}
