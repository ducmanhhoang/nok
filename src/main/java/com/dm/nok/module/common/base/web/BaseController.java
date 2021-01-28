package com.dm.nok.module.common.base.web;

import com.dm.nok.module.common.base.service.BaseVO;
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
}
