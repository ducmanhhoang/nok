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
public class F001211CodeGroupLangVO extends BaseVO {
    private String codeGroupId;
    private String langCd;
    private String codeGroupNm;

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

    public String getCodeGroupNm() {
        return codeGroupNm;
    }

    public void setCodeGroupNm(String codeGroupNm) {
        this.codeGroupNm = codeGroupNm;
    }
    
}
