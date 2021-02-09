<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
    <head>
        <title>Login Page</title>
        <style>
            .error {
                padding: 15px;
                margin-bottom: 20px;
                border: 1px solid transparent;
                border-radius: 4px;
                color: #a94442;
                background-color: #f2dede;
                border-color: #ebccd1;
            }

            .msg {
                padding: 15px;
                margin-bottom: 20px;
                border: 1px solid transparent;
                border-radius: 4px;
                color: #31708f;
                background-color: #d9edf7;
                border-color: #bce8f1;
            }

            #login-box {
                width: 300px;
                padding: 20px;
                margin: 100px auto;
                background: #fff;
                -webkit-border-radius: 2px;
                -moz-border-radius: 2px;
                border: 1px solid #000;
            }
        </style>
        <script type="text/javascript">
            window.onload = function () {
                var msg = '<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>';
            <c:remove scope="session" var="SPRING_SECURITY_LAST_EXCEPTION"/>
                if (msg != null && msg != '' && msg != 'null') {
                    document.getElementById("msg").innerHTML = msg;
                }

                document.addEventListener('keydown', logKey);
                document.loginForm.username.focus();
            }

            function logKey(e) {
                if (e.code === 'Enter') {
                    login();
                }
            }

            function login() {
                document.loginForm.submit();
            }
        </script>
    </head>
    <body>
        <div id="login-box">
            <h3>Sign in</h3>

            <c:if test="${param.error}">
                <div class="error" id="msg"></div>
            </c:if>

            <form name='loginForm' action="${pageContext.request.contextPath}/authenticate" method='POST'>
                <table>
                    <tr>
                        <td>User:</td>
                        <td><input type='text' name='username'></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type='password' name='password' /></td>
                    </tr>
                    <tr>
                        <td colspan='2'>
                            <button type="button" onclick="login();">Sign in</button>
                        </td>
                    </tr>
                </table>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
        </div>
    </body>
</html>