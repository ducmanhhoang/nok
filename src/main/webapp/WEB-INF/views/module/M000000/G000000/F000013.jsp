<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>

        <script type="text/javascript">
            var pageID = "Home";
            var fnObj = {
                pageStart: function () {
                    console.log(token);
                    console.log(header);
                    
                    
                    
                    
                    new AXReq("../../M000000/G000000/F000013/test.json",
                            {pars: "", onsucc: function (res) {
                                    trace(res);
                                }
                            });


                    new AXReq("../../M000000/G000000/F000013/test1.json",
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
                    }, 500);
                }
            };
            jQuery(document).ready(fnObj.pageStart.delay(0.1));
        </script>
    </head>
    <body>
        <div class="ax-layer-1" id="ax_layer_1"></div>
    </body>
</html>
