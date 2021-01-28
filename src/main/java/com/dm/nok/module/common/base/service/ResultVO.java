package com.dm.nok.module.common.base.service;

import org.apache.commons.collections.map.ListOrderedMap;

public class ResultVO extends ListOrderedMap {

    private static final long serialVersionUID = 1L;

    @Override
    public Object put(Object key, Object value) {
        return super.put(convert2CamelCase((String) key), value);
    }

    public String convert2CamelCase(String underScore) {
        if (underScore.indexOf('_') < 0 && Character.isLowerCase(underScore.charAt(0))) {
            return underScore;
        }
        StringBuilder result = new StringBuilder();
        boolean nextUpper = false;
        int len = underScore.length();

        for (int i = 0; i < len; i++) {
            char currentChar = underScore.charAt(i);
            if (currentChar == '_') {
                nextUpper = true;
            } else {
                if (nextUpper) {
                    result.append(Character.toUpperCase(currentChar));
                    nextUpper = false;
                } else {
                    result.append(Character.toLowerCase(currentChar));
                }
            }
        }
        return result.toString();
    }
}
