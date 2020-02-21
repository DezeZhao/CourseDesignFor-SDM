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
    <title>喵购网-订单明细</title>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/common.css"/>
    <link rel="stylesheet" href="css/cart.css"/>
  </head>
  
<body>
    <!--scroll-head-->
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
                    <a href="list">网站首页</a>
                </div>
                <div data-toggle="arrowdown" id="arrow4" class="user-name">
                    <i class="fa fa-pencil fa-gray"></i>
                    <a href="register.jsp">注册</a>
                </div>
                <div data-toggle="arrowdown" id="arrow4" class="user-name">
                    <i class="fa fa-user fa-gray"></i>
                    <a href="login.jsp">登录</a>
                </div>
            </div>
            <!--top-right-->
            <div class="top-right">
                <div data-toggle="arrowdown" id="arrow3" class="user-name">
                    <i class="fa fa-user fa-orange"></i>
                    <a href="account.jsp">我的淘宝</a>
                </div>
                <div data-toggle="arrowdown" id="arrow4" class="user-name">
                    <i class="fa fa-shopping-cart fa-orange"></i>
                    <a href="cart.jsp">购物车</a>
                </div>
                <div data-toggle="arrowdown" id="arrow5" class="user-name">
                    <i class="fa fa-star fa-orange"></i>
                    <a href="">收藏夹</a>
                </div>
                <div data-toggle="arrowdown" id="arrow5" class="user-name">
                    <i class="fa fa-list fa-orange"></i>
                    <a href="toMyOrderInfo">我的订单</a>
                </div>
                <span class="vertical-line">|</span>
             
                <div data-toggle="arrowdown" id="arrow7" class="user-name">
                    <i class="fa fa-list-ul fa-orange"></i>
                    <a href="">网站导航</a>
                </div>
            </div>
        </div>
    </div>
  <div class="account-top-scroll">
    <div class="account-title">
        <ul>
            <li>订单明细</li>
        </ul>
    </div>
    <div class="account-search">
		   <div style="margin-left: 450px;margin-top:15px;">
            <input type="text"/>
            <div class="search-btn"><a  href="">搜索</a></div>
			 </div>
    </div>
</div>


<div id="nav">您的位置：<a href="list">首页</a> > <a href="account.jsp">我的喵购</a> > <a href="toMyOrderInfo">我的订单</a> > 订单明细</div>
<div id="content">
	 <table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping">
        <form action="" method="post" name="myform">
            <tr>
				<td class="title_1"><span>编号</td>
                <td class="title_2" colspan="2">店铺宝贝</td>
                <td class="title_3">积分</td>
                <td class="title_4">单价（元）</td>
                <td class="title_5">数量</td>
                <td class="title_6" colspan="2">小计（元）</td>
            </tr>
            <tr>
                <td colspan="8" class="line"></td>
            </tr>
            <s:set var="total" value="0"/>
			<s:iterator id="orderDetailList" value="#request.orderDetailList">
            <tr>
                <th colspan="8" class="shopInfo">店铺： 
					 <a href="#"><s:property value="productInfo.shop"/></a> 
					 <img src="images/taobao_relation.jpg" alt="relation" /> 
			    </th>
            </tr>
            <tr id="product1">
                <td class="cart_td_1">
					 <span><s:property value="id"/><i class="fa fa-star fa-orange"></i></span>
				</td>
                <td class="cart_td_2">
					 <img src="product_images/${productInfo.picture }"  style="height:80px;width:80px;" alt="shopping"/>
				</td>
                <td class="cart_td_3">
					 <a href="#"><s:property value="productInfo.introduce"/></a>
				</td>
                <td class="cart_td_4"><s:property value="productInfo.credit*num"/></td>
                <td class="cart_td_5"><s:property value="productInfo.price"/></td>
                <td class="cart_td_6">
                    <span><s:property value="num"/></span>
				</td>
                <td class="cart_td_7" colspan="2">￥<s:property value="productInfo.price*num"/></td>
            </tr>
            <tr><td class="blank"></td></tr>
            <s:set var="total" value="#total+productInfo.price*num"/>
            </s:iterator>
			<tr><td colspan="8" class="line"></td></tr>
			<tr><td class="blank"></td></tr>
			<tr>
			    <td class="shopend"  colspan="8" style="text-align: right;padding-right: 10px;">
					  <span>合计:(不含运费)</span>
					  <span style="color:#fe6400;font-size: 19px;">￥<s:property value="#total"/></span>
			    </td>
			</tr>
        </form>
        
    </table>
  </div>
   <!--尾部开始-->
	<div class="end">地址：上海市嘉定区曹安公路4800号同济大学<br> 
	电话：6958-88888888&nbsp; 邮箱：zhaodeze@miaogou.com  &nbsp;邮编：100100<br>
	版权所有:上海喵购电商责任有限公司&nbsp;　技术支持：17717078595
	</div>
    <!--尾部结束-->
    <script src="js/jquery_1.9.js"></script>
    <script src="js/common.js"></script>
</body>
</html>
