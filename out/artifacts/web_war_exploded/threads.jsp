<%@ page import="java.util.Collection" %>
<%@ page import="Beans.Post" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: duchenguang
  Date: 2017/1/11
  Time: 上午11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="css/thread.css"/>
    <script src="js/jquery-2.2.0.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/thread.js" type="text/javascript" charset="utf-8"></script>
</head>
<%
    String ATitle = request.getParameter("ATitle");
    String AID = request.getParameter("AID");
    String ATodayNew = request.getParameter("ATodayNew");
    String ASize = request.getParameter("ASize");
    String AFollowsNumber = request.getParameter("AFollowsNumber");
    String AInfo = request.getParameter("AInfo");
    String AManager = request.getParameter("AManager");
    String Statements = request.getParameter("statement");
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
        <div class="user_link">
            <ul>
                <li>
                    <a href="#" class="user_con">
                        <b></b>主题
                    </a>
                </li>
                <li>
                    <a href="#" class="user_main">
                        <b></b>用户中心
                    </a>
                </li>
            </ul>
        </div>
        <form method="post" action="">
            <div class="search_box">
                <input class="search" type="text" name="search" placeholder="搜索其实很简单！ (^_^)" />
            </div>
        </form>
        <%
            int currentPage = (int)request.getAttribute("currentPage");
            int pageNumber = (int)request.getAttribute("pageNumber");
            if(currentPage==1){
        %>
        <div class="boardnav">
            <h2><%=ATitle%><b></b></h2>
            <div class="form_info">
                <a href="#"><img src="img/icon1.png"/></a>
                <div class="form_prop">
                    <div class="count">
                        <span>今日:</span><em><%=ATodayNew%></em><span>主题:</span><em><%=ASize%></em><span>帖子数:</span><em><%=AFollowsNumber%></em>
                    </div>
                    <div class="desc"><%=AInfo%></div>
                    <div class="auther">版主:<em><%=AManager%></em></div>
                </div>
            </div>
            <div class="form_rule">
                <div class="form_rule_head">
                    <h3><img src="img/laba.png"/>版块公告</h3>
                </div>
                <div class="inner">
                    <%=Statements%><br><br>
                </div>
            </div>
        </div>
        <%
            }
        %>
        <div class="pgt">
            <div class="page">
                <div class="page_back">
                    <a href="HomePage">返回论坛</a>
                </div>
                <div class="pg">
                    <%
                        for(int i = 1;i<=pageNumber;i++){
                            if(i==currentPage){
                    %>
                    <a class="pg_style"><%=i%></a>
                    <%
                            }else{
                    %>
                    <a href="AreaDetail?ATitle=<%=ATitle%>&AID=<%=AID%>&ATodayNew=<%=ATodayNew%>&ASize=<%=ASize%>&AFollowsNumber=<%=AFollowsNumber%>&AInfo=<%=AInfo%>&statement=<%=Statements%>&AManager=<%=AManager%>&currentPage=<%=i%>&pageNumber=<%=pageNumber%>"><%=i%></a>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <a href="#f_post" class="new_thread">
                <span>发帖</span>
            </a>
        </div>
        <table cellpadding="0" cellspacing="0" class="threadlist">
            <tr class="threadlist_hd">
                <td id="thread_head_fir" class="threadlist_hd_left"><a href="#">最新</a></td>
                <td class="threadlist_hd_left"><a href="#">热门</a></td>
                <td class="threadlist_hd_left"><a href="#">精华</a></td>
                <td class="threadlist_hd_right by">作者</td>
                <td class="threadlist_hd_right num">回复/查看</td>
                <td class="threadlist_hd_right by">最后发表 </td>
            </tr>
        </table>
        <div class="threadlist_main">
            <%
                Collection<Post> posts = (Collection<Post>) request.getAttribute("Posts");
                Iterator<Post> it = posts.iterator();
                while(it.hasNext()){
                    Post p = it.next();
            %>
            <div class="threadlist_bd" style="display: block;">
                <div class="ico"><img src="<%=p.getMakerImg()%>"/></div>
                <div class="common"><a href="ShowDetail?PID=<%=p.getID()%>&PTitle=<%=p.getTitle()%>&PMaker=<%=p.getMaker()%>&PMakerImg=<%=p.getMakerImg()%>&PCreateTime=<%=p.getCreateTime()%>&AID=<%=AID%>&PLookNumber=<%=p.getLookNumber()%>&PReplyNumber=<%=p.getReplyNumber()%>&PContent=<%=p.getContent()%>"><%=p.getTitle()%></a></div>
                <div class="delete">
                    <a href="javascript:"></a>
                </div>
                <div class="byone">
                    <span><%=p.getMaker()%></span>
                    <span style="color: #f26c4f;"><%=p.getCreateTime()%></span>
                </div>
                <div class="num">
                    <span><%=p.getReplyNumber()%></span>
                    <span style="color: #c2a599;"><%=p.getLookNumber()%></span>
                </div>
                <div class="by">
                    <span><%=p.getLastUSer()%></span>
                    <span style="color: #c2a599;"><%=p.getLastTime()%></span>

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
            <a href="AreaDetail?ATitle=<%=ATitle%>&AID=<%=AID%>&ATodayNew=<%=ATodayNew%>&ASize=<%=ASize%>&AFollowsNumber=<%=AFollowsNumber%>&AInfo=<%=AInfo%>&statement=<%=Statements%>&AManager=<%=AManager%>&currentPage=<%=currentPage+1%>&pageNumber=<%=pageNumber%>">下一页</a>
        </div>
        <%
            }
        %>
        <div id="f_post" class="f_post">
            <h2>发帖</h2>
            <%
                Object name = session.getAttribute("userName");
                if(name == null){
                    %>
            <div class="no_post">
                请<a href="login2.jsp" class="post_style">登录</a>后发帖
            </div>
            <%
                }else{
            %>
            <div class="bm_c">
                <div class="pbt_cl">
                    请输入主题<input type="text" name="title" class="title" /><span>还可以输入50个字符</span>
                </div>
                <form method="post" action="CreatePost?AID=<%=AID%>&name=<%=obj.toString()%>&makerImg=<%=session.getAttribute("Img").toString()%>" class="form_sub" enctype="multipart/form-data">

                    <div class="bar">
                        <div class="inputFileWrapper">
                            <label class="laber" for="inputFile">
                                <input type="file" accept="image/*" id="inputFile" name="image"/>
								        <span class="custorm-style">
								            <span class="left-button">上传图片</span>
							            	<span class="right-text" id="rightText"></span>
								       	</span>
                            </label>
                        </div>
                    </div>

                </form>
                <div class="textbox" contenteditable="true"></div>
                <%--<input type="text" name="textbox" style="display: none;" class="realbox"/>--%>
                <%--<textarea name="textbox" style="display: none;" class="realbox"></textarea>--%>
                <input class="sub" type="button" value="发表帖子"/>
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
