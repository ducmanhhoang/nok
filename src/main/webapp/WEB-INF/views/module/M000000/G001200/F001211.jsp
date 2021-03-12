<%-- 
    Document   : F001111
    Created on : Jan 21, 2021, 10:53:37 AM
    Author     : Hoang Duc Manh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Code Mng</title>
        <script id="jscode">
            /**
             * Require Files for AXISJ UI Component...
             * Based        : jQuery
             * Javascript    : AXJ.js, AXGrid.js, AXInput.js, AXSelect.js
             * CSS            : AXJ.css, AXGrid.css, AXButton.css, AXInput.css, AXSelect.css
             */
            var menuId = "F001211";
            var langCd = '${langCd}';
            var fnObj = {
                pageStart: function () {
                    fnObj.gridCode.bind();
                    fnObj.gridCodeGroup.bind();
                },
                gridCode: {
                    target: new AXGrid(),
                    bind: function () {
                        window.myGridCode = fnObj.gridCode.target;

                        myGridCode.setConfig({
                            targetID: "AXGridTargetCode",
                            theme: "AXGrid",
                            sort: false,
                            //fixedColSeq: 4,
                            //fitToWidth:true,
                            height: 300,
                            passiveMode: true,
                            colGroup: [
                                {key: "no", label: "No.", width: "50", align: "center", formatter: "checkbox"},
                                {
                                    key: "_CUD", label: "State", width: "50", align: "center"
                                },
                                {
                                    key: "codeId", label: "Code ID", width: "200",
                                    formatter: function (val) {
                                        if (Object.isObject(this.value)) {
                                            return this.value.codeNm;
                                        } else {
                                            return this.value;
                                        }
                                    },

                                    editor: {
                                        type: "text",
                                        disabled: function () {
                                            if (this.item._CUD == 'C') {
                                                return false;
                                            } else {
                                                return true;
                                            }
                                        },
                                        beforeUpdate: function (val) {
                                            //console.log(val);

                                            var valid = true;
                                            var url = "F001211/selectCodeGroupIdExisted.do";
                                            var param = {codeGroupId: val};

                                            new AXReq(url, {
                                                debug: false,
                                                async: false,
                                                pars: param,
                                                onsucc: function (res) {
                                                    if (res.result == AXUtil.ajaxOkCode) {
                                                        trace("requestOk");
                                                    } else {
                                                        trace(res);
                                                        if (!axf.isEmpty(res.list) && res.list.length != 0) {
                                                            valid = false;
                                                            toast.push({eatUpTime: 1000, body: '<b>Warning</b>\n Code Group ID is existed.', type: 'Warning'});
                                                        }
                                                    }
                                                },
                                                onerr: function (res) {
                                                    valid = false;
                                                    toast.push("onFail:" + req.responseText);
                                                }
                                            });

                                            if (valid)
                                                return val;
                                            else
                                                return "";
                                        },
                                        afterUpdate: function (val) {
                                            var _this = this;
                                            var pars = new Object();
                                            pars.codeGrpId = _this.item.codeGroupId;
                                            pars.code = val;
                                            //console.log(pars);
                                        },
                                        notEmpty: true,
                                        maxLength: 50,
                                        updateWith: ["_CUD"]
                                    }
                                },
                                <c:forEach var="result" items="${langList}" varStatus="status">
                                {
                                    key: "${result.langCd}", label: "${result.langNm}", width: "300",
                                    formatter: function () {
                                        return this.value;
                                    },
                                    editor: {
                                        type: "text",
                                        disabled: function () {
                                            return false;
                                        },
                                        beforeUpdate: function (val) {
                                            // 선택된 값은
                                            //console.log(val);
                                            return val;
                                        },
                                        afterUpdate: function (val) {
                                            var _this = this;
                                            var pars = new Object();
                                            pars.codeGrpId = _this.item.codeGrpId;
                                            pars.code = val;
                                            //console.log(pars);
                                        },
                                        notEmpty: true,
                                        maxLength: 50,
                                        updateWith: ["_CUD"]
                                    }
                                },
                                </c:forEach>
                                {
                                    key: "option1", label: "Option 1", width: "80",
                                    formatter: function () {
                                        return this.value;
                                    },
                                    editor: {
                                        type: "text",
                                        disabled: function () {
                                            return false;
                                        },
                                        beforeUpdate: function (val) {
                                            // 선택된 값은
                                            //console.log(val);
                                            return val;
                                        },
                                        afterUpdate: function (val) {
                                            var _this = this;
                                            var pars = new Object();
                                            pars.codeGrpId = _this.item.codeGrpId;
                                            pars.code = val;
                                            //console.log(pars);
                                        },
                                        //notEmpty: true,
                                        maxLength: 50,
                                        updateWith: ["_CUD"]
                                    }
                                },
                                {
                                    key: "option2", label: "Option 2", width: "80",
                                    formatter: function () {
                                        return this.value;
                                    },
                                    editor: {
                                        type: "text",
                                        disabled: function () {
                                            return false;
                                        },
                                        beforeUpdate: function (val) {
                                            // 선택된 값은
                                            //console.log(val);
                                            return val;
                                        },
                                        afterUpdate: function (val) {
                                            var _this = this;
                                            var pars = new Object();
                                            pars.codeGrpId = _this.item.codeGrpId;
                                            pars.code = val;
                                            //console.log(pars);
                                        },
                                        //notEmpty: true,
                                        maxLength: 50,
                                        updateWith: ["_CUD"]
                                    }
                                },
                                {
                                    key: "option3", label: "Option 3", width: "80",
                                    formatter: function () {
                                        return this.value;
                                    },
                                    editor: {
                                        type: "text",
                                        disabled: function () {
                                            return false;
                                        },
                                        beforeUpdate: function (val) {
                                            // 선택된 값은
                                            //console.log(val);
                                            return val;
                                        },
                                        afterUpdate: function (val) {
                                            var _this = this;
                                            var pars = new Object();
                                            pars.codeGrpId = _this.item.codeGrpId;
                                            pars.code = val;
                                            //console.log(pars);
                                        },
                                        //notEmpty: true,
                                        maxLength: 50,
                                        updateWith: ["_CUD"]
                                    }
                                },
                                {
                                    key: "seq", label: "Sequence", width: "80",
                                    formatter: function () {
                                        return this.value;
                                    },
                                    editor: {
                                        type: "number",
                                        disabled: function () {
                                            return false;
                                        },
                                        beforeUpdate: function (val) {
                                            // 선택된 값은
                                            //console.log(val);
                                            return val;
                                        },
                                        afterUpdate: function (val) {
                                            var _this = this;
                                            var pars = new Object();
                                            pars.codeGrpId = _this.item.codeGrpId;
                                            pars.code = val;
                                            //console.log(pars);
                                        },
                                        notEmpty: true,
                                        maxLength: 50,
                                        updateWith: ["_CUD"]
                                    }
                                }
                            ],
                            colHeadAlign: "center", // 헤드의 기본 정렬 값 ( colHeadAlign 을 지정하면 colGroup 에서 정의한 정렬이 무시되고 colHeadAlign : false 이거나 없으면 colGroup 에서 정의한 속성이 적용됩니다.
                            body: {
                                onclick: function () {
                                    //trace(this.index);
                                }
                            }
                            ,
                            page: {
                                paging: false
                            }
                        }
                        );

                        /*
                        myGridCode.setList({
                            ajaxUrl: "F001211/selectCodeList2.do",
                            ajaxPars: {},
                            onLoad: function () {
                                //trace(this);
                                //myGrid.setFocus(this.list.length - 1);
                            }
                        });
                         */
                        trace(myGridCode.getSortParam());

                    },
                    getExcel: function (type) {
                        var obj = myGridCode.getExcelFormat(type, function () {
                            return this.key != "no" && this.key != "finder";
                        });
                        $("#printout").html(obj);
                    }
                    ,
                    getSelectedItem: function () {
                        trace(this.target.getSelectedItem());
                        toast.push('콘솔창에 데이터를 출력하였습니다.');
                    }
                    ,
                    append: function () {
                        this.target.pushList(
                                {
                                    no: this.target.list.length,
                                    codeId: "",
                                    codeGroupId: fnObj.gridCodeGroup.getSelectedItem2().item.codeGroupId,
                                    option1: null,
                                    option2: null,
                                    option3: null,
                                    seq: 0
                                }
                        );
                        this.target.setFocus(this.target.list.length - 1);
                    }
                    ,
                    remove: function () {
                        var checkedList = myGridCode.getCheckedListWithIndex(0);// colSeq
                        if (checkedList.length == 0) {
                            alert("선택된 목록이 없습니다. 삭제하시려는 목록을 체크하세요");
                            return;
                        }
                        this.target.removeListIndex(checkedList);
                    },
                    save: function () {
                        var validator = myGridCode.validateCheck("C,U");
                        if (validator) {
                            var list = myGridCode.getList("C,U,D");
                            console.log(list);
                            
                            $.each(list, function(k, v) {
                                var codeLangList = [];
                                <c:forEach var="result" items="${langList}" varStatus="status">
                                    codeLangList.push({codeId: v.codeId, codeGroupId: v.codeGroupId, langCd: '${result.langCd}', codeNm: v['${result.langCd}'], _CUD: v._CUD});
                                </c:forEach>
                                v.codeLangList = codeLangList;
                            });
                            
                            var param = {codeList: list};
                            console.log(param);

                            var url = "F001211/saveCode.do";
                            new AXReq(url, {
                                debug: false,
                                async: false,
                                pars: param,
                                onsucc: function (res) {
                                    if (res.result == AXUtil.ajaxOkCode) {
                                        trace("requestOk");
                                    } else {
                                        trace(res);
                                        if (!axf.isEmpty(res.list) && res.list.length != 0) {
                                            myGridCode.reloadList();
                                            toast.push({eatUpTime: 1000, body: '<b>Complete</b>\n Complete saving.', type: 'Complete'});
                                        }
                                    }
                                },
                                onerr: function (res) {
                                    toast.push("onFail:" + req.responseText);
                                }
                            });
                        }
                    }
                },
                gridCodeGroup: {
                    target: new AXGrid(),
                    bind: function () {
                        window.myGridCodeGroup = fnObj.gridCodeGroup.target;

                        myGridCodeGroup.setConfig({
                            targetID: "AXGridTargetCodeGroup",
                            theme: "AXGrid",
                            sort: false,
                            //fixedColSeq: 2,
                            //fitToWidth:true,
                            height: 300,
                            passiveMode: true,
                            colGroup: [
                                {key: "no", label: "No.", width: "50", align: "center", formatter: "checkbox"},
                                {
                                    key: "_CUD", label: "State", width: "50", align: "center"
                                },
                                {
                                    key: "codeGroupId", label: "Code Group ID", width: "200",
                                    formatter: function (val) {
                                        if (Object.isObject(this.value)) {
                                            return this.value.codeGroupNm;
                                        } else {
                                            return this.value;
                                        }
                                    },

                                    editor: {
                                        type: "text",
                                        disabled: function () {
                                            if (this.item._CUD == 'C') {
                                                return false;
                                            } else {
                                                return true;
                                            }
                                        },
                                        beforeUpdate: function (val) {
                                            //console.log(val);

                                            var valid = true;
                                            var url = "F001211/selectCodeGroupIdExisted.do";
                                            var param = {codeGroupId: val};

                                            new AXReq(url, {
                                                debug: false,
                                                async: false,
                                                pars: param,
                                                onsucc: function (res) {
                                                    if (res.result == AXUtil.ajaxOkCode) {
                                                        trace("requestOk");
                                                    } else {
                                                        trace(res);
                                                        if (!axf.isEmpty(res.list) && res.list.length != 0) {
                                                            valid = false;
                                                            toast.push({eatUpTime: 1000, body: '<b>Warning</b>\n Code Group ID is existed.', type: 'Warning'});
                                                        }
                                                    }
                                                },
                                                onerr: function (res) {
                                                    valid = false;
                                                    toast.push("onFail:" + req.responseText);
                                                }
                                            });

                                            if (valid)
                                                return val;
                                            else
                                                return "";
                                        },
                                        afterUpdate: function (val) {
                                            var _this = this;
                                            var pars = new Object();
                                            pars.codeGrpId = _this.item.codeGroupId;
                                            pars.code = val;
                                            //console.log(pars);
                                        },
                                        notEmpty: true,
                                        maxLength: 50,
                                        updateWith: ["_CUD"]
                                    }
                                },
                                <c:forEach var="result" items="${langList}" varStatus="status">
                                {
                                    key: "${result.langCd}", label: "${result.langNm}", width: "300",
                                    formatter: function () {
                                        return this.value;
                                    },
                                    editor: {
                                        type: "text",
                                        disabled: function () {
                                            return false;
                                        },
                                        beforeUpdate: function (val) {
                                            // 선택된 값은
                                            //console.log(val);
                                            return val;
                                        },
                                        afterUpdate: function (val) {
                                            var _this = this;
                                            var pars = new Object();
                                            pars.codeGrpId = _this.item.codeGrpId;
                                            pars.code = val;
                                            //console.log(pars);
                                        },
                                        notEmpty: true,
                                        maxLength: 50,
                                        updateWith: ["_CUD"]
                                    }
                                },
                                </c:forEach>
                                {
                                    key: "useYn", label: "Use Y/N", width: "80", align: "center",
                                    editor: {
                                        type: "checkbox",
                                        beforeUpdate: function (val) {
                                            return (val == true) ? "Y" : "N";
                                        }
                                    }
                                }
                            ],
                            colHeadAlign: "center",
                            colHead: {
                                heights: [30, 30],
                                rows: [
                                    [
                                        {key: "no", rowspan: 2},
                                        {key: "_CUD", rowspan: 2},
                                        {key: "codeGroupId", rowspan: 2},
                                        {colspan: ${fn:length(langList)}, label: "Code Group Name", align: "center", valign: "middle"}, // 3,4
                                        {key: "useYn", rowspan: 2}
                                    ],
                                    [
                                        <c:forEach var="result" items="${langList}" varStatus="status">
                                        {key: '${result.langCd}'},
                                        </c:forEach>
                                    ]
                                ],
                                onclick: function () {
                                    toast.push(Object.toJSON({index: this.index, r: this.r, c: this.c, colHead: this.colHead, page: this.page}));
                                }
                            },
                            body: {
                                onclick: function () {
                                    trace(this.index);
                                    myGridCode.setList({
                                        ajaxUrl: "F001211/selectCodeList2.do",
                                        ajaxPars: this.item,
                                        onLoad: function () {
                                            //trace(this);
                                            //myGrid.setFocus(this.list.length - 1);
                                        }
                                    });
                                },
                                ondblclick: function () {
                                    trace(this.index);
                                }
                            }
                            ,
                            page: {
                                paging: false
                            }
                        }
                        );

                        myGridCodeGroup.setList({
                            ajaxUrl: "F001211/selectCodeGroupList.do",
                            ajaxPars: {},
                            onLoad: function () {
                                trace(this);
                                myGridCodeGroup.setFocus(this.list.length - 1);
                                myGridCode.setList({
                                        ajaxUrl: "F001211/selectCodeList2.do",
                                        ajaxPars: this.list[this.list.length - 1],
                                        onLoad: function () {
                                            //trace(this);
                                            //myGrid.setFocus(this.list.length - 1);
                                        }
                                    });
                            }
                        });
                        trace(myGridCodeGroup.getSortParam());
                    },
                    getExcel: function (type) {
                        var obj = myGridCodeGroup.getExcelFormat(type, function () {
                            return this.key != "no" && this.key != "finder";
                        });
                        $("#printout").html(obj);
                    }
                    ,
                    getSelectedItem: function () {
                        trace(this.target.getSelectedItem());
                        toast.push('콘솔창에 데이터를 출력하였습니다.');
                    }
                    ,
                    getSelectedItem2: function () {
                        trace(this.target.getSelectedItem());
                        return this.target.getSelectedItem();
                    }
                    ,
                    append: function () {
                        this.target.pushList(
                                {
                                    no: this.target.list.length,
                                    codeGroupId: "",
                                    useYn: 'Y'
                                }
                        );
                        this.target.setFocus(this.target.list.length - 1);
                    }
                    ,
                    remove: function () {
                        var checkedList = myGridCodeGroup.getCheckedListWithIndex(0);// colSeq
                        if (checkedList.length == 0) {
                            toast.push({eatUpTime: 1000, body: '<b>Warning</b>\n Please check the list you want to delete.', type: 'Warning'});
                            return;
                        }
                        this.target.removeListIndex(checkedList);
                    },
                    save: function () {
                        var validator = myGridCodeGroup.validateCheck("C,U");
                        if (validator) {
                            var list = myGridCodeGroup.getList("C,U,D");
                            console.log(list);
                            
                            $.each(list, function(k, v) {
                                var codeGroupLangList = [];
                                <c:forEach var="result" items="${langList}" varStatus="status">
                                    codeGroupLangList.push({codeGroupId: v.codeGroupId, langCd: '${result.langCd}', codeGroupNm: v['${result.langCd}'], _CUD: v._CUD});
                                </c:forEach>
                                v.codeGroupLangList = codeGroupLangList;
                            });
                            
                            var param = {codeGroupList: list};
                            console.log(param);

                            var url = "F001211/saveCodeGroup.do";
                            new AXReq(url, {
                                debug: false,
                                async: false,
                                pars: param,
                                onsucc: function (res) {
                                    if (res.result == AXUtil.ajaxOkCode) {
                                        trace("requestOk");
                                    } else {
                                        trace(res);
                                        if (!axf.isEmpty(res.list) && res.list.length != 0) {
                                            myGridCodeGroup.reloadList();
                                            toast.push({eatUpTime: 1000, body: '<b>Complete</b>\n Complete saving.', type: 'Complete'});
                                        }
                                    }
                                },
                                onerr: function (res) {
                                    toast.push("onFail:" + req.responseText);
                                }
                            });
                        }
                    }
                }
            };

            jQuery(document.body).ready(function () {
                fnObj.pageStart();
            });
        </script>
    </head>

    <body>

        <div id="AXPage">
            <div id="AXPageBody" class="SampleAXSelect">
                <div id="demoPageTabTarget" class="AXdemoPageTabTarget"></div>
                <div class="AXdemoPageContent">
                    <h2>Code group</h2>
                    <div style="padding: 10px 0px;">
                        <input type="button" value="ADD" class="AXButton Red" onclick="fnObj.gridCodeGroup.append();"/>
                        <input type="button" value="REMOVE" class="AXButton Red" onclick="fnObj.gridCodeGroup.remove();"/>
                        <input type="button" value="SAVE" class="AXButton" onclick="fnObj.gridCodeGroup.save();"/>
                        <!--<input type="button" value="DETAIL" class="AXButton" onclick="fnObj.gridCodeGroup.getSelectedItem();"/>-->
                    </div>
                    <div id="AXGridTargetCodeGroup"></div>
                    
                    <h2>Code</h2>
                    <div style="padding: 10px 0px;">
                        <input type="button" value="ADD" class="AXButton Red" onclick="fnObj.gridCode.append();"/>
                        <input type="button" value="REMOVE" class="AXButton Red" onclick="fnObj.gridCode.remove();"/>
                        <input type="button" value="SAVE" class="AXButton" onclick="fnObj.gridCode.save();"/>
                        <!--<input type="button" value="DETAIL" class="AXButton" onclick="fnObj.gridCode.getSelectedItem();"/>-->
                    </div>
                    <div id="AXGridTargetCode"></div>
                </div>
                
                <div class="AXdemoPageContent">
                    
                </div>
            </div>
        </div>

    </body>
</html>        
