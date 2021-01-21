<%-- 
    Document   : test1
    Created on : Dec 15, 2020, 8:54:40 AM
    Author     : HOANG DUC MANH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
        .AXGrid .AXgridScrollBody .AXGridColHead .colHeadTable tbody tr td.colHeadTdLast {
            background: none;
        }

        .AXGrid .AXgridScrollBody .AXGridBody .gridBodyTable tbody tr td.isTdEnd {
            background-image: none;
        }
    </style>

    <script id="jscode">
        /**
         * Require Files for AXISJ UI Component...
         * Based        : jQuery
         * Javascript   : AXJ.js, AXGrid.js, AXInput.js, AXSelect.js
         * CSS          : AXJ.css, AXGrid.css, AXButton.css, AXInput.css, AXSelecto.css
         */
        var menuId = "F111112";
        var langCd = '${langCd}';
        
        AXConfig.AXGrid.fitToWidthRightMargin = -1;

        var pageID = "AXGrid";
        var AXGrid_instances = [];
        var fnObj = {
            pageStart: function () {
                fnObj.grid.bind();
            },
            grid: {
                target: new AXGrid(),
                bind: function () {
                    window.myGrid = fnObj.grid.target;

                    var getColGroup = function () {
                        return [
                            {key: "no", label: "번호", width: "50", align: "center", formatter: "checkbox"},
                            {
                                key: "btns", label: "삭제", width: "40", align: "center", formatter: function () {
                                return '<button type="button" name="delete" onclick="fnObj.grid.deleteItem(' + this.index + ');"><i class="axi axi-trash-o"></i></button>';
                            }
                            },
                            {
                                key: "title", label: "제목", width: "200",
                                tooltip: function () {
                                    return this.item.no + "." + this.item.title + "/" + this.key + "/" + this.value;
                                },
                                colHeadTool: false,
                                sort: false
                            },
                            {key: "writer", label: "작성자", width: "100"},
                            {key: "regDate", label: "작성일", width: "100"},
                            {key: "price", label: "가격", width: "100", align: "right", formatter: "money"},
                            {key: "amount", label: "수량", width: "80", align: "right", formatter: "money"},
                            {
                                key: "cost", label: "금액", width: "100", align: "right",
                                formatter: function () {
                                    return (this.item.price.number() * this.item.amount.number()).money();
                                }
                            },
                            {
                                key: "desc", label: "비고", width: "200", formatter: function () {
                                return this.index;

                            }
                            }
                        ];
                    };

                    myGrid.setConfig({
                        targetID: "AXGridTarget",
                        sort: true, //정렬을 원하지 않을 경우 (tip
                        colHeadTool: true, // column tool use
                        fitToWidth: false, // 너비에 자동 맞춤
                        colGroup: getColGroup(),
                        colHeadAlign: "center", // 헤드의 기본 정렬 값. colHeadAlign 을 지정하면 colGroup 에서 정의한 정렬이 무시되고 colHeadAlign : false 이거나 없으면 colGroup 에서 정의한 속성이 적용됩니다.
                        body: {
                            onclick: function () {
                                toast.push(Object.toJSON({"event": "click", "index": this.index, "r": this.r, "c": this.c, "item": this.item}));
                                // this.list, this.page
                            },
                            /* ondblclick 선언하면 onclick 이벤트가 0.25 초 지연 발생 됩니다. 주의 하시기 바람니다. */
                            ondblclick: function () {
                                toast.push(Object.toJSON({"event": "dblclick", "index": this.index, "r": this.r, "c": this.c, "item": this.item}));
                                // this.list, this.page
                            },
                            addClass: function () {
                                return (this.index % 2 == 0 ? "gray" : "white"); // red, green, blue, yellow, white, gray
                            }
                        },
                        page: {
                            display: false,
                            paging: false
                        }
                    });

                    var list = [
                        {no: 1, title: "AXGrid 첫번째 줄 입니다.", writer: "김기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 1709401, amount: 10}, // item
                        {no: 2, title: "AXGrid 두번째 줄 입니다.", writer: "정기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 12300.00, amount: 7},
                        {no: 3, title: "AXGrid 세번째 줄 입니다.", writer: "한기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 12000, amount: 5},
                        {no: 4, title: "AXGrid 세번째 줄 입니다.", writer: "박기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 13000, amount: 4},
                        {no: 5, title: "AXGrid 세번째 줄 입니다.", writer: "곽기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 3000, amount: 3},
                        {no: 6, title: "AXGrid 세번째 줄 입니다.", writer: "문기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 123000, amount: 2},
                        {no: 7, title: "AXGrid 세번째 줄 입니다.", writer: "소기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 129500, amount: 1},
                        {no: 8, title: "AXGrid 첫번째 줄 입니다.", writer: "재기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 123000, amount: 10},
                        {no: 9, title: "AXGrid 두번째 줄 입니다.", writer: "원기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 12300, amount: 7},
                        {no: 10, title: "AXGrid 세번째 줄 입니다.", writer: "고기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 12000, amount: 5},
                        {no: 11, title: "AXGrid 세번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 13000, amount: 4},
                        {no: 12, title: "AXGrid 세번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 3000, amount: 3},
                        {no: 13, title: "AXGrid 세번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 123000, amount: 2},
                        {no: 14, title: "AXGrid 세번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 129500, amount: 1},
                        {no: 15, title: "AXGrid 두번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 12300, amount: 7},
                        {no: 16, title: "AXGrid 세번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 12000, amount: 5},
                        {no: 17, title: "AXGrid 세번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 13000, amount: 4},
                        {no: 18, title: "AXGrid 세번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 3000, amount: 3},
                        {no: 19, title: "AXGrid 세번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 123000, amount: 2},
                        {no: 20, title: "AXGrid 세번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 129500, amount: 1}
                    ];
                    myGrid.setList(list, null, "reload");
                    //trace(myGrid.getSortParam());

                },
                deleteItem: function (index) {
                    $.Event(event).stopPropagation(); // 버튼클릭 이벤트가 row click 이벤트를 발생시키지 않도록 합니다.
                    var item = myGrid.list[index];
                    toast.push('deleteItem: ' + $.param(item).dec());
                },
                getExcel: function (type) {
                    var obj = myGrid.getExcelFormat(type);
                    trace(obj);
                    $("#printout").html(Object.toJSON(obj));
                },
                getSelectedItem: function () {
                    trace(this.target.getSelectedItem());
                    toast.push('콘솔창에 데이터를 출력하였습니다.');
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

            <div id="grid0">
                <div class="title">
                    <h1>AXGrid</h1>
                </div>
                <h2>그리드 기본 예제입니다.</h2>

                <div id="AXGridTarget" style="height:300px;"></div>
                <div style="padding:10px;">

                    <input type="button" value="forExcel html" class="AXButton" onclick="fnObj.grid.getExcel('html');"/>
                    <input type="button" value="forExcel json" class="AXButton" onclick="fnObj.grid.getExcel('json');"/>

                    <input type="button" value="setHeight : 300px" class="AXButton" onclick="myGrid.setHeight(300);"/>
                    <input type="button" value="setHeight : 600px" class="AXButton" onclick="myGrid.setHeight(600);"/>

                    <input type="button" value="getSelectedItem" class="AXButton" onclick="fnObj.grid.getSelectedItem();"/>
                </div>
            </div>

            <pre id="pretty" class="prettyprint linenums"></pre>

            <div id="printout"></div>

        </div>
    </div>

</div>
</body>
</html>        