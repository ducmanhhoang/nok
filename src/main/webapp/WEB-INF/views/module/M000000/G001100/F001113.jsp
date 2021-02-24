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
             * Based		: jQuery
             * Javascript 	: AXJ.js, AXInput.js, AXSelect.js
             * CSS		: AXJ.css, AXInput.css, AXSelect.css
             */
            var menuId = "F001113";
            var langCd = '${langCd}';

            var fnObj = {
                pageStart: function () {
                    $("#AXSelect_m1").bindSelect({
                        reserveKeys: {
                            options: "list",
                            optionValue: "codeId",
                            optionText: "codeNm"
                        },
                        ajaxUrl: "../../M000000/G001400/F001411/selectCodeList.do",
                        ajaxPars: {codeGroupId: 'A_PROGRAM_TYPE'},
                        ajaxAsync:false,
                        isspace: true,
                        isspaceTitle: "Please select",
                        setValue:this.optionValue,
                        alwaysOnChange: true,
                        onLoad: function () {
                            trace("load : " + Object.toJSON(this));
                        },
                        onchange: function () {
                            trace("change : " + Object.toJSON(this));
                        }
                    });
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

                    <h3>다단계 선택 방식</h3>
                    <label class="AXInputLabel">
                        <select name="" class="AXSelect" id="AXSelect_m1" style="width:200px;" tabindex="1"></select>
                    </label>

                </div>


            </div>

        </div>

    </body>
</html>        
