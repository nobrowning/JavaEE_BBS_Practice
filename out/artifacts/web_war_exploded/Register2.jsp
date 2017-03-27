<%--
  Created by IntelliJ IDEA.
  User: duchenguang
  Date: 2017/1/12
  Time: 下午6:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/register.css"/>
    <link rel="stylesheet" type="text/css" href="css/reset.css"/>
    <script src="js/login.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/register.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div class="contain">
    <div class="header">
        <div class="contain">
            <ul>
                <li class="logo header-left"><a class="logo" href="HomePage">Break</a></li>
                <li class="header-left"><a href="/PersonalManager"><%
                    String show = "block";
                    Object obj =  session.getAttribute("userName");
                    if(obj==null) {
                        out.print("你好");
                    }else{
                        out.print(obj.toString());
                        show="none";
                    }
                %></a> ，欢迎来到晨光贴吧!</li>
                <li class="header-right" style="display:<%=show%>"><a href="/Register2.jsp">注册</a></li>
                <li class="line" style="display:<%=show%>"></li>
                <li class="header-right" style="display:<%=show%>"><a href="/login2.jsp">登录</a></li>
            </ul>
        </div>
    </div>
    <div class="main">
        <h1 class="main-header">Register Form</h1>
        <form method="post" class="login-form" action="Register">
            <div>
                <input type="text" name="name" id="name" placeholder="Username" />
                <img src="img/user.png"/>
            </div>
            <div class="name_space">${result}</div>
            <div>
                <input type="password" name="pass" id="pass" placeholder="Password" />
                <img src="img/pass.png"/>
            </div>
            <div class="passwd_space"></div>
            <div>
                <input type="email" name="email" id="email" placeholder="Email" />
                <img src="img/letter.png"/>
            </div>
            <div class="email_space"></div>
            <div>
                <input type="date" name="birthday" id="birthday" placeholder="Birthday" />
                <img src="img/gift.png"/>
            </div>
            <div class="birthday_space"></div>
            <input type="submit" name="loginsub" id="loginsub" value="Join" />
        </form>
    </div>
    <div class="copy">
        &copy; stone cold - 2017
    </div>
</div>
</body>
</html>

