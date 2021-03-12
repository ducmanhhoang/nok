/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001200.F001211.service;

import com.dm.nok.module.M000000.G000000.F000000.service.BaseVO;

/**
 *
 * @author Hoang Duc Manh
 */
public class F001211CodeLangVO extends BaseVO {
    private String codeId;
    private String codeGroupId;
    private String langCd;
    private String codeNm;

    public String getCodeId() {
        return codeId;
    }

    public void setCodeId(String codeId) {
        this.codeId = codeId;
    }

    public String getCodeGroupId() {
        return codeGroupId;
    }

    public void setCodeGroupId(String codeGroupId) {
        this.codeGroupId = codeGroupId;
    }

    public String getLangCd() {
        return langCd;
    }

    public void setLangCd(String langCd) {
        this.langCd = langCd;
    }

    public String getCodeNm() {
        return codeNm;
    }

    public void setCodeNm(String codeNm) {
        this.codeNm = codeNm;
    }
    
}
