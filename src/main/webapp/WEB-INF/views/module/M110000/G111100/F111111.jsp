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
        <script>
            /**
             * Require Files for AXISJ UI Component...
             * Based		: jQuery
             * Javascript 	: AXJ.js, AXTab.js
             * CSS			: AXTabs.css
             */
            var menuId = "F111111";
            var langCd = '${langCd}';
            var fnObj = {
                pageStart: function () {
                    new AXReq("test2.json",
                            {pars: {langCd: '${langCd}'}, onsucc: function (res) {
                                    trace(res);
                                }
                            });


                    new AXReq("test3.json",
                            {pars: "", onsucc: function (res) {
                                    trace(res);
                                }
                            });


                    setTimeout(function () {
                        var po = [];
                        axf.each(sampleTree, function () {
                            po.push('<div class="ax-col-3">');
                            po.push('<div class="ax-unit secBlock">');
                            po.push('<h3>', this.label, '</h3>');
                            po.push('<ul id="comon">');
                            axf.each(this.cn, function () {
                                po.push('<li><a href="', this.url, '">', this.label, '</a></li>');
                            });
                            po.push('</ul>');
                            po.push('</div>');
                            po.push('</div>');
                        });
                        po.push('<div class="ax-clear"></div>');
                        $("#ax_layer_1").html(po.join(''));
                    }, 0);

                }
            };
            jQuery(document.body).ready(function () {
                fnObj.pageStart()
            });
        </script>
    </head>
    <body>
        <div class="ax-layer-1" id="ax_layer_1"></div>
    </body>
</html>
