package com.dm.nok.module.M000000.G000000.F000000.web;

import com.dm.nok.module.M000000.G000000.F000000.service.BaseVO;
import com.dm.nok.module.M000000.G000000.F000000.service.ResultListVO;
import java.util.Locale;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.bind.annotation.ModelAttribute;

public class BaseController {
    
    @ModelAttribute("langCd")
    public String getLangCd() throws Exception {
        Locale inLocale = LocaleContextHolder.getLocale();
        return inLocale.getLanguage();
    }
    
    public final <T extends BaseVO> T bindAuditData(T param) {
        Locale inLocale = LocaleContextHolder.getLocale();
        param.setLangCd(inLocale.getLanguage());
        param.setSystemId("EDU");
        return param;
    }
    
    public final ResultListVO addResult(Object list) {
        return new ResultListVO(list);
    }
}
