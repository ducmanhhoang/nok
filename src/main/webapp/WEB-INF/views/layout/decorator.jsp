<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><sitemesh:write property='title' /></title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/js/ui/axisj.ico" type="image/x-icon" />
    <link rel="icon" href="${pageContext.request.contextPath}/resources/js/ui/axisj.ico" type="image/x-icon" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/resources/js/ui/AXJ.png" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/js/ui/AXJ.png" />

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/js/ui/arongi/page.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/js/ui/arongi/AXJ.min.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dist/AXJ.min.js"></script>

<sitemesh:write property='head' />
</head>
<body>
	
	<div id="AXPage">
        <!-- AXPageBody -->
        <div id="AXPageBody" style="clear: both; margin-top: 120px;">
            <div class="ax-wrap">
                <sitemesh:write property='body' />
            </div>
        </div>
        <!-- AXPageBody -->
    </div>

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/samples/page.js"></script>
    
    <script type="text/javascript">
        isIndex = true;
        jQuery(document).ready(function(){

            new AXReq("samples/AXGrid/selectorData.php",
                {pars:"", onsucc:function(res){
                    trace(res);
                }
            });


            setTimeout(function(){
                var po = [];
                axf.each(sampleTree, function(){
                    po.push('<div class="ax-col-3">');
                    po.push('<div class="ax-unit secBlock">');
                    po.push('<h3>', this.label,'</h3>');
                    po.push('<ul id="comon">');
                    axf.each(this.cn, function() {
                        po.push('<li><a href="', this.url,'">', this.label,'</a></li>');
                    });
                    po.push('</ul>');
                    po.push('</div>');
                    po.push('</div>');
                });
                po.push('<div class="ax-clear"></div>');
                $("#ax_layer_1").html(po.join(''));
            }, 500);
        });
    </script>
</body>
</html>