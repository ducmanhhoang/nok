<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>

        <script type="text/javascript">
            var menuId = "F111213";
            var langCd = '${langCd}';
            var myGrid = new AXGrid(); // instance
            var myEditor = new AXEditor();
            var myUpload = new AXUpload5();
            var fnObj = {
                pageStart: function () {

                    myGrid.setConfig({
                        targetID: "AXGridTarget",
                        theme: "AXGrid",
                        autoChangeGridView: {// autoChangeGridView by browser width
                            mobile: [0, 600], grid: [600]
                        },
                        colGroup: [
                            {key: "no", label: "No.", width: "40", align: "center", formatter: "money"},
                            {key: "title", label: "Title", width: "200"},
                            {key: "writer", label: "Writer", width: "100", align: "center"},
                            {key: "date", label: "Date.", width: "100", align: "center"},
                            {key: "desc", label: "Etc.", width: "*"}
                        ],
                        body: {
                            onclick: function () {
                                toast.push(Object.toJSON({index: this.index, item: this.item}));
                            }
                        },
                        page: {
                            paging: false
                        }
                    });

                    var list = [
                        {
                            no: 1, title: "AXGrid 첫번째 줄 입니다.AXGrid 첫번째 줄 입니다.", writer: "장기영", img: "img/1.jpg", desc: "많은 글을 담고 있는 내용 입니다. 자연스럽게 줄이 넘어가고 표현되는 것이 관건 입니다.", category: "액시스제이", date: "2014-04-05"
                        },
                        {
                            no: 2, title: "AXGrid 두번째 줄 입니다.AXGrid 첫번째 줄 입니다.", writer: "장기영", img: "img/2.jpg", desc: "많은 글을 담고 있는 내용 입니다.", category: "액시스제이", date: "2014-04-07"
                        },
                        {
                            no: 3, title: "AXGrid 세번째 줄 입니다.AXGrid 첫번째 줄 입니다.", writer: "장기영", img: "img/3.jpg", desc: "많은 글을 담고 있는 내용 입니다. 자연스럽게...", category: "액시스제이", date: "2014-04-09"
                        }
                    ];

                    //setList
                    myGrid.setList(list);
                    /* ajax way
                     myGrid.setList({
                     ajaxUrl:"...",
                     ajaxPars:"",
                     onLoad:function(){},
                     onError:function(){}
                     });
                     */


                    jQuery("#AXSelect4").bindSelect({
                        reserveKeys: {
                            optionValue: "code",
                            optionText: "name"
                        },
                        options: [{"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B001", "name": "밥이답이다", "data4": 1, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B002", "name": "버거헌터", "data4": 1, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B003", "name": "야끼스타", "data4": 1, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B004", "name": "카페클라시코", "data4": 1, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B005", "name": "업타운카페", "data4": 1, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B006", "name": "업타운베이커리", "data4": 1, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B007", "name": "메인디쉬", "data4": 1, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B008", "name": "키사라", "data4": 1, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B009", "name": "손수헌_고급", "data4": 1, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B010", "name": "손수헌_일반", "data4": 1, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B011", "name": "메짜루나", "data4": 1, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B012", "name": "싱카이", "data4": 1, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B013", "name": "오리옥스", "data4": 1, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B014", "name": "아모리스_연회", "data4": 1, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B015", "name": "아모리스_케이터링", "data4": 1, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B016", "name": "뭄바", "data4": 1, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B017", "name": "사보텐", "data4": 1, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B018", "name": "정글주스", "sort": 0, "data4": 1, "data5": 0, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B019", "name": "DELIVERY", "sort": 0, "data4": 1, "data5": 0, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B020", "name": "루", "sort": 0, "data4": 1, "data5": 0, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B021", "name": "타코벨", "sort": 0, "data4": 1, "data5": 0, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}, {"basicCd": "MNU_BCAT", "basicNm": "메뉴분류(브랜드)", "code": "B022", "name": "반주", "sort": 0, "data4": 1, "data5": 0, "posUseYn": "N", "remark": "DATA4컬럼의 값은 분류정보 테이블(CAT_M)의 Level을 의미함", "useYn": "Y"}],
                        onChange: function () {
                            toast.push(Object.toJSON(this));
                        }
                    });

                    jQuery("#AXSelect4").setValueSelect(5);

                    myEditor.setConfig({
                        targetID: "AXEditorTarget",
                        lang: "kr",
                        height: 300,
                        frameSrc: "${pageContext.request.contextPath}/resources/js/lib/AXEditor.html",
                        editorFontFamily: "Nanum Gothic",
                        fonts: ["Nanum Gothic", "Malgun Gothic", "Gulim", "Dotum", "궁서"],
                        onReady: function () {
                            myEditor.setContent($("#editContent"));
                        }
                    });

                    fnObj.upload.init();
                },
                upload: {
                    init: function () {

                        myUpload.setConfig({
                            targetID: "AXUpload5",
                            targetButtonClass: "Green",
                            uploadFileName: "fileData",
                            file_types: "image/*", //audio/*|video/*|image/*|MIME_type (accept)
                            dropBoxID: "uploadQueueBox",
                            queueBoxID: "uploadQueueBox", // upload queue targetID
                            //queueBoxAppendType:"(prepend || append)",
                            // html 5를 지원하지 않는 브라우저를 위한 swf upload 설정 원치 않는 경우엔 선언 하지 않아도 됩니다. ------- s
                            flash_url: "${pageContext.request.contextPath}/resources/js/lib/swfupload.swf",
                            flash9_url: "${pageContext.request.contextPath}/resources/js/lib/swfupload_fp9.swf",
                            flash_file_types: "*.jpg;*.jpeg;*.gif;*.bmp;*.png",
                            flash_file_types_description: "image",

                            // --------- e
                            onClickUploadedItem: function () { // 업로드된 목록을 클릭했을 때.
                                //trace(this);
                                window.open(this.uploadedPath.dec() + this.saveName.dec(), "_blank", "width=500,height=500");
                            },

                            uploadMaxFileSize: (10 * 1024 * 1024), // 업로드될 개별 파일 사이즈 (클라이언트에서 제한하는 사이즈 이지 서버에서 설정되는 값이 아닙니다.)
                            uploadMaxFileCount: 10, // 업로드될 파일갯수 제한 0 은 무제한
                            uploadUrl: "module/common/file/upload.do",
                            uploadPars: {userID: 'tom', userName: '액시스'},
                            deleteUrl: "module/common/file/delete.do",
                            deletePars: {userID: 'tom', userName: '액시스'},

                            buttonTxt: "파일올리기",

                            fileKeys: {// 서버에서 리턴하는 json key 정의 (id는 예약어 사용할 수 없음)
                                name: "name",
                                type: "type",
                                saveName: "saveName",
                                fileSize: "fileSize",
                                uploadedPath: "uploadedPath",
                                thumbPath: "thumbUrl" // 서버에서 키값을 다르게 설정 할 수 있다는 것을 확인 하기 위해 이름을 다르게 처리한 예제 입니다.
                            },

                            onbeforeFileSelect: function () {
                                //trace(this);
                                return true;
                            },
                            onUpload: function () {
                                trace(this);
                                //trace(myUpload.uploadedList);
                                //trace("onUpload");

                                myEditor.insertIMG({
                                    ti: this.name,
                                    nm: this.saveName,
                                    ty: this.type,
                                    sz: this.fileSize,
                                    path: this.uploadedPath,
                                    thumb: this.thumbUrl
                                });
                                return true;
                            },
                            onComplete: function () {
                                //trace(this);
                                //trace("onComplete");
                                $("#uploadCancelBtn").get(0).disabled = true; // 전송중지 버튼 제어
                            },
                            onStart: function () {
                                //trace(this);
                                //trace("onStart");
                                $("#uploadCancelBtn").get(0).disabled = false; // 전송중지 버튼 제어
                            },
                            onDelete: function () {
                                //trace(1, this);
                                trace(2, "MF_" + this.file.saveName.replace(new RegExp("[\.]" + this.file.type, "i"), "").dec());
                                //trace("onDelete");
                                myEditor.removeIMG("MF_" + this.file.saveName.replace(new RegExp("[\.]" + this.file.type), "").dec());
                                //imgObj.id = "MF_"+file.nm.replace(file.ty, "").dec();
                            },
                            onError: function (errorType, extData) {
                                if (errorType == "html5Support") {
                                    //dialog.push('The File APIs are not fully supported in this browser.');
                                } else if (errorType == "fileSize") {
                                    //trace(extData);
                                    alert("파일사이즈가 초과된 파일을 업로드 할 수 없습니다. 업로드 목록에서 제외 합니다.\n(" + extData.name + " : " + extData.size.byte() + ")");
                                } else if (errorType == "fileCount") {
                                    alert("업로드 갯수 초과 초과된 아이템은 업로드 되지 않습니다.");
                                }
                            }
                        });
                        // changeConfig

                        // 서버에 저장된 파일 목록을 불러와 업로드된 목록에 추가 합니다. ----------------------------- s
                        /*
                         var url = "loadFileList.asp";
                         var pars = "dummy="+AXUtil.timekey();
                         new AXReq(url, {pars:pars, onsucc:function(res){
                         if(res.result == "ok"){
                         myUpload.setUploadedList(res.ds);
                         }else{
                         alert(res.msg.dec());
                         }
                         }});
                         */
                        // 서버에 저장된 파일 목록을 불러와 업로드된 목록에 추가 합니다. ----------------------------- e
                    }
                },
                saveEditor: function () {
                    //AXEditor 의 내용 얻기
                    var myContent = myEditor.getContent();
                    var content = [];
                    while (myContent.length > 0) {
                        content.push("content=" + myContent.substr(0, 102399).enc());
                        myContent = myContent.substr(102399);
                    }
                    alert(content);

                    //AXUpload 의 파일 리스트 얻기
                    var files = myUpload.getUploadedList();
                    var fpas = [];
                    $.each(files, function (index, f) {
                        fpas.push("attFileName=" + f.nm + "&attPath=" + f.path + "&attFileType=" + f.ty + "&attTitle=" + f.ti + "&attFileSize=" + f.size + "&attthumb=" + f.thumb);
                    });
                    alert(fpas);
                },
                insertImg: function (file) {
                    var sel = myUpload.getSelectUploadedList("object");
                    axf.each(sel, function () {
                        myEditor.insertIMG({
                            ti: this.name,
                            nm: this.saveName,
                            ty: this.type,
                            sz: this.fileSize,
                            path: this.uploadedPath,
                            thumb: this.thumbUrl
                        });
                    });
                }
            };
            jQuery(document).ready(fnObj.pageStart());
        </script>
    </head>
    <body>
        <h1>AXGrid RWD</h1>
        <div id="AXGridTarget"></div>
        <h3>option script 지정방식 (#AXSelect4)</h3>
        <select name="" class="AXSelect" id="AXSelect4" style="width:100px;" tabindex="4"></select>
        <button type="button" class="AXButton" onclick="alert($('#AXSelect4').val())">valueCheck</button>


        <div class="title"><h1>AXEditor with AXUpload5</h1></div>

        <div id="AXEditorTarget"></div>
        <div id="editContent" style="display:none;">에디터의 사용 법은 ?</div>

        <div class="H10"></div>

        <div class="AXUpload5" id="AXUpload5"></div>

        <div class="H10"></div>

        <div id="uploadQueueBox" class="AXUpload5QueueBox" style="height:188px;"></div>

        <div class="H10"></div>

        <div>
            <input type="button" value="전송중지" class="AXButton" id="uploadCancelBtn" disabled="disabled" onclick="myUpload.cancelUpload();" />
            <input type="button" value="선택삭제" class="AXButton" onclick="myUpload.deleteSelect();" />
            <input type="button" value="모두삭제" class="AXButton" onclick="myUpload.deleteSelect('all');" />
            <button type="button" class="AXButton" onclick="fnObj.insertImg();">에디터에 이미지 넣기</button>
        </div>

        <div class="H20"></div>

        <div align="center">
            <input type="button" value="파라미터 추출" class="AXButtonLarge Red" onclick="fnObj.saveEditor();" />
        </div>
        <a href="test.do">Click here to test Exception handling</a>
        <a href="test2.do">Click here to test Exception handling</a>
    </body>
</html>