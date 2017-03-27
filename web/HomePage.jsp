<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.*,Beans.Area" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="stylesheet" type="text/css" href="css/index.css"/>
  <link rel="stylesheet" type="text/css" href="css/reset.css"/>
  <title>HomePage</title>
</head>

<body>
<div class="header">
  <div class="contain">
    <ul>
      <li class="logo header-left">Break</li>
      <li class="header-left"><a href="PersonalManager"><%
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
    <div class="container-header">
      <ul>
        <li class="li-line">今日 4967</li>
        <li class="li-line">昨日 24000</li>
        <li class="li-line">帖子 156047029</li>
        <li>会员 11510803</li>
      </ul>
    </div>
    <ul class="list-all">
      <%
        Collection<Area> areas = (Collection<Area>) request.getAttribute("Areas");
        Iterator<Area> it = areas.iterator();
        while(it.hasNext()){
          Area a = it.next();
      %>
      <li>
        <div class="list-header">
          <h2><a href="#"><%=a.getAClass()%></a></h2>
          <span>分区版主: <%=a.getAManager()%></span>
        </div>
        <div class="list-contain">
          <div class="flo_icon"><img src="img/icon1.png"/></div>
          <div class="flo_tit">
            <h3>
              <a href="AreaDetail?ATitle=<%=a.getATitle()%>&AID=<%=a.getAID()%>&ATodayNew=<%=a.getATodayNew()%>&ASize=<%=a.getASize()%>&AFollowsNumber=<%=a.getAFollowsNumber()%>&AInfo=<%=a.getAInfo()%>&statement=<%=a.getStatement()%>&AManager=<%=a.getAManager()%>"><%=a.getATitle()%></a>
              <span>今日:<em><%=a.getATodayNew()%></em></span>
            </h3>
            <p><%=a.getAInfo()%></p>
          </div>
          <div class="flo_i">
            <span class="num_o"><%=a.getASize()%></span>
            <span class="num-line">/</span>
            <span class="num-a"><%=a.getAFollowsNumber()%></span>
          </div>
          <div class="flo_by">
            <div class="last-post">
              <a href="#"><img src="<%=a.getALastUserImg()%>"/></a>
									<span class="reply">
										<span>Re:</span>
										<a href="#"><%=a.getALastPostTitle()%></a>
									</span>
              <cite>by<a href="#"><%=a.getALastUser()%></a><span title="2017-1-9 09:53">&nbsp;<%=a.getALastTime()%></span></cite>
            </div>
          </div>
        </div>
      </li>
      <%
        }
      %>
    </ul>
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
      &copy; stone cold - 2016
    </div>
  </div>
</div>
</body>
</html>
