<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>AXISJ</title>
        <script type="text/javascript">
            isIndex = true;
            jQuery(document).ready(function () {

                new AXReq("samples/AXGrid/selectorData.php",
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

                    /*
                    mask.setContent({
                        width: 50, height: 50,
                        html: "<i class='fa fa-circle-o-notch fa-spin' style='font-size:50px;'></i>"
                    });
                    mask.open();
                     */

                }, 500);
            });
        </script>
    </head>
    <body>
        <div class="ax-layer-1" id="ax_layer_1"></div>
    </body>
</html>