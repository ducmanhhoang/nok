/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dm.nok.module.M000000.G001100.F001111.service;

import com.dm.nok.module.M000000.G000000.F000000.service.BaseVO;

/**
 *
 * @author Hoang Duc Manh
 */
public class F001111FileVO extends BaseVO {
    private int fileId;
    private int seq;
    private String name;
    private String type;
    private String saveName;
    private String fileSize;
    private String uploadedPath;
    private String thumbPath;

    public int getFileId() {
        return fileId;
    }

    public void setFileId(int fileId) {
        this.fileId = fileId;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSaveName() {
        return saveName;
    }

    public void setSaveName(String saveName) {
        this.saveName = saveName;
    }

    public String getFileSize() {
        return fileSize;
    }

    public void setFileSize(String fileSize) {
        this.fileSize = fileSize;
    }

    public String getUploadedPath() {
        return uploadedPath;
    }

    public void setUploadedPath(String uploadedPath) {
        this.uploadedPath = uploadedPath;
    }

    public String getThumbPath() {
        return thumbPath;
    }

    public void setThumbPath(String thumbPath) {
        this.thumbPath = thumbPath;
    }
}
