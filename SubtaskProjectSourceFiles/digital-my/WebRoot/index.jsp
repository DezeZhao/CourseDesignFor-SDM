<%@ page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>喵购网-首页</title>
    <meta charset="UTF-8">
    <sx:head/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/common.css"/> 
    <link rel="stylesheet" href="css/productslist.css"/>
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
                    <s:if test="#session.CURRENT_USER!=null">
                    <a href="account.jsp">我的喵购</a>
                    </s:if>
                    <s:if test="#session.CURRENT_USER==null" >
                    <a href="login.jsp">我的喵购</a>
                    </s:if>
                </div>
                <div data-toggle="arrowdown" id="arrow4" class="user-name">
                    <i class="fa fa-shopping-cart fa-orange"></i>
                    <s:if test="#session.CURRENT_USER!=null">
                    <a href="cart.jsp">购物车</a>
                    </s:if>
                    <s:if test="#session.CURRENT_USER==null">
                    <a href="login.jsp">购物车</a>
                    </s:if>
                </div>
                <div data-toggle="arrowdown" id="arrow5" class="user-name">
                    <i class="fa fa-star fa-orange"></i>
                    <a>收藏夹</a>
                </div>
                <div data-toggle="arrowdown" id="arrow5" class="user-name">
                    <i class="fa fa-list fa-orange"></i>
                     <s:if test="#session.CURRENT_USER!=null">
                     <a href="toMyOrderInfo">我的订单</a>
                     </s:if>
                     <s:if test="#session.CURRENT_USER==null">
                     <a href="login.jsp">我的订单</a>
                     </s:if>
                </div>
                <span class="vertical-line">|</span>
             
                <div data-toggle="arrowdown" id="arrow7" class="user-name">
                    <i class="fa fa-list-ul fa-orange"></i>
                    <a href="">网站导航</a>
                </div>
            </div>
        </div>
    </div>

    <!--top-main-->
    <div class="top-main">
        <div class="scroll-logo"><img style="height:110px;width:190px;margin-left:50px;" src="images/miaogou.png"/></div>
        <div class="search-wrapper" style="float:left;" >
            <div class="search-box">
                <div data-toggle="arrowdown" id="arrow8" class="search-toggle">
                    宝贝<span class="down-icon"></span>
                </div>
                <input class="search-in" type="text" placeholder="搜‘华为手机’试试">
                <input type="button" class="search-but" value="搜索">
            </div>
            <a class="a-float-left hight-search" href="">高级<br/>搜索</a>
        </div>

    </div>
    <!--content-top-->
    <div class="content-top">
        <!--sidebar-->
        <div class="sidebar">
            <h3>商品服务分类</h3>
            <!--sidebar-info-->
            <div class="sidebar-info">
                <ul class="side-li">
                   <s:iterator id="typeItem" value="#request.typeList">
                      <li><h3>${typeItem.name }<span class="fa fa-angle-right fa-loc"></span></h3>
					       <ul>				
					            <s:iterator id="pi" value="#typeItem.pis">
					            <li> ${pi.brand}</li>  
			                    </s:iterator>	
					       </ul>
					  </li>
				   </s:iterator>
                </ul>
            </div>
        </div>
        <!--right-con-->
        <div class="right-con">
            <div class="nav">
                <a id="spe-a1" href="#">天猫</a>
                <a id="spe-a2" href="#">聚划算</a>
                <a id="spe-a3" href="#">玩转二手</a>
                <span class="line-a">|</span>
                <a href="#">拍卖</a>
                <a href="#">3C数码</a>
                <a href="#">电器城</a>
                <a href="#">服装</a>
                <a href="#">旅行</a>
                <a href="#">手机电脑</a>
                <span class="keep-a" href="#"><a href="#">消费者保障</a></span>
            </div>
            <!--show-box-->
            <div class="show-box">
                <!--content-->
                <div class="content">
                    <ul class="imgBox" style="margin-left: 40px;">
                         <li><a href=""><img src="product_images/changhong.jpg"></a></li>
                         <li><a href=""><img src="product_images/HP.jpg"></a></li>
                          <li><a href=""><img src="product_images/李宁.jpg"></a></li>
                           <li><a href=""><img src="product_images/Konka-b.jpg"></a></li>
                            <li><a href=""><img src="product_small_images/松下-c-3.jpg"></a></li>
                    </ul>
                    <div class="currentNum">
                        <span class="imgNum mark-color"></span>
                        <span class="imgNum"></span>
                        <span class="imgNum"></span>
                        <span class="imgNum"></span>
                        <span class="imgNum"></span>
                    </div>
                    <div class="control to-left"><i class="fa fa-angle-left"></i></div>
                    <div class="control to-right"><i class="fa fa-angle-right"></i></div>
                </div>
               <a style="float: left" href=""><img src="images/6.6.jpg" /></a>
                <!--content-down-->
                <div class="content-down">
                    <ul class="imgBox1" style="margin-left: 25px;">
                        <li>
                            <a href=""><img src="product_images/MacBook.jpg" /></a>
                            <a href=""><img src="product_images/Lenovo.jpg" /></a>
                            <a href=""><img src="product_images/ASUS.jpg"/></a>
                            <a href=""><img src="product_images/Microsoft.jpg"/></a>
                        </li>
                        <li>
                            <a href=""><img src="product_images/HP.jpg" /></a>
                            <a href=""><img src="product_images/佳能.jpg" /></a>
                            <a href=""><img src="product_images/三星.jpg" /></a>
                            <a href=""><img src="product_images/松下-p.jpg" /></a>
                        </li>
                       <li>
                            <a href=""><img src="product_images/changhong.jpg" /></a>
                            <a href=""><img src="product_images/Haier-t.jpg" /></a>
                            <a href=""><img src="product_images/Konka-t.jpg" /></a>
                            <a href=""><img src="product_images/TCL.jpg" /></a>
                        </li>
                        <li>
                            <a href=""><img src="product_images/Adidas.jpg" /></a>
                            <a href=""><img src="product_images/川崎.jpg" /></a>
                            <a href=""><img src="product_images/李宁.jpg" /></a>
                            <a href=""><img src="product_images/尤尼克斯.jpg" /></a>
                        </li>
                        <li>
                            <a href=""><img src="product_images/Kodak.jpg" /></a>
                            <a href=""><img src="product_images/Sony.jpg" /></a>
                            <a href=""><img src="product_images/尼康.jpg" /></a>
                            <a href=""><img src="product_images/松下-c.jpg" /></a>
                        </li>
                    </ul>
                    <div class="currentNum-down">
                        <span class="imgNum1 mark-color"></span>
                        <span class="imgNum1"></span>
                        <span class="imgNum1"></span>
                        <span class="imgNum1"></span>
                        <span class="imgNum1"></span>
                    </div>
                    <div class="control1 to-left1"><i class="fa fa-angle-left"></i></div>
                    <div class="control1 to-right1"><i class="fa fa-angle-right"></i></div>
                </div>
                <a style="float: left" href=""><img src="images/15.jpg" /></a>
            </div>
           <div class="tlinks"></div>
            <!--right-sidbar-->
            <div class="right-sidebar">
                <div class="info-box">
                    <ul class="tab-nav">
                        <li id="li-1" class="li-nav li-nav-hover li-border">公告</li>
                        <li id="li-2" class="li-nav">规则</li>
                        <li id="li-3" class="li-nav">论坛</li>
                        <li id="li-4" class="li-nav">安全</li>
                        <li style="border-right: none" id="li-5" class="li-nav">公益</li>
                    </ul>
                    <div id="box-1" style="display: block" class="hiddenBox">

                        <a href="">喵购2020:开放多样性</a>
                        <a href="">舌尖中国二季 喵购首尝</a>
                        <a href="">喵购通信自建计费系统</a>
                        <a href="">来往首届419宇宙节</a>
                    </div>
                    <div id="box-2" class="hiddenBox">

                        <a href="">[重要] 喵点点规范</a>
                        <a href="">[重要] 虚假交易新规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <a href="">[重要] 新增认证规则</a>
                        <a href="">[重要] 购买刀具实名</a>
                    </div>
                    <div id="box-3" class="hiddenBox">
                        <a href="">[优化] 称谓滥用将整改</a>
                        <a href="">[热点] 如何赢取新商机</a>
                        <a href="">[话题] 同城交易避处罚</a>
                        <a href="">[聚焦] 新消保法全解析</a>
                    </div>
                    <div id="box-4" class="hiddenBox">

                        <a href="">个人重要信息要管牢！</a>
                        <a href="">卖家防范红包欺诈提醒</a>
                        <a href="">更换收货地址的陷阱！</a>
                        <a href="">注意骗子的技术升级了</a>
                    </div>
                    <div id="box-5" class="hiddenBox">
                        <a href="">[优化] 称谓滥用将整改</a>
                        <a href="">[热点] 如何赢取新商机</a>
                        <a href="">[话题] 同城交易避处罚</a>
                        <a href="">[聚焦] 新消保法全解析</a>
                    </div>
                </div>
                <!--user-info-->
                <div class="user-info">
                    <s:if test="#session.CURRENT_USER!=null">
                    <div class="gold-top">
                        <img width="62px" height="62px" src="images/user-head.jpg" />
	                      <div class="inner-user">
                            <h3>Hi  <font color="red">${sessionScope.CURRENT_USER.userName}</font>,祝您购物愉快！</h3>
                           <sx:div id="tsdiv" updateFreq="8000" href="login">
                            </sx:div>
			               <h3><font color="red">${message }</font></h3>
                          </div>          
                    </div>
                    <div class="login">
                        <a class="login-btn" href="account.jsp">我的账户</a>
                        <a class="login-btn free" href="logOut">退出</a>
                    </div>
                    </s:if>
                    
                     <s:else>
		             <div class="gold-top">
                        <img width="62px" height="62px" src="images/user-head.jpg" />
	                      <div class="inner-user">
                            <h3>亲！欢迎光临,登录享精彩哦！</h3>
                          </div>
                    </div>
                    <!--login-->
                    <div class="login">
                        <a class="login-btn" href="login.jsp"><i class="fa fa-user fa-user-loc"></i>登录</a>
                        <a class="login-btn free" href="reg.jsp">注册</a>
                    </div>
                    </s:else>
                </div>
                <!--service-->
                <div class="service">
                    <h3>便民服务</h3>
                    <div id="service-1" class="service-cell service-z">
                        <h5 class="service-i"><img src="images/phone.png" /></h5>
                        <h6>话费</h6>
                    </div>
                    <div id="service-2" class="service-cell service-z">
                        <h5 class="service-i"><img src="images/game.png" /></h5>
                        <h6>游戏</h6>
                    </div>
                    <div id="service-3" class="service-cell service-z">
                        <h5 class="service-i"><img src="images/plane.png" /></h5>
                        <h6>旅行</h6>
                    </div>
                    <div id="service-4" class="service-cell service-z">
                        <h5 class="service-i"><img src="images/save.png" /></h5>
                        <h6>保险</h6>
                    </div>
                    <div class="service-cell">
                        <h5 class="service-i"><img src="images/18.png" /></h5>
                        <h6>彩票</h6>
                    </div>
                    <div class="service-cell">
                        <h5 class="service-i"><img src="images/move.png" /></h5>
                        <h6>电影</h6>
                    </div>
                    <div class="service-cell">
                        <h5 class="service-i"><img src="images/eat.png" /></h5>
                        <h6>点外卖</h6>
                    </div>
                    <div class="service-cell">
                        <h5 class="service-i"><img src="images/money.png" /></h5>
                        <h6>理财</h6>
                    </div>
                    <div class="service-cell">
                        <h5 class="service-i"><img src="images/book.png" /></h5>
                        <h6>电子书</h6>
                    </div>
                    <div class="service-cell">
                        <h5 class="service-i"><img src="images/miusc.png" /></h5>
                        <h6>音乐</h6>
                    </div>
                    <div class="service-cell">
                        <h5 class="service-i"><img src="images/bag.png" /></h5>
                        <h6>水电煤</h6>
                    </div>
                    <div class="service-cell">
                        <h5 class="service-i"><img src="images/....png" /></h5>
                        <h6>请期待</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
  <div class="bottom-main">
	  <div class="product">
	       <div class="product-top-bar">
		       <ul> 
			       <li><a href="">所有宝贝</a></li>
			       <li><a href="">天猫</a></li>
			       <li><a href="">二手</a></li>
		       </ul>
		    </div>   
	        <div class="product-info-wrapper">
	         <s:iterator id="piItem" value="#request.piList">
	         <div class="product-info">
               <div class="product-picture-box">
                   <a href="display?pi.id=${piItem.id}">
                      <img src="product_images/${piItem.picture}">
                   </a>
	   	       </div>
               <div class="product-price-box"> 
                   <div class="product-price">
                       <strong>￥${piItem.price}</strong>
                  </div>
              </div>
               <div class="product-intro-box">
                   <a href="display?pi.id=${piItem.id}">
				      ${piItem.introduce}                   
				   </a>
               </div> 
               <div class="product-shop-location">
                   <div class="product-shop">
				       <i class="fa fa-bars" style="color: #FB5300; "></i>
                       <a href="">
                           <span>${piItem.shop }</span>
                       </a>
                   </div>
                   <div class="product-location">${piItem.location }</div>
                </div> 
               <div class="wangwang">
					<a href="addToShopCart?productInfoId=${piItem.id } "><i class="fa fa-shopping-cart fa-orange" style="font-size:24px" title="点击加入购物车哦"></i></a>
			        <a href="#"><img src="images/wangwang.jpg" title="点此直接与与卖家交流联系您看中的宝贝哦"></a>
                </div>
             </div> 
             </s:iterator>   
             </div>
	  </div> 
	  <div class="leader-board">
	      <table class="leader-board-table">
			    <tr>
					  <th colspan="2" class="table-head">浏览排行榜</th>
			    </tr>
			    <s:iterator id="browsePiItem" value="#session.browsePiList" status="status">
			     <s:if test="#status.index>0 && #status.index<=6">
			    <tr class="table-row">
					  <td class="picture-td"><a href=""><img  class="browse-pic"src="product_images/${ browsePiItem.picture}" /></a></td>
					  <td class="name-td"><a href="">${ browsePiItem.name}</a></td>
			    </tr>
			     </s:if>
			    </s:iterator>
		   </table>
	   </div>
  </div>
    <div style="height:2800px;"></div>
    <!--尾部开始-->
	<div class="end">地址：上海市嘉定区曹安公路4800号同济大学<br> 
	电话：6958-88888888&nbsp; 邮箱：zhaodeze@miaogou.com  &nbsp;邮编：100100<br>
	版权所有:上海喵购电商责任有限公司&nbsp;　技术支持：17717078595
	</div>
    <!--尾部结束-->
    <script src="js/jquery_1.9.js"></script>
    <script src="js/common.js"></script>
    <script src="js/img-show.js"></script>
</body>
</html>
  