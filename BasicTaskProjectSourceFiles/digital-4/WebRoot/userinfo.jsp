<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>显示用户信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="css/Layout.css" rel="stylesheet" type="text/css" />
	<SCRIPT type=text/javascript src="js/scrolltop.js"></SCRIPT>
	<SCRIPT type=text/javascript src="js/qq.js"></SCRIPT >
	
	<link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>  

  </head>
  
  <body>   <!--scroll-head-->
    <div class="scroll-head"></div>
    <!--top-->
    <div class="top-wrapper">
        <div class="top-info">
            <div class="top-left">
                <div data-toggle="arrowdown" id="arrow2" class="msg-info">
                    <i class="fa fa-envelope fa-gray"></i>
                    <a href="">消息</a>
                </div>
                <div data-toggle="arrowdown" id="arrow4" class="user-name">
                    <i class="fa fa-bookmark fa-gray"></i>
                    <a href="index.jsp">网站首页</a>
                </div>
                <div data-toggle="arrowdown" id="arrow4" class="user-name">
                    <i class="fa fa-pencil fa-gray"></i>
                    <a href="reg.jsp">注册</a>
                </div>
                <div data-toggle="arrowdown" id="arrow4" class="user-name">
                    <i class="fa fa-user fa-gray"></i>
                    <a href="login.jsp">登录</a>
                </div>
            </div>
            <!--top-right-->
            <div class="top-right">
                <div data-toggle="arrowdown" id="arrow3" class="user-name">
                    <a href="">我的淘宝</a>
                    <span class="down-icon"></span>
                </div>
                <div data-toggle="arrowdown" id="arrow4" class="user-name">
                    <i class="fa fa-shopping-cart fa-orange"></i>
                    <a href="">购物车</a>
                </div>
                <div data-toggle="arrowdown" id="arrow5" class="user-name">
                    <i class="fa fa-star fa-gray"></i>
                    <a href="">收藏夹</a>
                    <span class="down-icon"></span>
                </div>
                
                <a class="a-float-left" href="">商品分类</a>
                <span class="vertical-line">|</span>
             
                <div data-toggle="arrowdown" id="arrow7" class="user-name">
                    <i class="fa fa-list-ul fa-orange"></i>
                    <a href="">网站导航</a>
                    <span class="down-icon"></span>
                </div>
                <!--hidden-box-->
                <div data-toggle="hidden-box" id="nav-box3" class="my-taobao-box">
                    <ul>
                        <li>已买到的宝贝</li>
                        <li>我的足迹</li>
                        <li>我的上新</li>
                        <li>我的优惠</li>
                    </ul>
                </div>
                <div data-toggle="hidden-box" id="nav-box5" class="get-box">
                    <ul>
                        <li>收藏的宝贝</li>
                        <li>收藏的店铺</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    	注册用户的信息如下：<br><br>
    	用户名称：<s:property value="user.userName"/><br>
    	登录密码：<s:property value="user.password"/><br>
    	真实姓名：<s:property value="user.realName"/><br>
    	通信地址：<s:property value="user.address"/><br>
    	电子邮件：<s:property value="user.email"/><br>
     <script src="js/jquery_1.9.js"></script>
    <script src="js/main2.js"></script>
    <script src="js/img-show.js"></script>
<!--尾部开始-->
	<div class="end">
	  	<div class="cont" ><div class="cont_a fl" >地址：江苏省盐城市亭湖区大庆中路100号 电话：0515-88888888 邮箱：dongdi@yaohoo.com.cn 邮编：224000<br />
			版权所有：苏州同凯信息有限公司　技术支持：0515-99999999</div>
		<div class="cont_b fl" ><img src="images/008.jpg"/></div>
	</div>
<!--尾部结束-->
	<DIV style="DISPLAY: none;POSITION: fixed; TEXT-ALIGN: center; LINE-HEIGHT: 30px; WIDTH: 30px; BOTTOM: 100px; HEIGHT: 33px; FONT-SIZE: 12px; CURSOR: pointer; RIGHT: 0px; _position: absolute; _right: auto" id=goTopBtn><IMG border=0 src="images/lanren_top.jpg"></DIV>
  </body>
</html>
