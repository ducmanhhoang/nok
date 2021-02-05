<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
        
        <meta name="_csrf" content="${_csrf.token}"/>
        <meta name="_csrf_header" content="${_csrf.headerName}"/>
    </head>
<body>
    <div id="AXPage">
        <!-- AXPageBody -->
        <div id="AXPageBody">
            <div id="demoPageTabTarget" class="AXdemoPageTabTarget"></div>
            <div class="ax-wrap">
                <sitemesh:write property='body' />
                <div id="AXProgress" class="AXLoading2"></div>
            </div>
        </div>
        <!-- AXPageBody -->
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/samples/page.js"></script>
    </div>
</body>
</html>