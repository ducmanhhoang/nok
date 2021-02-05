<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- META -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1" />
        <meta name="apple-mobile-web-app-capable" content="yes">
        <!-- TITLE -->
        <title>Login</title>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/js/ui/axisj.ico" type="image/x-icon" />
        <link rel="icon" href="${pageContext.request.contextPath}/resources/js/ui/axisj.ico" type="image/x-icon" />
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/resources/js/ui/AXJ.png" />
        <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/js/ui/AXJ.png" />

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/js/ui/arongi/page.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/js/ui/arongi/AXJ.min.css" />

        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dist/AXJ.min.js"></script>

        <script language="JavaScript">
            window.toast = new AXNotification();
            toast.setConfig({ eatUpTime: 1000, targetID: "basicToast", type: "toast" });
            $(window).load(function () {

                if ($(window.parent.document).find('iframe').length > 0) {
                    console.log('reload');
                    window.parent.location.reload();
                }

                var msg = '<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>';
            <c:remove scope="session" var="SPRING_SECURITY_LAST_EXCEPTION"/>

                if (msg != null && msg != '' && msg != 'null') {
                    alert(msg);
                }

                $('body').keypress(function (event) {
                    if (event.keyCode == 13) {
                        event.preventDefault();
                        login();
                    }
                });
            });


            function login() {
                if ($('#loginId').val() == '' || $('#loginPwd').val() == '') {
                    toast.push({eatUpTime:1000, body:'<b>Warning</b> Please enter your credential !!', type:'Warning'});
                    return;
                }
                document.f000014LoginForm.method = "post";
                document.f000014LoginForm.action = "<c:url value='/login'/>";
                document.f000014LoginForm.submit();
            }
        </script>
    </head>
    <body>
        <form id="f000014LoginForm" name="f000014LoginForm">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <div id="AXModelControlTarget2" style="width:300px; margin: 80px auto;">
                <table class="AXFormTable">
                    <colgroup>
                        <col width="80">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr class="reserved">
                            <th>
                                <div class="tdRel">Login ID</div>
                            </th>
                            <td class="last guestSelected">
                                <div class="tdRel">
                                    <div class="wrapInput">
                                        <input class="AXInput W200" id="loginId" type="text" maxlength="50">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr class="reserved">
                            <th>
                                <div class="tdRel">Password</div>
                            </th>
                            <td class="last guestSelected">
                                <div class="tdRel">
                                    <div class="wrapInput">
                                        <input class="AXInput W200" id="loginPwd" type="password" maxlength="50">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="last" colspan="2">
                                <button type="button" class="AXButton" onclick="login();">Sign in</button>
                            </td>
                        </tr>
                    </tbody>
                </table>			
            </div>
        </form>
    </body>
</html>