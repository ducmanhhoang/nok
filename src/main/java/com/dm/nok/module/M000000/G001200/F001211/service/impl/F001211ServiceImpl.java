/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001200.F001211.service.impl;

import com.dm.nok.module.M000000.G000000.F000000.service.ResultVO;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211CodeGroupLangVO;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211CodeGroupVO;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211CodeLangVO;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211CodeVO;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dm.nok.module.M000000.G001200.F001211.service.F001211Service;

/**
 *
 * @author Hoang Duc Manh
 */
@Service(value = "f001211Service")
public class F001211ServiceImpl implements F001211Service {

    @Autowired
    @Resource(name = "f001211Mapper")
    private F001211Mapper f001211Mapper;

    @Override
    public List<ResultVO> selectCodeList(F001211CodeVO param) throws Exception {
        return f001211Mapper.selectCodeList(param);
    }

    @Override
    public List<ResultVO> selectCodeGroupList(F001211CodeGroupVO param) throws Exception {
        String sql = "SELECT\n"
                + "            ACG.CODE_GROUP_ID,\n"
                + "            ACG.USE_YN";
        int i = 0;
        for (F001211CodeGroupLangVO item : param.getCodeGroupLangList()) {
            sql = sql + ",\n            ACGL" + i + ".CODE_GROUP_NM AS " + item.getLangCd();
            i = i + 1;
        }

        sql = sql + "\n        FROM\n"
                + "            A_CODE_GROUP ACG\n";
        i = 0;
        for (F001211CodeGroupLangVO item : param.getCodeGroupLangList()) {
            sql = sql + "        LEFT JOIN A_CODE_GROUP_LANG ACGL" + i + " ON\n"
                    + "            ACG.CODE_GROUP_ID = ACGL" + i + ".CODE_GROUP_ID\n"
                    + "            AND ACGL" + i + ".LANG_CD = '" + item.getLangCd() + "'\n";
            i = i + 1;
        }

        return f001211Mapper.selectCodeGroupList(sql);
    }

    @Override
    public List<ResultVO> selectCodeGroupIdExisted(F001211CodeGroupVO param) throws Exception {
        return f001211Mapper.selectCodeGroupIdExisted(param);
    }

    @Override
    public void saveCodeGroup(F001211CodeGroupVO param) throws Exception {
        String cud = param.get_CUD();
        int count = 0;
        try {

            switch (cud) {
                case "C":
                    count = f001211Mapper.insertCodeGroup(param);
                    if (count == 0) {
                        throw new Exception("100001");
                    }
                    if (param.getCodeGroupLangList() != null) {
                        for (F001211CodeGroupLangVO item : param.getCodeGroupLangList()) {
                            saveCodeGroupLang(item);
                        }
                    }
                    break;
                case "U":
                    count = f001211Mapper.updateCodeGroup(param);
                    if (count == 0) {
                        throw new Exception("100001");
                    }
                    if (param.getCodeGroupLangList() != null) {
                        for (F001211CodeGroupLangVO item : param.getCodeGroupLangList()) {
                            saveCodeGroupLang(item);
                        }
                    }
                    break;
                case "D":
                    count = f001211Mapper.deleteCodeGroup(param);
                    if (count == 0) {
                        throw new Exception("100001");
                    }
                    if (param.getCodeGroupLangList() != null) {
                        for (F001211CodeGroupLangVO item : param.getCodeGroupLangList()) {
                            saveCodeGroupLang(item);
                        }
                    }
                    break;
                default:
                    throw new Exception("100001");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void saveCodeGroupLang(F001211CodeGroupLangVO param) throws Exception {
        String cud = param.get_CUD();
        int count = 0;
        try {

            switch (cud) {
                case "C":
                    count = f001211Mapper.mergeCodeGroupLang(param);
                    if (count == 0) {
                        throw new Exception("100001");
                    }
                    break;
                case "U":
                    count = f001211Mapper.mergeCodeGroupLang(param);
                    if (count == 0) {
                        throw new Exception("100001");
                    }
                    break;
                case "D":
                    count = f001211Mapper.deleteCodeGroupLang(param);
                    if (count == 0) {
                        throw new Exception("100001");
                    }
                    break;
                default:
                    throw new Exception("100001");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<ResultVO> selectCodeList2(F001211CodeVO param) throws Exception {
        String sql = "SELECT\n"
                + "	AC.CODE_ID,\n"
                + "	AC.CODE_GROUP_ID,\n"
                + "	AC.OPTION1,\n"
                + "	AC.OPTION2,\n"
                + "	AC.OPTION3,\n"
                + "	AC.SEQ";

        int i = 0;
        for (F001211CodeLangVO item : param.getCodeLangList()) {
            sql = sql + ",\n	ACL" + i + ".CODE_NM AS " + item.getLangCd();
            i = i + 1;
        }

        sql = sql + "\nFROM\n"
                + "	A_CODE AC";

        i = 0;
        for (F001211CodeLangVO item : param.getCodeLangList()) {
            sql = sql + "\nINNER JOIN A_CODE_LANG ACL" + i + " ON\n"
                    + "	AC.CODE_ID = ACL" + i + ".CODE_ID\n"
                    + "	AND AC.CODE_GROUP_ID = ACL" + i + ".CODE_GROUP_ID\n"
                    + "	AND ACL" + i + ".LANG_CD = '" + item.getLangCd() + "'";
            i = i + 1;
        }
        if (param.getCodeGroupId() != null)
            sql = sql + "\nWHERE AC.CODE_GROUP_ID = '" + param.getCodeGroupId() + "'";
        sql = sql + "\nORDER BY AC.SEQ";
        
        return f001211Mapper.selectCodeList2(sql);
    }
}
