<%@ page import="java.util.Collection" %>
<%@ page import="Beans.Follow" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: duchenguang
  Date: 2017/1/12
  Time: 下午12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="css/reply.css"/>
    <script src="js/jquery-2.2.0.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/reply.js" type="text/javascript" charset="utf-8"></script>
</head>
<%

    String PID = request.getParameter("PID");
    String PTitle = request.getParameter("PTitle");
    String PMaker = request.getParameter("PMaker");
    String PMakerImg = request.getParameter("PMakerImg");
    String PCreteTime = request.getParameter("PCreateTime");
    String AID = request.getParameter("AID");
    String PLookNumber = request.getParameter("PLookNumber");
    String PReplyNumber = request.getParameter("PReplyNumber");
    String PContent = request.getParameter("PContent");
%>
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
        <div class="pgt">
            <div class="page">
                <div class="page_back">
                    <a href="HomePage">返回论坛</a>
                </div>
                <div class="pg">
                    <%
                        int currentPage = (int)request.getAttribute("currentPage");
                        int pageNumber = (int)request.getAttribute("pageNumber");
                        for(int i = 1;i<=pageNumber;i++){
                            if(i==currentPage){

                    %>
                    <a class="pg_style"><%=i%></a>
                    <%
                        }else {
                    %>
                    <a href="ShowDetail?PID=<%=PID%>&PTitle=<%=PTitle%>&PMaker=<%=PMaker%>&PMakerImg=<%=PMakerImg%>&PCreateTime=<%=PCreteTime%>&AID=<%=AID%>&PLookNumber=<%=PLookNumber%>&PReplyNumber=<%=PReplyNumber%>&PContent=<%=PContent%>&currentPage=<%=i%>&pageNumber=<%=pageNumber%>"><%=i%></a>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <a href="#r_post" class="new_thread">
                <span>回帖</span>
            </a>
        </div>
        <div class="postlist">
            <div class="pl_tit">
                <div class="pls">
                    <span class="count"><em><%=PLookNumber%></em>阅读</span>
                    <span class="pipe"></span>
                    <span class="count"><em><%=PReplyNumber%></em>回复</span>
                </div>
                <h2><%=PTitle%></h2>
            </div>
            <%
                if(currentPage==1){
            %>
            <div id="user_top" class="pl_contain">
                <div class="pls">
                    <h3><%=PMaker%></h3>
                    <div class="user_prop">
                        <div class="user_img"><img src="<%=PMakerImg%>"></div>
                    </div>
                </div>
                <div class="plc">
                    <div  class="plc_tit">
                        <img src="img/online_member.png" />
                        <em>发表于 <%=PCreteTime%></em>
                        <strong>1楼 (楼主)</strong>
                    </div>

                    <div class="plc_contain"><%=PContent%></div>
                    <h3>SIGNATURE</h3>
                    <div class="polin"><a href="#r_post"><img src="img/fastreply.png"/>回复</a></div>
                </div>
            </div>
            <%
                }
            %>
            <%
                Collection<Follow> follows = (Collection<Follow>) request.getAttribute("follows");
                Iterator<Follow> it = follows.iterator();
                int floor = 1;
                while(it.hasNext()){
                    floor++;
                    Follow f = it.next();
            %>
            <div id="user_reply" class="pl_contain">
                <div class="pls">
                    <h3><%=f.getMaker()%></h3>
                    <div class="user_prop">
                        <div class="user_img"><img src="<%=f.getMakerImg()%>"></div>
                        <div class="tns">
                            <span><%=f.getMakerPostNumber()%><em>帖子</em></span>
                            <span><%=f.getMakerLookNumber()%><em>人气</em></span>
                            <span><%=Integer.parseInt(f.getMakerFollowNumber())%10+1%><em>等级</em></span>
                        </div>
                    </div>
                </div>
                <div class="plc">
                    <div  class="plc_tit">
                        <img src="img/online_member.png" />
                        <em>发表于 <%=f.getCreateTime()%></em>
                        <strong><%=(currentPage-1)*10+floor%>楼</strong>
                    </div>
                    <div class="plc_contain"><%=f.getContent()%></div>
                    <h3>SIGNATURE</h3>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <%
            if(currentPage!=pageNumber){
        %>
        <div class="pg_btn">
            <a href="ShowDetail?PID=<%=PID%>&PTitle=<%=PTitle%>&PMaker=<%=PMaker%>&PMakerImg=<%=PMakerImg%>&PCreateTime=<%=PCreteTime%>&AID=<%=AID%>&PLookNumber=<%=PLookNumber%>&PReplyNumber=<%=PReplyNumber%>&PContent=<%=PContent%>&currentPage=<%=currentPage+1%>&pageNumber=<%=pageNumber%>">下一页</a>
        </div>
        <%
            }
        %>
        <div id="r_post" class="f_post">
            <h2>回帖</h2>
            <%
                Object name = session.getAttribute("userName");
                if(name == null){
            %>
            <div class="no_post">
                请<a href="login2.jsp" class="post_style">登录</a>后回复
            </div>
            <%
            }else{
            %>
            <div class="bm_c">
                <form method="post" action="CreateFollow?AID=<%=AID%>&PID=<%=PID%>&maker=<%=obj.toString()%>&PTitle=<%=PTitle%>" class="form_sub" enctype="multipart/form-data">
                    <div class="bar">
                        <div class="inputFileWrapper">
                            <label class="laber" for="inputFile">
                                <input type="file" accept="imgage/*" id="inputFile" name="image" enctype="multipart/form-data"/>
								        <span class="custorm-style">
								            <span class="left-button">回复图片</span>
							            	<span class="right-text" id="rightText"></span>
								       	</span>
                            </label>
                        </div>
                    </div>
                </form>
                <div class="pls" style="float: left;">
                    <h3><%=session.getAttribute("userName")%></h3>
                    <div class="user_prop">
                        <div class="user_img"><img src="<%=session.getAttribute("Img")%>"></div>
                        <div class="tns">
                            <span><%=session.getAttribute("PostNumber").toString()%><em>帖子</em></span>
                            <span><%=session.getAttribute("LookNumber").toString()%><em>人气</em></span>
                            <span><%=Integer.parseInt(session.getAttribute("FollowNumber").toString())/10+1%><em>等级</em></span>
                        </div>
                    </div>
                </div>
                <div class="textbox" contenteditable="true"></div>
                <%--<textarea name="textbox" style="display: none;" class="realbox"></textarea>--%>
                <input class="sub" type="button" value="发表回复"/>
            </div>
            <%}%>
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


