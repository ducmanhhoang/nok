package com.dm.nok.module.M000000.G000000.F000000.service.impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class DateUtil {

    /**
     * Getting current date in the pattern yyyy-MM-dd
     * @return 
     */
    public static String getDatePattern() {
        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        return sd.format(date);
    }

    /**
     * Getting date in a specified pattern
     * @param pattern
     * @return 
     */
    public static String getDate(String pattern) {
        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat sd = new SimpleDateFormat(pattern);
        return sd.format(date);
    }

    /**
     * Convert date pattern YYYYMMDD with a Separator type
     * @param dateTime
     * @param type
     * @return 
     */
    public static String getDateYYYYMMDD(String dateTime, String type) {
        if (dateTime != null && !dateTime.equals("") && !dateTime.equals("99991231")) {
            String year = dateTime.substring(0, 4);
            String month = dateTime.substring(4, 6);
            String day = dateTime.substring(6, 8);
            return year + type + month + type + day;
        } else {
            return "";
        }
    }

    /**
     * Convert time pattern HHmmss with a Separator type
     * @param src
     * @param type
     * @return 
     */
    public static String getTimeHHmmss(String src, String type) {
        if (src == null || src.equals("")) {
            return "";
        } else {
            return src.substring(0, 2) + type + src.substring(2, 4) + type + src.substring(4);
        }
    }

    /**
     * Convert time pattern HHmm with a Separator type
     * @param src
     * @param type
     * @return 
     */
    public static String getTimeHHmm(String src, String type) {
        if (src == null || src.equals("") || src.equals("9999")) {
            return "";
        } else {
            return src.substring(0, 2) + type + src.substring(2, 4);
        }
    }
    
    /**
     * Get TIMESTAMP in String format
     *
     * @param
     * @return Timestamp 값
     * @exception MyException
     * @see
     */
    public static String getTimeStamp() {
        String rtnStr = null;
        String pattern = "yyyyMMddhhmmssSSS";

        try {
            SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.US);
            Timestamp ts = new Timestamp(System.currentTimeMillis());

            rtnStr = sdfCurrent.format(ts.getTime());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rtnStr;
    }
}
