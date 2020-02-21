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
    
    <title>喵购网-我的购物车</title>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
   	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/common.css"/>
    <link rel="stylesheet" href="css/cart.css"/>
    <script type="text/javascript" src="js/cart.js"></script> 

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
                    <a href="account.jsp">我的喵购</a>
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
               <li>我的购物车</li>
            </ul>
        </div>
        <div class="account-search">
		   <div style="margin-left: 450px;margin-top:15px;">
            <input type="text"/>
            <div class="search-btn"><a  href="">搜索</a></div>
			 </div>
        </div>
    </div>
    <div id="nav">您的位置：<a href="list">首页</a> > <a href="account.jsp">我的喵购</a> > 我的购物车</div>
    <div id="content">
	   <table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping">
            <tr>
				<td class="title_1"><input id="allCheckBox" type="checkbox" value="" onclick="selectAll()" />全选</td>
                <td class="title_2" colspan="2">店铺宝贝</td>
                <td class="title_3">积分</td>
                <td class="title_4">单价（元）</td>
                <td class="title_5">数量</td>
                <td class="title_6">小计（元）</td>
                <td class="title_7">操作</td>
            </tr>
            <tr>
                <td colspan="8" class="line"></td>
            </tr>
            
            <s:set var="sumPrice" value="0"/>
            <s:set var="sumNum" value="0"/>
			<s:iterator id="cartItem" value="#session.cart">
            <tr>
                     <th colspan="8" class="shopInfo">店铺： 
					      <a href="#"><s:property value="value.pi.shop"/></a> 
					      <img src="images/taobao_relation.jpg" alt="relation" /> 
				     </th>
            </tr>
            <tr id="product1">
                <td class="cart_td_1">
					   <input name="cartCheckBox" type="checkbox" value="product1" onclick="selectSingle()" />
				</td>
                <td class="cart_td_2">
					        <img src="product_images/${value.pi.picture }"  style="height:80px;width:80px;" alt="shopping"/>
				      </td>
                <td class="cart_td_3">
					      <a href="showDetailInCart?productInfoId=${value.pi.id }"><s:property value="value.pi.introduce"/></a>
				      </td>
                <td class="cart_td_4"><s:property value="value.pi.credit"/></td>
                <td class="cart_td_5">￥<s:property value="value.pi.price"/></td>
                <td class="cart_td_6">				
                    <input id="num" type="text"  value="${value.quantity }" class="num_input" 
                    onchange="window.location='updateProductQuantity?productInfoId=${value.pi.id}&quantity='+this.value;" />
				</td>
                <td class="cart_td_7"><s:property value="value.quantity*value.pi.price"/></td><!-- 小计 -->
                <td class="cart_td_8"><a href="deleteSelectedItem?productInfoId=${value.pi.id }">删除</a></td>
            </tr>
            <s:set var="sumPrice" value="#sumPrice+value.quantity*value.pi.price"></s:set>
            <s:set var="sumNum" value="#sumNum+value.quantity"></s:set>
            </s:iterator>

			    <tr><td class="blank"></td></tr>
			    <tr><td colspan="8" class="line"></td></tr>
			    <tr><td class="blank"></td></tr>
			    <tr>
		          <td class="shopend" colspan="2">
					     <span><a href="clearCart" >清空购物车</a></span>
					  <td class="shopend"  colspan="2">
					     <span>已选商品</span>
						  <span style="font-size: 20px;color:#FB5B0B;"> <s:property value="#sumNum"/>  </span>件
					  </td>
					  <td class="shopend"  colspan="2">
					     <span>合计:(不含运费)</span>
					     <span style="color:#FB5B0B;">￥<s:property value="#sumPrice"/> 
					     <s:set var="sumPrice" value="#sumPrice" scope="session"></s:set>
					     </span>
					  </td>
					  <td class="settle" colspan="2">
						   <a href="addOrderInfo" >结&nbsp;算</a>
					  </td>
			    </tr>		    
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
