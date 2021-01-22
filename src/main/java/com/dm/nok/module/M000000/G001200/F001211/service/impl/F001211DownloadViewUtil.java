/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001200.F001211.service.impl;

import com.dm.nok.module.M000000.G001100.F001111.service.F001111FileVO;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

/**
 *
 * @author Hoang Duc Manh
 */
@Component("f001211DownloadViewUtil")
public class F001211DownloadViewUtil extends AbstractView {

    @Override
    protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest req, HttpServletResponse res) throws Exception {
        F001111FileVO file = (F001111FileVO) map.get("file");
        byte[] bytes = readFile(file.getUploadedPath(), file.getSaveName());

        res.setContentLength((int) bytes.length);
        res.setContentType("application/x-msdownload");
        if ("Firefox".equals(getBrowser(req))) {
            res.setHeader("Content-Disposition", "attachment; filename=\"" + new String(file.getName().getBytes("UTF-8"), "8859_1") + "\"");
        } else {
            res.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(file.getName(), "UTF-8") + "\"");
        }
        res.setHeader("Content-Transfer-Encoding", "binary");
        write(res, bytes);
    }

    private byte[] readFile(String uploadedPath, String saveName) throws IOException, Exception {
        File file = new File(uploadedPath + File.separator + saveName);
        BufferedInputStream bis = null;
        byte[] bytes = null;

        if (file.exists()) {
            bis = new BufferedInputStream(new FileInputStream(uploadedPath + File.separator + saveName));
            int length = bis.available();
            bytes = new byte[length];
            bis.read(bytes);
            bis.close();
        } else {
            throw new Exception("Sorry, File does not exist!");
        }
        return bytes;
    }

    private void write(HttpServletResponse res, byte[] bytes) throws IOException {
        OutputStream output = res.getOutputStream();
        output.write(bytes);
        output.flush();
    }

    private String getBrowser(HttpServletRequest request) {
        String header = request.getHeader("User-Agent");
        if (header.indexOf("MSIE") > -1) {
            return "MSIE";
        } else if (header.indexOf("Chrome") > -1) {
            return "Chrome";
        } else if (header.indexOf("Opera") > -1) {
            return "Opera";
        }
        return "Firefox";
    }

}
