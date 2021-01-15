package com.dm.nok.module.common.base.web;

import com.dm.nok.module.common.base.service.ResultVO;
import java.util.Locale;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.bind.annotation.ModelAttribute;

public class BaseController {

    public final ResultVO addResult(Object data) {
        return new ResultVO(data);
    }

    public final ResultVO addResult(Exception e) {
        return new ResultVO(true, e.getMessage());
    }
    
    @ModelAttribute("langCd")
    public String getLangCd() throws Exception {
        Locale inLocale = LocaleContextHolder.getLocale();
        return inLocale.getLanguage();
    }
}
