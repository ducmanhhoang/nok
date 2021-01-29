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
        <title>AXUpload5 - AXISJ</title>
        <script>
            /**
             * Require Files for AXISJ UI Component...
             * Based        : jQuery
             * Javascript   : AXJ.js, AXGrid.js, AXInput.js, AXSelect.js
             * CSS          : AXJ.css, AXGrid.css, AXButton.css, AXInput.css, AXSelector.css
             */
            var menuId = "F001112";
            var langCd = '${langCd}'
            var pageID = "editor";
            var myGrid = new AXGrid();
            var itemSum = 0;
            
            var myProgress = new AXProgress();

            var fnObj = {
                pageStart: function () {
                    
                    myGrid.setConfig({
                        targetID: "AXGridTarget",
                        theme: "AXGrid",
                        fixedColSeq: 4,
                        fitToWidth: true,
                        colGroup: [
                            {
                                key: "no", label: "checkbox", width: "30", align: "center", formatter: "checkbox",
                                disabled: function () {
                                    return false;
                                    return (this.index % 2 != 0);
                                },
                                // checkbox 개체를 checked 된 상태로 만들기
                                checked: function () {
                                    return false;
                                    //사용 가능한 변수
                                    //this.index
                                    //this.item
                                    //this.list
                                    return (this.index % 2 == 0);
                                }
                            },
                            {key: "no", label: "No.", width: "50", align: "right", pk: true},
                            {key: "title", label: "Title", width: "200"},
                            {key: "writer", label: "Writer", width: "100", align: "center"},
                            {key: "regDate", label: "Reg Date", width: "100", align: "center"},
                            {key: "price", label: "Price", width: "100", align: "right", formatter: "money"},
                            {key: "amount", label: "Amount", width: "80", align: "right", formatter: "money"},
                            {key: "cost", label: "Cost", width: "100", align: "right", formatter: function () {
                                    return (this.item.price.number() * this.item.amount.number()).money();
                                }},
                            {key: "desc", label: "Desc", width: "200"},
                            {key: "YN", label: "YN", width: "50", align: "center", formatter: "dec"}
                        ],
                        colHeadAlign: "center",
                        colHead: {
                            rows: [
                                [
                                    {colSeq: 0, rowspan: 2},
                                    {colSeq: 1, rowspan: 2},
                                    {colSeq: null, colspan: 3, label: "표현식", align: "center"}, // 2,3,4
                                    {colSeq: 5, rowspan: 2},
                                    {colSeq: 6, rowspan: 2},
                                    {colSeq: 7, rowspan: 2},
                                    {colSeq: 8, rowspan: 2},
                                    {colSeq: 9, rowspan: 2}
                                ],
                                [
                                    {colSeq: 2},
                                    {colSeq: 3},
                                    {colSeq: 4}
                                ]
                            ]
                        },
                        body: {
                            onclick: function () {
                                toast.push(Object.toJSON({index: this.index, r: this.r, c: this.c, item: this.item}));
                                //myGrid.checkedColSeq(0, true, this.index); 바디를 클릭했을때 0번째 체크박스 체크처리
                                myGrid.checkedColSeq(0, null, this.index); // 바디를 클릭했을때 0번째 체크박스 토글체크처리
                            },
                            ondblclick: function () {
                                toast.push(Object.toJSON({index: this.index, r: this.r, c: this.c, item: this.item}));
                                myGrid.setEditor(this.item, this.index); //바디를 클릭했을때 에디터 활성화
                            },
                            // checkbox 개체를 click 할때 이벤트 체크
                            oncheck: function () {
                                //사용 가능한 변수
                                //this.itemIndex
                                //this.target
                                //this.checked
                                //this.r
                                //this.c
                                //this.list
                                //this.item
                                //toast.push(this.checked);

                            }
                        },

                        page: {
                            paging: false
                        },
                        editor: {
                            rows: [
                                [
                                    {
                                        colSeq: 0, align: "center", valign: "middle",
                                        formatter: function () {
                                            return this.item.no;
                                        }
                                    },
                                    {
                                        colSeq: 1, align: "center", valign: "middle", form: {type: "readonly", value: "itemValue"}
                                    },
                                    {colSeq: 2, align: "left", valign: "top",
                                        form: {
                                            type: "text", value: function () {
                                                return this.value.dec();
                                            }
                                            , validate: function () {
                                                return true;
                                                /*
                                                 if(this.value == ""){
                                                 alert("제목은 필수 입력 항목 입니다.");
                                                 return false;
                                                 }else{
                                                 return true;
                                                 }
                                                 */
                                            }
                                        }
                                        , AXBind: {type: "selector", config: {
                                                appendable: true,
                                                ajaxUrl: "selectorData.php",
                                                ajaxPars: "",
                                                onChange: function () {
                                                    //trace(this.selectedOption);
                                                    if (this.selectedOption) {
                                                        myGrid.setEditorForm({
                                                            key: "title",
                                                            position: [0, 2], // editor rows 적용할 대상의 배열 포지션 (다르면 적용되지 않습니다.)
                                                            value: this.selectedOption.optionText
                                                        });
                                                    }
                                                }
                                            }
                                        }
                                    },
                                    {colSeq: 3, align: "left", valign: "top",
                                        form: {
                                            type: "radio",
                                            value: "itemValue",
                                            options: [
                                                {value: '장기영', text: '장기영'},
                                                {value: '장서우', text: '장서우'}
                                            ]
                                        }
                                    },
                                    {colSeq: 4, align: "left", valign: "top", form: {type: "text", value: "itemValue"}, AXBind: {type: "date"}},
                                    {colSeq: 5, align: "left", valign: "top", form: {type: "text", value: "itemValue"}, AXBind: {type: "money"}},
                                    {colSeq: 6, align: "left", valign: "top", form: {type: "text", value: "itemValue"}, AXBind: {type: "number", config: {min: 0, max: 100}}},
                                    {colSeq: 7, align: "right", valign: "top"},
                                    {colSeq: 8, align: "left", valign: "top",
                                        form: {
                                            type: "select",
                                            options: [
                                                {value: 1, optionText: "AXJ_String%2C%EC%97%91%EC%8B%9C%EC%8A%A4%EC%A0%9C%EC%9D%B4"},
                                                {value: 2, text: "AXJ_String%2C%EC%97%91%EC%8B%9C%EC%8A%A4%EC%A0%9C%EC%9D%B4"},
                                                {value: 3, text: "ADD"}
                                            ],
                                            AXBind: {
                                                type: "select", config: {
                                                    onChange: function () {
                                                        //trace(this);
                                                    }
                                                },
                                                onChange: function () {
                                                    // abcd
                                                    AXUtil.alert(this);
                                                }
                                            }
                                        }
                                    },
                                    {
                                        colSeq: 9, align: "center", valign: "middle",
                                        form: {
                                            type: "checkbox", value: "itemValue", options: [
                                                {value: true, text: ''}
                                            ]
                                        }
                                    }
                                ]
                            ],
                            //request:{ajaxUrl:"saveGrid.php", ajaxPars:"param1=1&param2=2"},
                            response: function () { // ajax 응답에 대해 예외 처리 필요시 response 구현
                                // response에서 처리 할 수 있는 객체 들
                                //trace({res:this.res, index:this.index, insertIndex:this.insertIndex, list:this.list, page:this.page});
                                if (this.error) {
                                    trace(this);
                                    return;
                                }

                                if (this.index == null) { // 추가
                                    var pushItem = this.res.item;
                                    //pushItem 에 추가 값 지정 가능
                                    if (this.res.item.title == "") {
                                        alert("제목이 비어 추가 할 수 없습니다.");
                                        return false;
                                    }
                                    trace(pushItem, this.insertIndex);
                                    myGrid.pushList(pushItem, this.insertIndex);
                                } else { // 수정
                                    //trace(this.res.item);
                                    AXUtil.overwriteObject(this.list[this.index], this.res.item, true); // this.list[this.index] object 에 this.res.item 값 덮어쓰기
                                    myGrid.updateList(this.index, this.list[this.index]);
                                }

                            },
                            onkeyup: function (event, element) {
                                if (event.keyCode == 13 && element.name != "title")
                                    myGrid.saveEditor();
                                else if (event.keyCode == 13 && element.name == "title")
                                    myGrid.focusEditorForm("regDate");
                            }
                        },
                        contextMenu: {
                            theme: "AXContextMenu", // 선택항목
                            width: "150", // 선택항목
                            menu: [
                                {
                                    userType: 1, label: "추가하기", className: "plus", onclick: function () {
                                        myGrid.appendList(null);
                                        //myGrid.appendList(item, index);
                                        /*
                                         var removeList = [];
                                         removeList.push({no:this.sendObj.item.no});
                                         myGrid.removeList(removeList); // 전달한 개체와 비교하여 일치하는 대상을 제거 합니다. 이때 고유한 값이 아닌 항목을 전달 할 때에는 에러가 발생 할 수 있습니다.
                                         */
                                    }
                                },
                                {
                                    userType: 1, label: "삭제하기", className: "minus", onclick: function () {
                                        if (this.sendObj) {
                                            if (!confirm("정말 삭제 하시겠습니까?"))
                                                return;
                                            var removeList = [];
                                            removeList.push({no: this.sendObj.item.no});
                                            myGrid.removeList(removeList); // 전달한 개체와 비교하여 일치하는 대상을 제거 합니다. 이때 고유한 값이 아닌 항목을 전달 할 때에는 에러가 발생 할 수 있습니다.
                                        }
                                    }
                                },
                                {
                                    userType: 1, label: "수정하기", className: "edit", onclick: function () {
                                        //trace(this);
                                        if (this.sendObj) {
                                            myGrid.setEditor(this.sendObj.item, this.sendObj.index);
                                        }
                                    }
                                }
                            ],
                            filter: function (id) {
                                return true;
                            }
                        }
                    });

                    var list = [
                        {no: 1, title: "AXGrid 첫번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: 2, price: 123000, amount: 10, YN: false}, // item
                        {no: 2, title: "AXGrid 두번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 12300, amount: 7, YN: true},
                        {no: 3, title: "AXGrid 세번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 12000, amount: 5, YN: true},
                        {no: 4, title: "AXGrid 세번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 13000, amount: 4, YN: true},
                        {no: 5, title: "AXGrid 세번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 3000, amount: 3},
                        {no: 6, title: "AXGrid 세번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 123000, amount: 2},
                        {no: 7, title: "AXGrid 세번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 129500, amount: 1},
                        {no: 8, title: "AXGrid 첫번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 123000, amount: 10},
                        {no: 9, title: "AXGrid 두번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 12300, amount: 7},
                        {no: 10, title: "AXGrid 세번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 12000, amount: 5},
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
                    myGrid.setList(list);
                    //myGrid.setList([]);
                    //myGrid.setDataSet({price:123000, amount:10});
                },
                appendGrid: function (index) {
                    var item = {amount: 0};
                    if (index == "last") {
                        myGrid.appendList(item, myGrid.list.length);
                    } else if (typeof index != "undefined") {
                        myGrid.appendList(item, index);
                    } else {
                        myGrid.appendList(item);
                    }
                },
                getCheckedList: function () {
                    var checkedList = myGrid.getCheckedList(0);// colSeq
                    alert(Object.toJSON(checkedList));
                },
                removeList: function () {
                    var checkedList = myGrid.getCheckedList(0);// colSeq
                    if (checkedList.length == 0) {
                        alert("선택된 목록이 없습니다. 삭제하시려는 목록을 체크하세요");
                        return;
                    }
                    if (!confirm("정말 삭제 하시겠습니까?"))
                        return;

                    /// something do for server

                    var removeList = [];
                    $.each(checkedList, function () {
                        removeList.push({no: this.no});
                    });
                    myGrid.removeList(removeList); // 전달한 개체와 비교하여 일치하는 대상을 제거 합니다. 이때 고유한 값이 아닌 항목을 전달 할 때에는 에러가 발생 할 수 있습니다.
                }

            };
            jQuery(document.body).ready(function () {
                fnObj.pageStart();
            });
        </script>

        <style type="text/css">

        </style>
    </head>

    <body>

        <div id="AXPage">

            <div id="AXPageBody" class="SampleAXSelect">
                <div id="demoPageTabTarget" class="AXdemoPageTabTarget"></div>
                <div class="AXdemoPageContent">

                    <div class="title">
                        <h1>AXGrid (editor)</h1>
                    </div>
                    <h2>그리드에 editor를 이용해서 데이터를 추가하고 삭제하는 예제입니다.</h2>

                    <div id="AXGridTarget" style="height:400px;"></div>

                    <div style="padding:10px;">
                        <input type="button"    value="Add" class="AXButton Red" onclick="fnObj.appendGrid();" />
                        <input type="button"    value="Add (index : 10)" class="AXButton Red" onclick="fnObj.appendGrid(10);" />
                        <input type="button"    value="Add (index : 15)" class="AXButton Red" onclick="fnObj.appendGrid(15);" />
                        <input type="button"    value="Add (index: 20)" class="AXButton Red" onclick="fnObj.appendGrid(20);" />
                        <input type="button"    value="Add (at the end)" class="AXButton Red" onclick="fnObj.appendGrid('last');" />
                        <input type="button"    value="getCheckedList" class="AXButton Blue" onclick="fnObj.getCheckedList();" />
                        <input type="button"    value="checkedColSeq(0, true)" class="AXButton Blue" onclick="myGrid.checkedColSeq(0, true);" />
                        <input type="button"    value="checkedColSeq(0, false)" class="AXButton Blue" onclick="myGrid.checkedColSeq(0, false);" />
                        <input type="button"    value="Delete" class="AXButton Red" onclick="fnObj.removeList();" />
                    </div>

                    <div style="padding:10px;">
                        <button type="button" class="AXButton" onclick='myGrid.pushList(
                                        {no: myGrid.list.length, title: "AXGrid 첫번째 줄 입니다.", writer: "장기영", regDate: "2013-01-18", desc: "myGrid.setList 의 첫번째 사용법 list json 직접 지정 법", price: 123000, amount: 10},
                                        null
                                        );'>pushList</button>
                    </div>

                    <div class="H20"></div>
                    <pre id="pretty" class="prettyprint linenums"></pre>

                </div>
                
                
            </div>

        </div>

    </body>
</html>        
