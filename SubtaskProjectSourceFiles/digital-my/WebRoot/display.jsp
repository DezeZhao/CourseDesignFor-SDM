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
    
    <title>喵购网-商品详细信息</title>
    <meta charset="UTF-8">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type=text/javascript src="js/display.js"></script>
	<link rel="stylesheet" href="css/display.css"/>
	<link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/common.css"/>
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
            <li>商品详细信息</li>
        </ul>
    </div>  
      <div class="account-search">
		   <div style="margin-left: 450px;margin-top:15px;">
            <input type="text"/>
            <div class="search-btn"><a  href="">搜索</a></div>
			 </div>
    </div>
   </div>   
   <div class="product-detail-wrapper">
   	  <div class="product-detail-img">
		  <div class="box">
	        <div class="productImg-smallBox">
			     <img src="product_images/${requestScope.detailProductInfo.picture}" class="small"/>
			     <div class="mask"></div>
		     </div>
		     <div class="productImg-bigBox"> <img src="product_images/${requestScope.detailProductInfo.picture}" class="big"></div>
		  </div>
		  <div class="product-small-img">
			 <span>
			 <img src="product_images/${requestScope.detailProductInfo.picture}"/>
			 <img src="product_small_images/${requestScope.detailProductInfo.img2}"/>
			 <img src="product_small_images/${requestScope.detailProductInfo.img3}"/>
			 <img src="product_small_images/${requestScope.detailProductInfo.img4}"/>
			 </span>
		 </div>
		  <div class="product-collect-share">
			<a href=""> <i class="fa fa-share-square-o"> 分享</i></a>&nbsp;
			 <a href=""><i class="fa fa-star-o"> 收藏</i></a>&nbsp;
			 <a href=""> <i class="fa fa-bars"> ${requestScope.detailProductInfo.shop} </i></a>&nbsp;
		</div>
	</div>
	   <div class="product-detail-others">
	     <div class="product-detail-intro">
			 <span>${requestScope.detailProductInfo.introduce}</span>
		  </div>
		  <div class="product-detail-item">
		     选购商品&nbsp; <span>${requestScope.detailProductInfo.name} </span>
		  </div>
		   <div class="product-detail-item">
		     商品编号&nbsp; <span>${requestScope.detailProductInfo.code}</span>
		  </div>
		  <div class="product-detail-price">
		     销售价格&nbsp; <span>￥${requestScope.detailProductInfo.price}</span>
		  </div>
		  <div class="product-detail-item">
		     库存数量&nbsp; <span>${requestScope.detailProductInfo.inventory}件 </span>
		  </div>
		  <div class="product-detail-item">
		     选购数量&nbsp; 
			  <span> 
				  <input style="width: 30px;text-align:center;" type="text" readonly="readonly" value="1"/>
			  </span>
		  </div>
		  <div class="product-detail-price">
			  小计金额&nbsp;
			  <span>￥${requestScope.detailProductInfo.price}</span>
		  </div>
		  <div class="product-detail-item product-detail-end">
		     <ul>
			     <li><a href="">立即购买</a></li>
			     <li>
			     <a href="addToShopCart?productInfoId=${requestScope.detailProductInfo.id}">
			     <i class="fa fa-shopping-cart"></i>加入购物车</a>
			     </li>
		     </ul>
		  </div>
	</div>
   </div> 
   <div class="leader-board">
	      <table class="leader-board-table">
			    <tr>
					  <th colspan="2" class="table-head">浏览排行榜</th>
			    </tr>
			     <s:iterator id="browsePiItem" value="#session.browsePiList" status="status">
			     <s:if test="#status.index>=0 && #status.index<=6">
			    <tr class="table-row">
					  <td class="picture-td"><a href=""><img  class="browse-pic"src="product_images/${ browsePiItem.picture}" /></a></td>
					  <td class="name-td"><a href="">${ browsePiItem.name}</a></td>
			    </tr>
			     </s:if>
			    </s:iterator>
		   </table>
   </div>
   <div style="height:700px;"></div>
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
