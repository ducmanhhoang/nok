<%-- 
    Document   : F001111
    Created on : Jan 21, 2021, 10:53:37 AM
    Author     : Hoang Duc Manh
--%>

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
                            sort: false,
                            fixedColSeq: 3,
                            colGroup: [
                                {key: "no", label: "번호", width: "50", align: "center", formatter: "checkbox"},
                                {
                                    key: "_CUD", label: "상태", width: "50", align: "center"
                                },
                                {
                                    key: "string", label: "String", width: "200",
                                    formatter: function (val) {
                                        if (Object.isObject(this.value)) {
                                            return this.value.codeGroupNm;
                                        } else {
                                            return this.value;
                                        }
                                    },
                                    editor: {
                                        type: "AXSelector",
                                        config: {
                                            reserveKeys: {
                                                options: "list",
                                                optionValue: "codeGroupId",
                                                optionText: "codeGroupNm"
                                            },
                                            ajaxUrl: "F001211/selectCodeGroupList.do",
                                            ajaxPars: "",
                                            onchange: function () {
                                                // inline editor 에 선언한 onchange함수는 AXGrid내부에서 사용하는 onchange 함수로 변경되어 사용할 수 없습니다.
                                            }
                                        },
                                        beforeUpdate: function (val) { // 수정이 되기전 value를 처리 할 수 있음.
                                            // 선택된 값은
                                            console.log(val);
                                            return val;
                                        },
                                        afterUpdate: function (val) { // 수정이 처리된 후
                                            // 수정이 된 후 액션.
                                            console.log(this);
                                        },

                                        /*
                                         type: "text",
                                         //textType: "password",
                                         //maxLength: 5,
                                         */
                                        updateWith: ["_CUD"]

                                    }
                                },
                                {
                                    key: "combobox", label: "combobox", width: "100",
                                    editor: {
                                        type: "select",
                                        optionValue: "CD",
                                        optionText: "NM",
                                        options: [
                                            {CD: 1, NM: "김기영"},
                                            {CD: 2, NM: "장기영"},
                                            {CD: 3, NM: "장서우"}
                                        ],
                                        beforeUpdate: function (val) { // 수정이 되기전 value를 처리 할 수 있음.
                                            // 선택된 값은
                                            console.log(val);
                                            return val;
                                        },
                                        afterUpdate: function (val) { // 수정이 처리된 후
                                            // 수정이 된 후 액션.
                                            console.log(this);
                                        }
                                    }
                                },
                                {
                                    key: "combobox1", label: "combobox1", width: "100",
                                    formatter: function () {
                                        return this.value.NM;
                                    },
                                    editor: {
                                        type: "select",
                                        optionValue: "CD",
                                        optionText: "NM",
                                        options: function () {
                                            return this.value.options;
                                        },
                                        beforeUpdate: function (val) { // 수정이 되기전 value를 처리 할 수 있음.
                                            // 선택된 값은
                                            var NM = "";
                                            for (var oi = 0, l = this.value.options.length; oi < l; oi++) {
                                                if (this.value.options[oi].CD == val) {
                                                    NM = this.value.options[oi].NM;
                                                    break;
                                                }
                                            }
                                            this.value.CD = val;
                                            this.value.NM = NM;
                                            return this.value;
                                        },
                                        afterUpdate: function (val) { // 수정이 처리된 후
                                            // 수정이 된 후 액션.
                                            console.log(this);
                                        }
                                    }
                                },
                                {
                                    key: "combobox2", label: "combobox2", width: "100",
                                    formatter: function (val) {
                                        if (Object.isObject(this.value)) {
                                            return this.value.NM;
                                        } else {
                                            return this.value;
                                        }
                                    },
                                    editor: {
                                        type: "AXSelect",
                                        config: {
                                            reserveKeys: {
                                                options: "list",
                                                optionValue: "CD",
                                                optionText: "NM"
                                            }
                                            ,
                                            ajaxUrl: "selectData-01.php",
                                            ajaxPars: "",
                                            onchange: function () {
                                                // inline editor 에 선언한 onchange함수는 AXGrid내부에서 사용하는 onchange 함수로 변경되어 사용할 수 없습니다.
                                            }
                                        }
                                        ,
                                        beforeUpdate: function (val) { // 수정이 되기전 value를 처리 할 수 있음.
                                            // 선택된 값은
                                            console.log(val);
                                            return val;
                                        }
                                        ,
                                        afterUpdate: function (val) { // 수정이 처리된 후
                                            // 수정이 된 후 액션.
                                            //console.log(this);
                                        }
                                    }
                                },
                                {
                                    key: "date", label: "date", width: "105", align: "center",
                                    editor: {
                                        type: "calendar",
                                        config: {
                                            separator: "-"
                                        },
                                        disabled: function () {
                                            return this.item._CUD != "C";
                                        },
                                        updateWith: ["_CUD"]
                                    }
                                },
                                {
                                    key: "money", label: "money", width: "100", align: "right",
                                    formatter: "money",
                                    editor: {
                                        type: "money",
                                        updateWith: ["number", "_CUD"]
                                    }
                                },
                                {
                                    key: "number", label: "number", width: "80", align: "right",
                                    formatter: "money",
                                    editor: {
                                        type: "number",
                                        updateWith: ["money", "_CUD"]
                                    }
                                },
                                {
                                    key: "checkbox", label: "checkbox", width: "50", align: "center",
                                    editor: {
                                        type: "checkbox",
                                        beforeUpdate: function (val) {
                                            return (val == true) ? "Y" : "N";
                                        }
                                    }
                                },
                                {
                                    key: "radio", label: "radio", width: "50", align: "center",
                                    editor: {
                                        type: "radio"
                                    }
                                },
                                {
                                    key: "finder", label: "finder", width: "100", align: "center",
                                    editor: {
                                        type: "finder",
                                        formatter: function () {
                                            return (this.item.finder || "");
                                        }

                                        ,
                                        finder: {
                                            onclick: function () {
                                                alert("새창 열기");
                                            }
                                        }
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

                        var list = [
                            {
                                no: 1,
                                string: {codeGroupId: 'A_PROGRAM_TYPE', codeGroupNm: 'Program type'},
                                combobox: 1,
                                combobox1: {CD: '1', NM: '김기영', options: [{CD: 1, NM: "김기영"}, {CD: 2, NM: "장기영"}, {CD: 3, NM: "장서우"}]},
                                combobox2: {CD: 1, NM: "김기영"},
                                date: "2013-01-18",
                                money: 1709401,
                                number: 10,
                                checkbox: 1,
                                radio: 1,
                                finder: "선택"
                            },
                            {
                                no: 2,
                                string: "AXGrid 첫번째 줄 입니다.",
                                combobox: 2,
                                combobox1: {CD: '1', NM: '황인서', options: [{CD: 1, NM: "황인서"}, {CD: 2, NM: "장인서"}, {CD: 3, NM: "김인서"}]},
                                combobox2: {CD: 1, NM: "김기영"},
                                date: "2013-01-18",
                                money: 1709401,
                                number: 10,
                                checkbox: 1,
                                radio: 1,
                                finder: "선택"
                            },
                            {
                                no: 3,
                                string: "AXGrid 첫번째 줄 입니다.",
                                combobox: 3,
                                combobox1: {CD: '1', NM: '김동근', options: [{CD: 1, NM: "김동근"}, {CD: 2, NM: "박동근"}, {CD: 3, NM: "장동근"}]},
                                combobox2: {CD: 1, NM: "김기영"},
                                date: "2013-01-18",
                                money: 1709401,
                                number: 10,
                                checkbox: 1,
                                radio: 1,
                                finder: "선택"
                            }
                        ];
                        myGridCode.setList(list);
                        //trace(myGridCode.getSortParam());

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
                                    string: "",
                                    combobox: {optionValue: 1, optionText: "김기영"},
                                    combobox1: {CD: '1', NM: '김동근', options: [{CD: 1, NM: "김동근"}, {CD: 2, NM: "박동근"}, {CD: 3, NM: "장동근"}]},
                                    combobox2: {CD: 1, NM: "김기영"},
                                    date: "2013-01-18",
                                    money: 1709401,
                                    number: 10,
                                    checkbox: 1,
                                    radio: 1,
                                    finder: "선택"
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
                            fixedColSeq: 4,
                            //fitToWidth:true,
                            height: 300,
                            passiveMode: true,
                            colGroup: [
                                {key: "no", label: "번호", width: "50", align: "center", formatter: "checkbox"},
                                {
                                    key: "_CUD", label: "상태", width: "50", align: "center"
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
                                            new AXReq("F001211/selectCodeGroupIdExisted.do",
                                                    {pars: {codeGroupId: val},
                                                        onsucc: function (res) {
                                                            trace(res);
                                                            if (!axf.isEmpty(res.list) && res.list.length != 0) {
                                                                valid = false;
                                                                toast.push({eatUpTime: 1000, body: '<b>Warning</b>, The input is not valid!', type: 'Warning'});
                                                            }
                                                        }, async: false
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
                                {
                                    key: "vn", label: "Vietnamese", width: "300",
                                    formatter: function () {
                                        return this.value;
                                    },
                                    editor: {
                                        type: "text",
                                        disabled: function () {
                                            return false;
                                        },
                                        beforeUpdate: function (val) {
                                            //console.log(val);
                                            if (val != null || val != '')
                                                return val;
                                            else
                                                return "";
                                        },
                                        afterUpdate: function (val) {
                                            var pars = new Object();
                                            //console.log(this.item);
                                            pars.codeGrpId = this.item.codeGroupId;
                                            pars.code = val;
                                            //console.log(pars);
                                        },
                                        notEmpty: true,
                                        maxLength: 50,
                                        updateWith: ["_CUD"]
                                    }
                                },
                                {
                                    key: "en", label: "English", width: "300",
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
                                        {colspan: 2, label: "Language", align: "center", valign: "middle"}, // 3,4
                                        {key: "useYn", rowspan: 2}
                                    ],
                                    [
                                        {key: 'vn'},
                                        {key: 'en'}
                                    ]
                                ],
                                onclick: function () {
                                    toast.push(Object.toJSON({index: this.index, r: this.r, c: this.c, colHead: this.colHead, page: this.page}));
                                }
                            },
                            body: {
                                onclick: function () {
                                    //trace(this.index);
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
                            ajaxPars: {
                                "param1": "액시스제이",
                                "param2": "AXU4J"
                            },
                            onLoad: function () {
                                //trace(this);
                                //myGrid.setFocus(this.list.length - 1);
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
                    append: function () {
                        this.target.pushList(
                                {
                                    no: this.target.list.length,
                                    codeGroupId: "",
                                    vn: "",
                                    en: "",
                                    useYn: 'Y'
                                }
                        );
                        this.target.setFocus(this.target.list.length - 1);
                    }
                    ,
                    remove: function () {
                        var checkedList = myGridCodeGroup.getCheckedListWithIndex(0);// colSeq
                        if (checkedList.length == 0) {
                            toast.push("There is no selected list. Please check the list you want to delete.");
                            return;
                        }
                        this.target.removeListIndex(checkedList);
                    },
                    save: function () {
                        var validator = myGridCodeGroup.validateCheck("C,U");
                        if (validator) {
                            var list = myGridCodeGroup.getList();
                            console.log(list);
                            var param = {codeGroupList: list};
                            console.log(param);
                            new AXReq("F001211/saveCodeGroup.do",
                                    {pars: JSON.stringify(param),
                                        onsucc: function (res) {
                                            trace(res);
                                            if (!axf.isEmpty(res.list) && res.list.length != 0) {
                                                valid = false;
                                                toast.push({eatUpTime: 1000, body: '<b>Warning</b>, The input is not valid!', type: 'Warning'});
                                            }
                                        }, async: false
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
                    <div style="padding: 10px 0px;">
                        <input type="button" value="ADD" class="AXButton Red" onclick="fnObj.gridCodeGroup.append();"/>
                        <input type="button" value="REMOVE" class="AXButton Red" onclick="fnObj.gridCodeGroup.remove();"/>
                        <input type="button" value="SAVE" class="AXButton" onclick="fnObj.gridCodeGroup.save();"/>
                        <input type="button" value="DETAIL" class="AXButton" onclick="fnObj.gridCodeGroup.getSelectedItem();"/>
                    </div>

                    <div id="AXGridTargetCodeGroup"></div>
                </div>
                <div class="AXdemoPageContent">
                    <div style="padding: 10px 0px;">
                        <input type="button" value="ADD" class="AXButton Red" onclick="fnObj.gridCode.append();"/>
                        <input type="button" value="REMOVE" class="AXButton Red" onclick="fnObj.gridCode.remove();"/>
                        <input type="button" value="DETAIL" class="AXButton" onclick="fnObj.gridCode.getSelectedItem();"/>
                    </div>

                    <div id="AXGridTargetCode" style="height:400px;"></div>
                </div>
            </div>
        </div>

    </body>
</html>        
