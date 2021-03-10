package com.dm.nok.module.M000000.G000000.F000000.web;

import com.dm.nok.module.M000000.G000000.F000000.service.BaseVO;
import com.dm.nok.module.M000000.G000000.F000000.service.ResultListVO;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
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

    @ModelAttribute("langList")
    public List<Map<String, String>> getlangList() throws Exception {
        Locale inLocale = LocaleContextHolder.getLocale();

        List<Map<String, String>> resultList = new ArrayList<Map<String, String>>();

        List<Locale> locales = new ArrayList<Locale>();

        List<String> langCdList = new ArrayList<String>();
        langCdList.add("en");
        langCdList.add("vi");

        for (String lang : langCdList) {
            Locale locale = new Locale(lang);
            for (Locale item : Locale.getAvailableLocales()) {
                if (item.equals(locale)) {
                    locales.add(locale);
                }
            }
        }

        for (Locale locale : locales) {
            Map<String, String> row = new HashMap<String, String>();
            row.put("langCd", locale.getLanguage());
            row.put("langNm", locale.getDisplayLanguage(inLocale));
            resultList.add(row);
        }
        return resultList;
    }
}
