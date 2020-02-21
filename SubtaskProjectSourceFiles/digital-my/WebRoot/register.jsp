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
    
    <title>喵购网-注册 </title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="UTF-8">
	<meta name="viewport"  content="width=device-width, initial-scale=1">
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
			    <!-- 使用Struts 2标签完成注册功能 -->
				<s:form cssClass="login100-form validate-form" action="register" method="post" name="regForm">
					<span class="login100-form-title p-b-49">
					    <s:text name="register.title"/> 
					</span>
					<div class="wrap-input100">
					    <div class="label-input100">
					        <s:text name="userName"/> 
					        <font color="red">${fieldErrors["user.userName"][0]}</font>
					    </div>
						<s:textfield  cssClass="input100" name="user.userName" placeholder="%{getText('userName_tip')}"/>
						<span class="focus-input100" data-symbol="&#xf207;"></span>
					</div>
                    <br>
					<div class="wrap-input100">
						<div class="label-input100">
						    <s:text name="password"/> 
						    <font color="red">${fieldErrors["user.password"][0]}</font>
						</div>
						<s:textfield  cssClass="input100"  name="user.password" type="password" placeholder="%{getText('password_tip')}"/>
						<span class="focus-input100" data-symbol="&#xf191;"></span>
					</div>
					<br>
					<div class="wrap-input100">
						<div class="label-input100">
						     <s:text name="repassword"/> 
						     <font color="red">${fieldErrors["repassword"][0]}</font>
						</div>
						<s:textfield  cssClass="input100"  name="repassword" type="password" placeholder="%{getText('repassword_tip')}"/>
						<span class="focus-input100" data-symbol="&#xf191;"></span>
					</div>
					<br>
					<div class="wrap-input100">
						<div class="label-input100">
						     <s:text name="realName"/> 
						     <font color="red">${fieldErrors["user.realName"][0]}</font>
						</div>
						<s:textfield  cssClass="input100"  name="user.realName" placeholder="%{getText('realName_tip')}"/>
						<span class="focus-input100" data-symbol="&#xf207;"></span>
					</div>

				    <%-- <div class="wrap-input100">
						<div class="label-input100">
						    <s:text name="sex"/> 
						    <font color="red">${fieldErrors["user.sex"][0]}</font>
						</div>
						<s:select cssStyle="border:0;display: block;position: relative;color:#979393;outline: none" cssClass="input100"  
						name="user.sex" list="#{'0':'男','1':'女'}" headerKey="" headerValue="%{getText('sex_tip')}"/>
						<span class="focus-input100" data-symbol="&#xf211;"></span>
					</div> --%>
					<br>
					<div class="wrap-input100" >
						<div class="label-input100">
						    <s:text name="address"/> 
						    <font color="red">${fieldErrors["user.address"][0]}</font>
						</div>
						<s:textfield cssClass="input100"  name="user.address" placeholder="%{getText('address_tip')}"/>
						<span class="focus-input100" data-symbol="&#xf175;"></span>
					</div>
					<br>
					<%-- <div class="wrap-input100">
						<div class="label-input100">
						    <s:text name="question"/> 
						    <font color="red">${fieldErrors["user.question"][0]}</font>
						</div>
						<s:select   cssStyle="border:0;display: block;position: relative;color:#979393;outline:none;" 
						cssClass="input100"  name="user.question" 
						list="#{'0':'您的出生地是？',
						        '1':'您父亲的姓名是？',
						        '2':'您母亲的姓名是？',
						        '3':'对您一生影响最大的人是？'}" headerKey="" headerValue="%{getText('question_tip')}"/>
						<span class="focus-input100" data-symbol="&#xf3fa;"></span>
					</div>
					<br>
					<div class="wrap-input100">
						<div class="label-input100">
						    <s:text name="answer"/> 
						    <font color="red">${fieldErrors["user.answer"][0]}</font>
						</div>
						<s:textfield cssClass="input100"  name="user.answer" placeholder="%{getText('answer_tip')}"/>
						<span class="focus-input100" data-symbol="&#xf108;"></span>
					</div>
					 --%>
					<div class="wrap-input100">
						<div class="label-input100">
						    <s:text name="email"/> 
						    <font color="red">${fieldErrors["user.email"][0]}  </font>
						</div>
						<s:textfield cssClass="input100"  name="user.email" placeholder="%{getText('email_tip')}"/>
						<span class="focus-input100" data-symbol="&#xf15a;"></span>
					</div>
					<br><br>
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" type="submit"><s:text name="register.title"/></button>
						</div>
					</div>
					<br>
					
					<div class="flex-col-c p-t-25">
						<a href="login.jsp" class="txt2"><s:text name="has_account"/> </a>
					</div>	
				</s:form>
			</div>
		</div>
	</div>
    <!--尾部开始-->
	<div class="end">地址：上海市嘉定区曹安公路4800号同济大学<br> 
	电话：6958-88888888&nbsp; 邮箱：zhaodeze@miaogou.com  &nbsp;邮编：100100<br>
	版权所有:上海喵购电商责任有限公司&nbsp;　技术支持：17717078595
	</div>
    <!--尾部结束-->
    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="js/login.js"></script>
  </body>
</html>
