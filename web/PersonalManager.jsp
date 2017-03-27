<%@ page import="java.util.Collection" %>
<%@ page import="Beans.Post" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: duchenguang
  Date: 2017/1/12
  Time: 下午11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="css/home.css"/>
    <script src="js/home.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery-2.2.0.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
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
<div class="container">
    <div class="contain">
        <div class="home_head">
            <div class="opacity"></div>
            <h2><font><%=session.getAttribute("userName").toString()%></font>的个人空间</h2>
        </div>
        <div class="home_main">
            <div class="home_main_left">
                <h2>主题</h2>
                <div>
                    <div class="home_tit">
                        <div id="home_tit_h" class="home_tit_h">主题</div>
                        <div class="home_frm">最后发帖</div>
                        <div class="home_num"></div>
                        <div class="home_by">板块</div>
                    </div>
                    <div class="threadlist_main">
                        <%
                            Collection<Post> posts = (Collection<Post>)request.getAttribute("posts");
                            Iterator<Post> it = posts.iterator();
                            while(it.hasNext()){
                                Post p = it.next();
                        %>
                        <div class="threadlist_bd" style="display: block;">
                            <div class="common"><a href="#"><%=p.getTitle()%></a></div>
                            <div class="delete">
                                <a href="DeletePost?AID=<%=p.getAID()%>&PID=<%=p.getID()%>"></a>
                            </div>
                            <div class="by">
                                <span><%
                                    if(p.getAID().equals("1")){
                                        out.print("校园信息");
                                    }else if(p.getAID().equals("2")){
                                        out.print("学术文化");
                                    }else{
                                        out.print("二手交易");
                                    }
                                %></span>
                            </div>
                            <div class="num" >
                                <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <span style="color: #c2a599;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            </div>
                            <div class="byone">
                                <span><%
                                    if(p.getLastUSer()==null){
                                        out.print("无");
                                    }else{
                                        out.print(p.getLastUSer());
                                    }
                                %></span>
                                <span style="color: #f26c4f;"><%=p.getCreateTime()%></span>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
            <div class="home_main_right">
                <img src="<%=session.getAttribute("Img")%>" />
                <form method="post" action="/ChangeImg" enctype="multipart/form-data">
                    <div class="bar">
                        <div class="inputFileWrapper">
                            <label class="laber" for="inputFile">
                                <input type="file" accept="imgage/*" id="inputFile" name="image"/>
								        <span class="custorm-style">
								            <span class="left-button">上传头像</span>
							            	<span class="right-text" id="rightText"></span>
								       	</span>
                            </label>
                        </div>
                    </div>
                    <input type="submit" class="input_style" value="确认上传">
                </form>
                <div class="tns">
                    <span><%=session.getAttribute("PostNumber").toString()%><em>帖子</em></span>
                    <span><%=session.getAttribute("LookNumber").toString()%><em>人气</em></span>
                    <span><%=Integer.parseInt(session.getAttribute("FollowNumber").toString())/10+1%><em>等级</em></span>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <div class="contain">
        <ul class="share-group">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
        <div class="copy">
            &copy; stone cold - 2017
        </div>
    </div>
</div>
</body>
</html>
