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
    
    <title>喵购网-登录</title>
    <meta charset="UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<link rel="stylesheet" type="text/css" href="css/common.css">
  </head>
   
<body>
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				 <form class="login100-form" action="login" method="post" name="loginForm">
					<span class="login100-form-title p-b-49"> <s:text name="login.title"/></span>
					 <div> 
                        <font color="red" size="2px"><s:property value="message"/></font>
                    </div>
                    
					<div class="wrap-input100">
						<div class="label-input100">
						     <s:text name="userName"/>
						</div>
						<s:textfield class="input100" type="text" name="ui.userName" placeholder="%{getText('userName_tip')}"/>
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
                    <br>
					<div class="wrap-input100">
						<div class="label-input100">
						  <s:text name="password"/>
						</div>
						<s:textfield class="input100" type="password" name="ui.password" placeholder="%{getText('password_tip')}"/>
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>

					<div class="text-right p-t-8 p-b-31">
						<a href="javascript:"><s:text name="forget"/></a>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" type="submit"> <s:text name="login.title"/></button>
						</div>
					</div>

					<div class="txt1 text-center p-t-54 p-b-20">
						<span> <s:text name="third_login"/></span>
					</div>

					<div class="flex-c-m">
						<a href="#" class="login100-social-item bg1">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="#" class="login100-social-item bg2">
							<i class="fa fa-twitter"></i>
						</a>

						<a href="#" class="login100-social-item bg3">
							<i class="fa fa-google"></i>
						</a>
					</div>

					<div class="flex-col-c p-t-25">
						<a href="register.jsp" class="txt2"> <s:text name="no_account"/>  </a>
					</div>
				</form>
			</div>
		</div>
	</div>
    
<!--尾部开始-->
	<div class="end">地址：上海市嘉定区曹安公路4800号同济大学<br> 
	电话：6958-88888888&nbsp; 邮箱：zhaodeze@miaogou.com  &nbsp;邮编：100100<br>
	版权所有:上海喵购电商责任有限公司&nbsp;　技术支持：17717078595
	</div>
<!--尾部结束-->
</body>
</html>
