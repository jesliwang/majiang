<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>主页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
		Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="../css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="../css/lines.css" rel='stylesheet' type='text/css' />
<link href="../css/font-awesome.css" rel="stylesheet">

<!----webfonts--->
<!--  	<link href='http://fonts.useso.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
	-->
<!---//webfonts--->
<!-- Nav CSS -->
<link href="../css/custom.css" rel="stylesheet">
<link href="../css/jqvmap.css" rel='stylesheet' type='text/css' />

<!-- jQuery -->
<script src="../js/jquery.min.js"></script>
<script src="../js/ajaxfileupload.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="../js/metisMenu.min.js"></script>
<script src="../js/custom.js"></script>
<!-- Graph JavaScript -->
<script src="../js/d3.v3.js"></script>
<script src="../js/rickshaw.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>


</head>

<body>
	<div id="wrapper">
		<div class="navbar-default sidebar" role="navigation">
			<div class="base_info">
				<span class="info_item">账号：<span id="username"
					class="info_items"></span></span> <span class="info_item">历史房卡总数：<span
					id="totalCards" class="info_items"></span></span> <span class="info_item">剩余房卡总数：<span
					id="actualCard" class="info_items"></span></span> <span class="info_item">手机号：<span
					id="tel" class="info_items"></span></span> <span class="info_item">
					<span id="tel" class="info_items"><a href="#updatePwdModal"
						data-toggle="modal">修改资料</a></span> <span id="tel" class="info_items"><a
						href="#" onclick="logout()">退出登录</a></span>
				</span>
				<!-- <button  onclick="logout()">退出登录</button> -->
			</div>
			<div class="selfinfo_frame mobile_display" id="mobileUserInfo">
				<span class=info_ite>账号：<span id="username_mobile"
					class="info_ite"></span></span> <span class="info_ite">历史房卡总数：<span
					id="totalCards_mobile" class="info_ite"></span></span> <span
					class="info_ite">剩余房卡总数：<span id="actualCard_mobile"
					class="info_ite"></span></span> <span class="info_ite">手机号：<span
					id="tel_mobile" class="info_ite"></span></span> <span class="info_ite">
					<span id="tel" class="info_ite"><a href="#"
						onclick="logout()">退出登录</a></span>
				</span>
			</div>
			<div class="mobile_display" onclick="userinfo()"
				style="top: 40px; left: 20px; z-index: 9999; line-height: 40px; text-align: center; position: fixed; width: 40px; height: 40px; border-radius: 50%; background: rgba(0, 0, 0, 0.5); color: #ffffff">
				个人
				<!-- <a href="#summary" onclick="selectPage('summary')" style="width: 15%;text-align: center; display: inline-block;">概况</a>
					<a onclick="selectPage('account')" href="#account" style="width: 15%;text-align: center;display: inline-block;">账号管理</a>
					<a href="#roomCardFlow" onclick="selectPage('roomCardFlow')" style="width: 15%;text-align: center;display: inline-block;">房卡流水</a>
					<a href="#operationFlow" onclick="selectPage('operationFlow')" style="width: 15%;text-align: center;display: inline-block;">操作流水</a>
					<a href="#user" onclick="selectPage('user')" style="width: 15%;text-align: center;display: inline-block;">会员管理</a>
					<a href="#activity" onclick="selectPage('activity')" style="width: 15%;text-align: center;display: inline-block;">活动管理</a> -->

			</div>
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">

					<li class="tltle_nav"><a href="#summary"
						onclick="selectPage('summary')"><i
							class="fa fa-envelope nav_icon"></i>概况</a></li>

					<li class="tltle_nav"><a href="#user"
						onclick="selectPage('user')"><i
							class="fa fa-envelope nav_icon"></i>游戏会员管理<span class="fa arrow"></span></a>
					</li>
					<li class="tltle_nav"><a href="#activity"
						onclick="selectPage('activity')"><i
							class="fa fa-envelope nav_icon"></i>活动管理<span class="fa arrow"></span></a>
					</li>

					<li class="tltle_nav"><a onclick="selectPage('account')"
						href="#account"><i class="fa fa-envelope nav_icon"></i>代理管理<span
							class="fa arrow"></span></a></li>
					<li class="tltle_nav"><a onclick="selectPage('user')"
						href="#account"><i class="fa fa-envelope nav_icon"></i>充值<span
							class="fa arrow"></span></a></li>

					<li class="tltle_nav"><a href="#roomCardFlow"
						onclick="selectPage('roomCardFlow')"><i
							class="fa fa-envelope nav_icon"></i>房卡流水查询<span class="fa arrow"></span></a>
					</li>
					<li class="tltle_nav"><a href="#operationFlow"
						onclick="selectPage('operationFlow')"><i
							class="fa fa-envelope nav_icon"></i>操作流水查询<span class="fa arrow"></span></a>
					</li>
				</ul>
			</div>

		</div>
		<nav
			style="font-size:10px;height: 50px ;line-height: 50px;background: #FFFDE7;width: 100%; position:fixed;bottom:0px;z-index:9999"
			class="mobile_display" id="mobile"> </nav>

		<div id="page-wrapper">
			<div class="graphs" id="summary">
				<div class="col_3">

					<p class="sub_title">游戏公告</p>
					<label style="margin-left: 5%; font-size: 18px">当前公告：
						&nbsp;&nbsp;&nbsp;</label>
					<p style="margin-left: 5%">
						<textarea id="gameOldNotice"
							style="width: 80%; margin-top: 5px; height: 75px;"></textarea>
					</p>
					<label style="margin-left: 5%; font-size: 18px; color: red">发布新公告：</label>
					<p style="margin-left: 5%">
						<textarea id="gameNotice"
							style="width: 80%; height: 75px; margin-top: 5px;"> </textarea>
						<button onclick="saveGameNoitce()"
							style="border: 1px solid #00BCD4; border-radius: 5px; background: none; padding-left: 8px; padding-right: 8px;">发送</button>
					</p>


				</div>
				<div class="col_3">
					<p class="sub_title">充房卡显示：信息</p>
					<!-- <label  style="margin-left: 5%;font-size:22px;margin-top: 5px;">当前信息： </label><textarea id="oldContact"  style=" width: 30%;margin-top: 5px;height: 200px;"></textarea> -->
					<label style="margin-left: 5%; font-size: 18px; color: red">编辑联系信息：</label>
					<p style="margin-left: 5%">
						<textarea id="newContact"
							style="width: 80%; height: 150px; margin-top: 5px;"> </textarea>
						<button onclick="saveContactway()"
							style="border: 1px solid #00BCD4; border-radius: 5px; background: none; padding-left: 8px; padding-right: 8px;">保存</button>
					</p>


				</div>
				<div class="col_3">
					<div class="sub_title">概况</div>

					<div class="col-md-3 widget widget1">
						<div class="r3_counter_box">
							<i class="pull-left fa fa-thumbs-up icon-rounded"></i>
							<div class="stats">
								<h5>
									<strong id="totoalAccountCount"></strong>
								</h5>
								<span>玩家总数</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 widget widget1">
						<div class="r3_counter_box">
							<i class="pull-left fa fa-users user1 icon-rounded"></i>
							<div class="stats">
								<h5>
									<strong id="consumedRoomCardCount"></strong>
								</h5>
								<span>消耗房卡历史总数</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 widget widget1">
						<div class="r3_counter_box">
							<i class="pull-left fa fa-users user1 icon-rounded"></i>
							<div class="stats">
								<h5>
									<strong id="AllRoomsCount"></strong>
								</h5>
								<span>房间创建历史总数</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 widget widget1">
						<div class="r3_counter_box">
							<i class="pull-left fa fa-thumbs-up icon-rounded"></i>
							<div class="stats">
								<h5>
									<strong></strong>
								</h5>
								<span>微信充值房卡总数</span>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>

				<div class="col_3">
					<div class="sub_title">房间统计</div>
					<div class="col-md-3 r3_counter_box"
						style="height: 100px; float: left; width: 48%;">

						<div style="text-align: center;">

							<div>
								<h5>
									<strong id="onlineRoomsCount"></strong>
								</h5>
								<span>当前在线房间总数</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 r3_counter_box"
						style="float: right; height: 100px; width: 48%;">
						<div style="text-align: center;">

							<div>
								<h5>
									<strong id="todayRoomsCount"></strong>
								</h5>
								<span>今天创建房间总数</span>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>

					<table class="table">
						<thead>
							<!-- <tr class="success">
									<th>游戏名字</th>
									<th>当前创建房间总数</th>
									<th>今天创建房间最高记录</th>
									<th>历史创建房间总数</th>
								</tr> -->
						</thead>
						<tbody>
							<!-- <tr class="active">
									<th scope="row">转转麻将</th>
									<td>Column content</td>
									<td>Column content</td>
									<td>Column content</td>
								</tr>
								<tr>
									<th scope="row">长沙麻将</th>
									<td>Column content</td>
									<td>Column content</td>
									<td>Column content</td>
								</tr>
								<tr>
									<th scope="row">划水麻将</th>
									<td>Column content</td>
									<td>Column content</td>
									<td>Column content</td>
								</tr> -->
						</tbody>
					</table>

				</div>
				<div class="col_3">
					<div class="sub_title">房卡统计</div>
					<div class="col-md-3 widget widget1">

						<div class="r3_counter_box">
							<i class="pull-left fa fa-thumbs-up icon-rounded"></i>
							<div class="stats">
								<h5>
									<strong id="totalRoomCards"></strong>
								</h5>
								<span>充值房卡历史总数</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 widget widget1">
						<div class="r3_counter_box">
							<i class="pull-left fa fa-users user1 icon-rounded"></i>
							<div class="stats">
								<h5>
									<strong id="saleRoomCardsToday"></strong>
								</h5>
								<span>当天充值房卡总数</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 widget widget1">
						<div class="r3_counter_box">
							<i class="pull-left fa fa-comment user2 icon-rounded"></i>
							<div class="stats">
								<h5>
									<strong id="saleRoomCardsThisWeek"></strong>
								</h5>
								<span>本周充值房卡总数</span>
							</div>
						</div>
					</div>

					<div class="clearfix"></div>
					<table class="table">
						<thead>
							<!-- <tr class="success">
									<th>代理名字</th>
									<th>总购房卡数</th>
									<th>售出房卡数</th>
									<th>剩余房卡数</th>
								</tr> -->
						</thead>
						<tbody>
							<!-- <tr class="active">
									<th scope="row">张毅</th>
									<td>158</td>
									<td>58</td>
									<td>47</td>
								</tr>
								<tr>
									<th scope="row">李青</th>
									<td>158</td>
									<td>100</td>
									<td>15</td>
								</tr>
								<tr>
									<th scope="row">XXX</th>
									<td>158</td>
									<td>12</td>
									<td>15</td>
								</tr> -->
						</tbody>
					</table>
				</div>

				<div class="col_3">
					<div class="sub_title">玩家统计</div>
					<div class="col-md-3 widget widget1">
						<div class="r3_counter_box">
							<i class="pull-left fa fa-users user1 icon-rounded"></i>
							<div class="stats">
								<h5>
									<strong id="onlineAccountCount"></strong>
								</h5>
								<span>当前在线人数</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 widget widget1">
						<div class="r3_counter_box">
							<i class="pull-left fa fa-comment user2 icon-rounded"></i>
							<div class="stats">
								<h5>
									<strong id="topOnlineAccountCount"></strong>
								</h5>
								<span>今天在线人数最高纪录</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 widget widget1">
						<div class="r3_counter_box">
							<i class="pull-left fa fa-comment user2 icon-rounded"></i>
							<div class="stats">
								<h5>
									<strong id="newAccountCountToday"></strong>
								</h5>
								<span>今日新增用户</span>
							</div>
						</div>
					</div>

					<div class="clearfix"></div>
					<table class="table">
						<thead>
							<!-- <tr class="success">
									<th>代理名字</th>
									<th>总购房卡数</th>
									<th>售出房卡数</th>
									<th>剩余房卡数</th>
								</tr> -->
						</thead>
						<tbody>
							<!-- <tr class="active">
									<th scope="row">张毅</th>
									<td>158</td>
									<td>58</td>
									<td>47</td>
								</tr>
								<tr>
									<th scope="row">李青</th>
									<td>158</td>
									<td>100</td>
									<td>15</td>
								</tr>
								<tr>
									<th scope="row">XXX</th>
									<td>158</td>
									<td>12</td>
									<td>15</td>
								</tr> -->
						</tbody>
					</table>
				</div>

			</div>
			<div class="graphs" id="user">
				<div class="col_3">
					<div class="sub_title">
						会员管理
						<button
							style="float: right; line-height: 30px; margin-top: 5px; background: none; border: 1px solid black; border-radius: 6px; margin-right: 15px"
							onclick="searchAccount()">搜索玩家</button>
						<input id="accountUuid" type="text" value="请输入玩家id"
							onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = '请输入玩家id';}"
							style="float: right; line-height: 30px; color: black; margin-top: 5px; margin-right: 15px;" />

					</div>

					<table class="table"
						style="border-top: 1px #C0C0C0 solid; margin-top: 20px;">
						<thead>
							<tr class="success">
								<th>用户id</th>
								<th>用户名</th>
								<th>剩余房卡</th>
								<th>状态</th>
								<th>设置</th>
								<th>充值/退卡</th>
							</tr>
						</thead>
						<tbody id="userTbody">
						</tbody>
					</table>
				</div>

				<!-- <div style="float: right; padding-right: 50px ">
						<a>上一页</a>
						<span style="color: red;">1</span>/<span>5</span>
						<a>下一页</a>
					</div> -->

			</div>

			<div class="graphs" id="activity">
				<div class="col_3">
					<div class="sub_title">
						活动管理 <select id="gift_display_select"
							style="float: right; background: none; color: white; height: 40px; margin-top: 5px;"
							onchange="frameChangeSelect()">
							<option value="volvo" style="color: #333;" selected="selected">结果查询</option>
							<option value="saab" style="color: #333;">抽奖设置</option>
							<option value="opel" style="color: #333;">奖品设置</option>
						</select>
					</div>

					<!-- 获奖结果表 -->
					<div id="result_frame">
						<table class="table"
							style="border-top: 1px #C0C0C0 solid; margin-top: 20px;">
							<thead>
								<tr class="success">
									<th>微信账号</th>
									<th>微信昵称</th>
									<th>奖品id</th>
									<th>奖品名称</th>
									<th>获奖时间</th>
									<th>发奖时间</th>
									<th>状态</th>
								</tr>
							</thead>
							<tbody id="activityTbody">
							</tbody>
						</table>
					</div>

					<!-- 奖品规则  -->
					<div
						style="margin-top: 25px; padding-bottom: 5px; margin-left: 20px; margin-right: 20px; border: #d0d0d0 solid 1px; padding-left:;"
						id="gift_rule_set">
						<p
							style="background: #A4E7A5; text-align: center; height: 40px; line-height: 40px; color: #00AAF1;">填写奖品规则和每日抽奖次数</p>
						<p style="margin-top: 15px;">
						<p>
							抽奖状态：<input id="prizeType" style="color: red"
								onclick="changeStatus(this.value)" type="button" value="" />
						</p>
						<p style="margin-top: 15px;">
						<p>
							奖品规则说明<input id="prizePerDay" placeholder="填写每天抽奖次数"
								width="120px" />
						</p>

						<div style="margin-top: 15px;">
							<p>奖品规则说明</p>
							<textarea id="prizeRule" placeholder="奖品规则说明"
								style="width: 80%; margin-left: 10%; height: 80px;"></textarea>
						</div>
						<p style="clear: both; height: 35px;">
							<button
								style="width: 60px; height: 35px; float: right; margin-right: 5px;"
								onclick="prizeRule()">保存</button>
						</p>
					</div>
					<!--奖品设置框 -->
					<div id="content_gift_set">

						<table class="table"
							style="border-top: 1px #C0C0C0 solid; margin-top: 20px;">
							<thead>
								<tr class="success">
									<th>序号</th>
									<th>奖品图片</th>
									<th></th>
									<th>奖励数量</th>
									<th>名称</th>
									<th>奖品类别</th>
									<th>中奖率</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="prizeTbody">
							</tbody>

						</table>
						<div>
							<span style="font-size: 20px; color: red;">注意：游戏期间修改的设置,需要重启服务器才能起效。中奖概率填写万分比的分子，例如万分之十对应填写10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<span style="font-size: 20px; color: red;">当前概率总和 <span
								id="totalProbability"></span>
						</div>
					</div>
				</div>


			</div>
			<div class="graphs" id="account">
				<div class="col_3">
					<div class="sub_title">
						代理管理 <a href="#myModal" role="button"
							style="float: right; padding-left: 15px; padding-right: 15px; border-radius: 6px; border: 1px solid black; height: 40px; line-height: 40px; margin-top: 5px"
							data-toggle="modal">添加代理</a>
					</div>
					<button style="float: right; line-height: 30px; margin-top: 5px;"
						onclick="searchManager()">搜索代理</button>
					<input id="managerTel" type="text" value="请输入代理手机号码"
						onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = '请输入代理手机号码';}"
						style="float: right; line-height: 30px; margin-top: 5px; color: black; margin-right: 15px;" />
					<table class="table"
						style="border-top: 1px #C0C0C0 solid; margin-top: 20px;">
						<thead>
							<tr class="success">
								<th>账号</th>
								<!-- 	<th>密码</th> -->
								<th>手机号</th>
								<th>房卡余额</th>
								<th>总房卡数</th>
								<th>类型</th>
								<th>充值/退卡</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="accountTbody">
						</tbody>
					</table>
				</div>

			</div>
			<div class="graphs" id="roomCardFlow">
				<div class="col_3">
					<div class="sub_title">房卡日志查询</div>
					<table class="table"
						style="border-top: 1px #C0C0C0 solid; margin-top: 20px;">
						<thead>
							<tr class="success">
								<th>日期</th>
								<th>变动数量</th>
								<th>关联会员</th>
								<th>操作事由</th>
							</tr>
						</thead>
						<tbody id="roomCardFlowTable">
							<!-- <tr style="background: #BCE8F1;">
									<th scope="row">2015-12-01 15:30</th>
									<td>**husnuhuglaohif9hafhai及时辐射危害*</td>
									<th scope="row">2015-12-01 15:30</th>
									<td>**husnuhuglaohif9hafhai及时辐射危害*</td>
								</tr>
								<tr style="background: #C5E1A5;">
									<th scope="row">2015-12-01 15:30</th>
									<td>**husnuhuglaohif9hafhai及时辐射危害*</td>
									<th scope="row">2015-12-01 15:30</th>
									<td>**husnuhuglaohif9hafhai及时辐射危害*</td>
								</tr>
								<tr style="background: #C5E1A5;">
									<th scope="row">2015-12-01 15:30</th>
									<td>**husnuhuglaohif9hafhai及时辐射危害*</td>
									<th scope="row">2015-12-01 15:30</th>
									<td>**husnuhuglaohif9hafhai及时辐射危害*</td>
								</tr>
								<tr style="background: #C5E1A5;">
									<th scope="row">2015-12-01 15:30</th>
									<td>**husnuhuglaohif9hafhai及时辐射危害*</td>
									<th scope="row">2015-12-01 15:30</th>
									<td>**husnuhuglaohif9hafhai及时辐射危害*</td>
								</tr> -->
						</tbody>
					</table>
				</div>
			</div>

			<div class="graphs" id="operationFlow">
				<div class="col_3">
					<div class="sub_title">操作日志查询</div>
					<table class="table"
						style="border-top: 1px #C0C0C0 solid; margin-top: 20px;">
						<thead>
							<tr class="success">
								<th>日期</th>
								<th>关联会员</th>
								<th>操作事由</th>
							</tr>
						</thead>
						<tbody id="operationFlowTable">
							<!-- <tr style="background: #BCE8F1;">
									<th scope="row">2015-12-01 15:30</th>
									<td>**husnuhuglaohif9hafhai及时辐射危害*</td>

								</tr>
								<tr style="background: #C5E1A5;">
									<th scope="row">2015-12-01 15:30</th>
									<td>**husnuhuglaohif9hafhai及时辐射危害*</td>
								</tr> -->
						</tbody>
					</table>
				</div>
			</div>

			<!-- Modal  增加新用户账户-->
			<div id="myModal" class="modal fade modal_style" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel" style="color: #22BAA0;">增加新账户</h3>
				</div>
				<div class="modal-body" style="padding: 30px; height: 120px;">
					<div style="clear: both;">
						<span style="float: left;">用户名：<input id="newManagerName"
							placeholder="输入新账户用户名" /></span> <span style="float: right;">密码：<input
							id="newManagerPwd" placeholder="输入新用户密码" /></span>
					</div>
					<div style="clear: both; margin-top: 50px;">
						<span style="float: left;">手机号：<input id="newManagerTel"
							placeholder="输入新账户手机号" /></span> <span
							style="float: right; height: 25px">角色： <select
							id="newManagerType"
							style="float: right; width: 175px; background: none; height: 25px; margin-top: 0px;">
								<option value="3" style="color: #333;" selected="selected">代理商</option>
						</select>
						</span>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
					<button class="btn btn-primary" onclick="saveManager()"
						data-dismiss="modal" aria-hidden="true">保存</button>
				</div>
			</div>
			<!-- 修改个人信息 -->
			<div id="updatePwdModal" class="modal fade modal_style" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myInfoLabel" style="color: #22BAA0;">修改资料</h3>
				</div>
				<div class="modal-body" style="padding: 30px; height: 140px;">
					<div style="clear: both;">
						<span style="float: left;">旧密码：<input id="oldPwd"
							placeholder="输入旧密码" /></span> <span style="float: right;">旧手机号：<input
							id="oldTel" placeholder="输入旧手机号" /></span>
					</div>
					<div style="clear: both; margin-top: 40px;">
						<span style="float: left;">新密码：<input id="newOnePwd"
							placeholder="输入新用户密码" /></span> <span style="float: right;">新手机号：<input
							id="oneTel" placeholder="输入新手机号" /></span>
					</div>
					<div style="clear: both; margin-top: 80px;">
						<span style="float: left;">新密码：<input id="newTwoPwd"
							placeholder="再次输入新用户密码" /></span> <span style="float: right;">新手机号：<input
							id="twoTel" placeholder="再次输入新手机号" /></span>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
					<button class="btn btn-primary" onclick="saveManagerInfo()"
						data-dismiss="modal" aria-hidden="true">保存</button>
				</div>
			</div>


			<!-- 删除用户对话框 -->
			<div id="deleteModal" class="modal fade modal_style" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel" style="color: red;">警告</h3>
				</div>
				<div class="modal-body" style="padding: 30px; height: 120px;">
					删除后账户数据将不能找回！你确认要删除吗？</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
					<button class="btn btn-primary">确认</button>
				</div>
			</div>

			<!-- 设置用户状态对话框 -->
			<div id="setModal" class="modal fade modal_style" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel" style="color: #22BAA0;">设置</h3>
				</div>
				<div class="modal-body" style="padding: 30px; height: 120px;">
					<span>设置用户状态 </span> <select id="accountStatus">
						<option value="0">激活可用</option>
						<option value="1">禁用账户</option>
					</select>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
					<button class="btn btn-primary" onclick="updateAccountStatus()"
						data-dismiss="modal" aria-hidden="true">确认</button>
				</div>
			</div>

			<!-- 充值模块 -->
			<div id="rechargeModal" class="modal fade modal_style" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel" style="color: #22BAA0;">账户充值</h3>
				</div>
				<div class="modal-body" style="padding: 30px; height: 80px;">
					<span>充值房卡数</span><input id="payCardNum" placeholder="请输入充值房卡数" />
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
					<button class="btn btn-primary" onclick="payCard()"
						data-dismiss="modal" aria-hidden="true">确认</button>
				</div>
			</div>

			<!-- 代理退卡模块 -->
			<div id="reduceRoomCardModal" class="modal fade modal_style"
				tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
				aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel" style="color: #22BAA0;">代理账户退卡</h3>
				</div>
				<div class="modal-body" style="padding: 30px; height: 120px;">
					<div style="color: red; margin-bottom: 20px;">退卡将影响用户的体验和正常使用，请谨慎操作</div>
					<span>减少房卡数</span><input id="reduceManagerCardNum"
						placeholder="请输入减少房卡数" />
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
					<button class="btn btn-primary" data-dismiss="modal"
						aria-hidden="true" onclick="reduceManagerRoomCard()">确认</button>
				</div>
			</div>
			<!-- 找回代理商密码 -->
			<div id="resetManagerPwd" class="modal fade modal_style"
				tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
				aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="resetProxyPwdLabel" style="color: #22BAA0;">找回密码</h3>
				</div>
				<div class="modal-body" style="padding: 30px; height: 60px;">
					<div style="clear: both;">
						<span style="float: left;">新密码：<input id="resetOnePwd"
							placeholder="输入新密码" /></span> <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新密码：<input
							id="resetTwoPwd" placeholder="再次输入新密码" /></span>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
					<button class="btn btn-primary" data-dismiss="modal"
						aria-hidden="true" onclick="resetManagerPwd()">确认</button>
				</div>
			</div>

			<!-- 玩家退卡模块 -->
			<div id="reduceAccountRoomCardModal" class="modal fade modal_style"
				tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
				aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel" style="color: #22BAA0;">玩家账户退卡</h3>
				</div>
				<div class="modal-body" style="padding: 30px; height: 120px;">
					<div style="color: red; margin-bottom: 20px;">退卡将影响用户的体验和正常使用，请谨慎操作</div>
					<span>减少房卡数</span><input id="reduceAccountCardNum"
						placeholder="请输入减少房卡数" />
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
					<button class="btn btn-primary" data-dismiss="modal"
						aria-hidden="true" onclick="reduceAccountRoomCard()">确认</button>
				</div>
			</div>




		</div>

	</div>

</body>
<!-- <script type="application/x-javascript"> -->
<script type="text/javascript">
		var currentId = 1;
		var userId = 0;
		var managerId = 0;
		var totalProbability = parseInt("0");//奖品概率总分
		var oneProbability = parseInt("0");//某一个奖品概率
		var oneName = "ddd";//奖励名称
		var flag = 0;//判断修改之后是否保存了
		var afterUpImg;//图片上传之后返回的图片路径
		
		$(function(){
		    $("#mobileUserInfo").css("display","none");
			currentId = "<%=session.getAttribute("id")%>";
			//判断是超管才能查看全部功能
			if("<%=session.getAttribute("type")%>" != "1"){
				//非超管
				$("#side-menu li:lt(3)").remove();
				//$("#newManagerType").append("<option value='2' style='color: #333;' selected='selected' >代理商</option>")
				
				var  a="<a onclick=selectPage('account') href='#account' style='width: 15%;text-align: center;display: inline-block;'>代理管理</a>";
					  a+="<a href='#user' onclick=selectPage('user') style='width: 15%;text-align: center;display: inline-block;'>充值</a>";
					  a+="<a href='#roomCardFlow' onclick=selectPage('roomCardFlow') style='width: 15%;text-align: center;display: inline-block;'>房卡流水</a>";
					  a+="<a href='#operationFlow' onclick=selectPage('operationFlow') style='width: 15%;text-align: center;display: inline-block;'>操作流水</a>";
				$("#mobile").append(a);
				
				selectPage("account");
				
			}
			else{
				//超管
				$("#newManagerType").append("<option value='2' style='color: #333;' selected='selected' >顶级代理商</option>")
				$("#side-menu li:eq(4)").remove();
				$("#gameOldNotice").val("<%=session.getAttribute("notice")%>").attr("disabled","disabled");
				//$("#oldContact").val("").attr("disabled","disabled");
				
				var a = "<a href='#summary' onclick=selectPage('summary') style='width: 15%;text-align: center; display: inline-block;'>概况</a>";
					  a+="<a onclick=selectPage('account') href='#account' style='width: 15%;text-align: center;display: inline-block;'>账号管理</a>";
					  a+="<a href='#roomCardFlow' onclick=selectPage('roomCardFlow') style='width: 15%;text-align: center;display: inline-block;'>房卡流水</a>";
					  a+="<a href='#operationFlow' onclick=selectPage('operationFlow') style='width: 15%;text-align: center;display: inline-block;'>操作流水</a>";
					  a+="<a href='#user' onclick=selectPage('user') style='width: 15%;text-align: center;display: inline-block;'>会员管理</a>";
					  a+="<a href='#activity' onclick=selectPage('activity') style='width: 15%;text-align: center;display: inline-block;'>活动管理</a>";
				$("#mobile").append(a);
				//超管有权利获取游戏服务器的信息
				$.ajax({	
				   type: "POST",
				   url: "<%=basePath%>controller/manager/getAllGameInfos",
				   data: "",
				   success: function data(data){
				   		var param  = eval('('+data+')');
				   		//1:总会员数(玩家总数)
						 $("#totoalAccountCount").text(param.totoalAccountCount);
						//2:历史总房间个数
						 $("#AllRoomsCount").text(param.AllRoomsCount);
						//3：消耗房卡总数(根据房间获取消耗房卡总数)
						 $("#consumedRoomCardCount").text(param.consumedRoomCardCount);
						//二：房间统计---------------------------
						//5：在线房间统计，游戏服务器返回
						 $("#onlineRoomsCount").text(param.onlineRoomsCount);
						//6:今天新建房间个数
						$("#todayRoomsCount").text(param.todayRoomsCount);
						//三： 房卡统计---------------------------
						//7:历史充值房卡总数(管理员卖给代理的历史房卡总数)
						 $("#totalRoomCards").text(param.totalRoomCards);
						//8：当天充值房卡总数(管理员当天卖给代理的房卡总数)
						$("#saleRoomCardsToday").text(param.saleRoomCardsToday);
						//10：本周充值房卡总数
						 $("#saleRoomCardsThisWeek").text(param.saleRoomCardsThisWeek);
						//四：玩家统计---------------------------
						//11:当前在线人数 
						 $("#onlineAccountCount").text(param.onlineAccountCount);
						//12:今日最高在线人数 (从游戏服务器取)
						 $("#topOnlineAccountCount").text(param.topOnlineAccountCount);
						//12：今日新增用户
						 $("#newAccountCountToday").text(param.newAccountCountToday);
					}
				});
			}
			
			
			
			//登录管理员信息
			$("#username").text("<%=session.getAttribute("name")%>");
			$("#totalCards").text("<%=session.getAttribute("totalCards")%>");
			$("#actualCard").text("<%=session.getAttribute("actualCard")%>");
			$("#tel").text("<%=session.getAttribute("tel")%>");
			//手机上
			$("#username_mobile").text("<%=session.getAttribute("name")%>");
			$("#totalCards_mobile").text("<%=session.getAttribute("totalCards")%>");
			$("#actualCard_mobile").text("<%=session.getAttribute("actualCard")%>");
			$("#tel_mobile").text("<%=session.getAttribute("tel")%>");
			
		})
		init("summary");
		var lastDisplayPage;

		function init(displayPage) {
			lastDisplayPage = displayPage;
			document.getElementById(lastDisplayPage).style.display = "block";
		}

		function selectPage(clickPage) {
			if(clickPage == "user"){
				//游戏会员管理
				$.ajax({	
				   type: "POST",
				   url: "<%=basePath%>controller/manager/getAccounts",
				   data: "",
				   success: function data(data){
						var param = eval(data);
						$("#userTbody").html("");
				        $.each(param, function (i, item) {  
				              var td = "<td>"+param[i].uuid+"</td>";
											td+="<td style='max-width:30px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;'>"+param[i].nickname+"</td>";
											td+="<td>"+param[i].roomcard+"</td>";
											if(param[i].status =="0"){
												td+="<td>正常</td>";
											}else{
												td+="<td>注销</td>";
											}	
											td+="<th><a href='#setModal' data-toggle='modal'  onclick=getUserId("+param[i].id+")>设置 </a></th>";
											td+="<th><a href='#rechargeModal' data-toggle='modal' onclick=getUserId("+param[i].id+")>充值 </a>";
											if(currentId == "1"){
												td+="/<a href='#reduceAccountRoomCardModal' data-toggle='modal' onclick=getUserId("+param[i].id+")>退卡 </a>";
											}
											td+="</th>";
							//添加每行数据
							$("#userTbody").append("<tr>"+td+"</tr>");
				          }); 
					}
				});
			}
		   if(clickPage == "roomCardFlow"){
		   		//管理员房卡流水
				$.ajax({	
				   type: "POST",
				   url: "<%=basePath%>controller/manager/roomCardWaterCourse",
				   data: "",
				   success: function data(data){
				   			var param = eval(data);
				   			$("#roomCardFlowTable").html("");
				   			$.each(param, function (i, item) {
				              var td = "<td>"+param[i].createTime+"</td>";
											td+="<td>"+param[i].numb+"</td>";
											td+="<td>"+param[i].name+"</td>";
											td+="<td>"+param[i].mark+"</td>";
							//添加每行数据
							$("#roomCardFlowTable").append("<tr style='background: #BCE8F1;'>"+td+"</tr>");
				          }); 
					}
				});
		    } 
		 if(clickPage == "operationFlow"){
		   		//管理员操作流水
				$.ajax({	
				   type: "POST",
				   url: "<%=basePath%>controller/manager/operationWaterCourse",
				   data: "",
				   success: function data(data){
				   			var param = eval(data);
				   			$("#operationFlowTable").html("");
				   			$.each(param, function (i, item) {
				              var td = "<td>"+param[i].createTime+"</td>";
											td+="<td>"+param[i].name+"</td>";
											td+="<td>"+param[i].mark+"</td>";
							//添加每行数据
							$("#operationFlowTable").append("<tr style='background: #BCE8F1;'>"+td+"</tr>");
				          }); 
					}
				});
		    } 
		    
		    if(clickPage == "account"){
		    	//账号管理，首先获取自己下面的所有代理商，零售商  
		    	$.ajax({	
				   type: "POST",
				   url: "<%=basePath%>controller/manager/getManagers",
				   data: "",
				   success: function data(data){
						var param = eval(data);
						$("#accountTbody").html("");
				        $.each(param, function (i, item) {
				              var td = "<td>"+param[i].name+"</td>";
											/* td+="<td>****</td>"; */
											td+="<td>"+param[i].telephone+"</td>";
											td+="<td>"+param[i].actualcard+"</td>";
											td+="<td>"+param[i].totalcards+"</td>";
											if(param[i].powerId ==3){
												td+="<td>普通代理</td>";
											}
											else if(param[i].powerId ==2){
												td+="<td>顶级代理商</td>";
											}
											td+="<th><a href='#rechargeModal' data-toggle='modal' onclick=getManagerId("+param[i].id+")>充值 </a>";
											if(currentId == "1"){
												td+="/<a href='#reduceRoomCardModal' data-toggle='modal' onclick=getManagerId("+param[i].id+")>退卡 </a>";
											}
											td+="</th>";
											td+="<td><a href='#deleteModa' data-toggle='modal' onclick=deleteProxy("+param[i].id+")>删除 </a>";
											if(currentId == "1"){
												td+="&nbsp;&nbsp;/&nbsp;&nbsp;<a href='#resetManagerPwd' data-toggle='modal' onclick=getManagerId("+param[i].id+")>找回密码</a>";
											}
											td+="</td>";
							//添加每行数据
							$("#accountTbody").append("<tr>"+td+"</tr>");
				          }); 
					}
				});
		    }
		    
		    if( clickPage == "activity"){
		    	//获取所有获奖人信息
		    	//微信账号weixin  	微信昵称nickName 	 奖品id:prizeId 	奖品名称:prizeName 
				//奖品数量（不需要） 	获奖时间createTime  发奖时间awardTime 	状态status
		   		 $.ajax({	
					   type: "POST",
					   url: "<%=basePath%>controller/manager/winnersInfo",
					   data: "",
					   success: function data(data){
							var param = eval(data);
							$("#activityTbody").html("");
					        $.each(param, function (i, item) {
				                  var td = "<td>获取不到微信号</td>";
											td+="<td>"+param[i].nickName+"</td>";
											td+="<td>"+param[i].prizeId+"</td>";
											td+="<td>"+param[i].prizeName+"</td>";
											td+="<td>"+param[i].createTime+"</td>";
											if(param[i].awardTime != null){
												td+="<td>"+param[i].awardTime+"</td>";
											}
											else{
												td+="<td></td>";
											}
											if(param[i].status == "0"){
												td+="<td>未发放奖品</td>";
											}
											else{
												td+="<td>已经发放奖品</td>";
											}
							//添加每行数据
							$("#activityTbody").append("<tr>"+td+"</tr>");
				          }); 
					}
				});
		    }
		    
			if(clickPage != lastDisplayPage) {
				document.getElementById(clickPage).style.display = "block";
				document.getElementById(lastDisplayPage).style.display = "none";
				lastDisplayPage = clickPage;
			}
		}
		//房卡充值，确认充值
		function payCard(){
			//alert($("#payCardNum").val());
			//alert(userId);
			$.ajax({	
				   type: "POST",
				   url: "<%=basePath%>controller/manager/addActualCardToAccount",
				   data: "payCardNum="+$("#payCardNum").val()+"&userid="+userId+"&managerid="+managerId,
				   success: function data(data){
					   //成功返回之后重置userId,managerId
					  var param  = eval('('+data+')');
					  if(param.status == 0){
					  	//成功
					  	alert("充值成功!");
					   	if(userId != 0 && managerId == 0){
					   		//alert("给玩家充值");
					   		if(param.data != 1){
						  		//不为空，则说明是代理商为玩家充卡
						  		$("#userTbody").html("");
						  		 var td = "<td>"+param.data.uuid+"</td>";
											td+="<td>"+param.data.nickname+"</td>";
											td+="<td>"+param.data.roomcard+"</td>";
											if(param.data.status =="0"){
												td+="<td>正常</td>";
											}else{
												td+="<td>注销</td>";
											}	
											td+="<th><a href='#setModal' data-toggle='modal'  onclick=getUserId("+param.data.id+")>设置 </a></th>";
											td+="<th><a href='#rechargeModal' data-toggle='modal' onclick=getUserId("+param.data.id+")>充值 </a>/<a href='#reduceAccountRoomCardModal' data-toggle='modal' onclick=getUserId("+param.data.id+")>退卡 </a></th>";
							//添加每行数据
								$("#userTbody").append("<tr>"+td+"</tr>");
						  	}
						  	else{
						  			selectPage("user");
						  	}
					   	  }
					      else if(managerId != 0 && userId ==0){
					   		//alert("给管理充值");
					   		if(param.data != 1){
						  		//不为空，则说明是代理商为代理商充卡
						  		$("#accountTbody").html("");
						  		var td = "<td>"+param.data.name+"</td>";
												td+="<td>"+param.data.telephone+"</td>";
												td+="<td>"+param.data.actualcard+"</td>";
												td+="<td>"+param.data.totalcards+"</td>";
												if(param.data.powerId ==3){
													td+="<td>普通代理</td>";
												}
												else if(param.data.powerId ==2){
													td+="<td>顶级代理商</td>";
												}
												td+="<th><a href='#rechargeModal' data-toggle='modal' onclick=getManagerId("+param.data.id+")>充值 </a>/<a href='#reduceRoomCardModal' data-toggle='modal' onclick=getManagerId("+param.data.id+")>退卡 </a></th>";
												td+="<td><a href='#deleteModa' data-toggle='modal' onclick=deleteProxy("+param.data.id+")>删除 </a></td>";
							//添加每行数据
								$("#accountTbody").append("<tr>"+td+"</tr>");
						  	}
						  	else{
						  		selectPage("account"); 
						  	}
					      }
					      
					    //代理商给玩家充值，更新个人资料展示
					      if(param.actualcard != null){
					      		$("#actualCard").text(param.actualcard);
					      }
					      
					 }
					 else{
					 	//失败处理
						 alert(param.error);
					}
				 }
			});
		}
		
		function saveManager(){
			//新增代理商/零售商 保存
			$.ajax({	
				   type: "POST",
				   url: "<%=basePath%>controller/manager/addProxyAccount",
				   data: "newManagerName="+$("#newManagerName").val()+"&newManagerPwd="+$("#newManagerPwd").val()+"&newManagerTel="+$("#newManagerTel").val()+"&newManagerType="+$("#newManagerType").val(),
				   success: function data(data){
					   //成功返回之后重置userId,managerId
					  var param  = eval('('+data+')');
					  if(param.status == 0){
					  	//成功
					  		alert("增加用户成功!");
					  		$("#newManagerName").val("");
							$("#newManagerPwd").val("");
							$("#newManagerTel").val("");
							$("#newManagerType").val("");
					  }
					  else{
					  	//失败处理
					  	alert(param.error);
					  }
				   	  selectPage("account");
				   }
			});
		}
		
		function getUserId(userid){
			userId = userid;
			managerId = 0;
			$("#reduceAccountCardNum").val("");
			$("#payCardNum").val("");
		}
		function getManagerId(managerid){
			managerId = managerid;
			userId = 0;
			$("#payCardNum").val("");
			$("#reduceManagerCardNum").val("");
		}
		
		function frameChangeSelect(){
			var obj=document.getElementById('gift_display_select');
			var index=obj.selectedIndex; //序号，取当前选中选项的序号
			if(index == 0){//结果查询
				document.getElementById("result_frame").style.display  = "block";
				document.getElementById("gift_rule_set").style.display = "none";
				document.getElementById("content_gift_set").style.display = "none";
			}else if(index ==1){//抽奖设置 活动规则说明
				document.getElementById("result_frame").style.display  = "none";
				document.getElementById("gift_rule_set").style.display = "block";
				document.getElementById("content_gift_set").style.display = "none";
				$.ajax({	
				   type: "POST",
				   url: "<%=basePath%>controller/manager/prizesStatus",
				   data: "type=0",
				   success: function data(data){
				   			var param = eval('('+data+')');
				   			if(param.status == "0"){
				   				$("#prizeType").val("开启");
				   			}
				   			else if(param.status == "1"){
				   				$("#prizeType").val("关闭");
				   			}
				   
				   }
				});
				
			}else if(index ==2){//奖品设置
				document.getElementById("result_frame").style.display  = "none";
				document.getElementById("gift_rule_set").style.display = "none";
				document.getElementById("content_gift_set").style.display = "block";
				//获取奖品信息,奖品设置
				flag = 0;
				$.ajax({	
				   type: "POST",
				   url: "<%=basePath%>controller/manager/prizesInfo",
				   data: "",
				   success: function data(data){
				   			totalProbability = 0;
							var param = eval(data);
					  		$("#prizeTbody").html("");
					        $.each(param, function (i, item) {
					        		totalProbability = totalProbability+param[i].probability;
				                    var td = "<td>"+param[i].id+"</td>";
				                  			td+="<td><img  id='img"+param[i].id+"' src='<%=basePath%>"+param[i].imageUrl+"'/></td>";
											td+="<td><input style='width: 150px;'  id='upImg"+param[i].id+"' disabled='true' type='file'  name='file'  onchange=changeImg('"+param[i].id+"',this.value)></td>";
											td+="<td><input style='width: 50px;' type='text'  id='count"+param[i].id+"'disabled='true' value='"+param[i].prizecount+"'/></td>";
											td+="<td><input type='text'  id='name"+param[i].id+"'disabled='true' value='"+param[i].prizeName+"'/></td>";
											
											td+="<td><select id='type"+param[i].id+"' style='height: 20px;' disabled='true' onchange='changeSelect()'>";
											
											if(param[i].type == 0){
												//房卡
												td+="<option value='0' style='color: #333;' selected='selected'>房卡</option>";
												td+="<option value='1' style='color: #333;'>话费</option>";
												td+="<option value='2' style='color: #333;'>其他</option></select></td>";
											}
											else if(param[i].type == 1){
												//话费
												td+="<option value='0' style='color: #333;' >房卡</option>";
												td+="<option value='1' style='color: #333;' selected='selected'>话费</option>";
												td+="<option value='2' style='color: #333;'></option></select></td>";
											}
											else{
												//其他实物
												td+="<option value='0' style='color: #333;'>房卡</option>";
												td+="<option value='1' style='color: #333;'>话费</option>";
												td+="<option value='2' style='color: #333;' selected='selected'>其他</option></select></td>";
											}
											td+="<td><input type='text'  id='probability"+param[i].id+"' disabled='true' value='"+param[i].probability+"'/></td>";
											td+="<td><input type='button' id='savePrize"+param[i].id+"' onclick=savePrize('"+param[i].id+"')  value='修改'/></td>";
											
							//添加每行数据
							$("#prizeTbody").append("<tr>"+td+"</tr>");
				          });
				          $("#totalProbability").text(totalProbability);
				   	}
				});
			}		
		}
		//修改保存奖品信息
		function savePrize(id){
			if($("#savePrize"+id+"").val() == "修改"  && flag == 0){
				flag = 1;
				//点了修改，然后才是可以编辑状态
				$("#savePrize"+id+"").val("保存");
				$("#probability"+id+"").attr("disabled",false);
				$("#name"+id+"").attr("disabled",false);
				$("#upImg"+id+"").attr("disabled",false);
				$("#count"+id+"").attr("disabled",false);
				$("#type"+id+"").attr("disabled",false);
				
				oneProbability = $("#probability"+id+"").val();
				oneName = $("#name"+id+"").val();
				var imgurl = 	$("#img"+id+"").attr("src");
				afterUpImg = imgurl.substring(imgurl.indexOf("images"),imgurl.length);
				
			}
			else if($("#savePrize"+id+"").val() == "保存" && flag == 1){
				flag = 0;
				//点了保存之后，检测总概率是否大于10000
				totalProbability = parseInt(totalProbability)+ parseInt($("#probability"+id+"").val()) - parseInt(oneProbability);
				if(1==2){
						//后期优化时 判断是否修改过数据
						/* $("#probability"+id+"").attr("disabled",true);
						$("#name"+id+"").attr("disabled",true);
						$("#savePrize"+id+"").val("修改");
						$("#img"+id+"").attr("disabled",true);
						alert("未作修改，不需要保存"); */
				}
				else{
					if(totalProbability > 10000){
						totalProbability = parseInt(totalProbability) - parseInt(parseInt($("#probability"+id+"").val())) + parseInt(oneProbability);
						alert("总概率不能超过10000");
						flag = 1;
					}
					else{
						//下面进行修改数据库操作
						alert($("#type"+id+"").val());
						$.ajax({	
							   type: "POST",
							   url: "<%=basePath%>controller/manager/updatePrizeInfo",
							   data: "type="+$("#type"+id+"").val()+"&count="+$("#count"+id+"").val()+"&afterUpImg="+afterUpImg+"&oneName="+$("#name"+id+"").val()+"&probability="+$("#probability"+id+"").val()+"&id="+id,
							   success: function data(data){
							   		var param = eval('('+data+')');
							   		if(param.status_code == "0"){
										/* $("#savePrize"+id+"").val("修改");
										$("#probability"+id+"").attr("disabled",true);
										$("#name"+id+"").attr("disabled",true);
										$("#totalProbability").text(totalProbability); */
							   			alert("修改成功");
							   			frameChangeSelect();
							   		}
							   		else{
							   			alert(param.error);
							   			frameChangeSelect();
							   		}
							   }
						});
					}
				}
			}
			else{
				alert("请先保存上一次的操作!");			
			}
		}
	
		//发布游戏公告
		function saveGameNoitce(){
			$.ajax({	
				   type: "POST",
				   url: "<%=basePath%>controller/manager/sendNotice",
				   data: "notice="+$("#gameNotice").val(),
				   success: function data(data){
				   var param = eval('('+data+')');
							if(param.status_code == "0"){
							  	alert("发布成功 ");
							}
							else{
							 	alert(param.error);
							}
				   	}
				});
		}
		
		//活动管理奖品设置
		function prizeRule(){
			var prizeRule = $("#prizeRule").val();
			var prizePerDay = $("#prizePerDay").val();
				$.ajax({	
				   type: "POST",
				   url: "<%=basePath%>controller/manager/updatePrizeRule",
				   data: "prizeRule="+prizeRule+"&prizePerDay="+prizePerDay,
				   success: function data(data){
				   var param = eval('('+data+')');
							if(param.status_code == "0"){
							  	alert("修改成功，次数在次日凌晨生效!");
							}
							else{
							 	alert(param.error);
							}
				   	}
				});
		}
		
		//充房卡信息
		function saveContactway(){
			var newContact = $("#newContact").val();
				$.ajax({	
				   type: "POST",
				   url: "<%=basePath%>controller/manager/updateContactway",
				   data: "newContact="+newContact,
				   success: function data(data){
				   var param = eval('('+data+')');
							if(param.status_code == "0"){
							  	alert("信息修改成功");
							}
							else{
							 	alert(param.error);
							}
				   	}
				});
		}
		
		//搜索玩家功能
		function searchAccount(){
			var accountUuid = $("#accountUuid").val();
			if(accountUuid != "请输入玩家id" && accountUuid != ""){
				$.ajax({	
				   type: "POST",
				   url: "<%=basePath%>controller/manager/searchAccountByUuid",
				   data: "accountUuid="+accountUuid,
				   success: function data(data){
				 			var param = eval('('+data+')');
				 			//超级管理员需要先移除列表
							if(param.status_code == "0"){
				 				$("#userTbody").html("");
							     var td = "<td>"+param.data.uuid+"</td>";
									    td+="<td>"+param.data.nickname+"</td>";
										td+="<td>"+param.data.roomcard+"</td>";
											if(param.data.status =="0"){
												td+="<td>正常</td>";
											}else{
												td+="<td>注销</td>";
											}	
											td+="<th><a href='#setModal' data-toggle='modal' onclick=getUserId("+param.data.id+")>设置 </a></th>";
											td+="<th><a href='#rechargeModal' data-toggle='modal' onclick=getUserId("+param.data.id+")>充值 </a>/<a href='#reduceAccountRoomCardModal' data-toggle='modal' onclick=getUserId("+param.data.id+")>退卡 </a></th>";
									//添加每行数据
									$("#userTbody").append("<tr>"+td+"</tr>");
							}
							else{
							 	alert(param.error);
							}
				   	}
				});
			}
			else{
				alert("请输入玩家id");
			}
		}
		
		/*
		*搜索代理商功能（只能搜索自己下面的代理商）
		*/
		function searchManager(){
			var managerTel = $("#managerTel").val();
			if(managerTel != "请输入代理手机号码" && managerTel != ""){
				$.ajax({	
				   type: "POST",
				   url: "<%=basePath%>controller/manager/searchManagerByTel",
				   data: "managerTel="+managerTel,
				   success: function data(data){
				 			var param = eval(data);
							 $("#accountTbody").html("");
					         $.each(param, function (i, item) {
					        	 var td = "<td>"+param[i].name+"</td>";
											td+="<td>"+param[i].telephone+"</td>";
											td+="<td>"+param[i].actualcard+"</td>";
											td+="<td>"+param[i].totalcards+"</td>";
											if(param[i].powerId == 2){
												td+="<td>顶级代理</td>";
											}
											else{
												td+="<td>普通代理</td>";
											}
											td+="<th><a href='#rechargeModal' data-toggle='modal'  onclick=getManagerId("+param[i].id+")>充值 </a>/<a href='#reduceRoomCardModal' data-toggle='modal' onclick=getManagerId("+param[i].id+")>退卡 </a></th>";
											td+="<td><a href='#deleteModa' data-toggle='modal' onclick=getManagerId("+param[i].id+")>删除 </a></td>";
								//添加每行数据
								$("#accountTbody").append("<tr>"+td+"</tr>");
					        })
							/* if(param.status_code == "0"){
				 				 $("#accountTbody").html("");
							      var td = "<td>"+param.data.name+"</td>";
											td+="<td>"+param.data.telephone+"</td>";
											td+="<td>"+param.data.actualcard+"</td>";
											td+="<td>"+param.data.totalcards+"</td>";
											if(param.data.powerId == 2){
												td+="<td>顶级代理</td>";
											}
											else{
												td+="<td>普通代理</td>";
											}
											td+="<th><a href='#rechargeModal' data-toggle='modal'  onclick=getManagerId("+param.data.id+")>充值 </a>/<a href='#reduceRoomCardModal' data-toggle='modal' onclick=getManagerId("+param.data.id+")>退卡 </a></th>";
											td+="<td><a href='#deleteModa' data-toggle='modal' onclick=getManagerId("+param.data.id+")>删除 </a></td>";
								//添加每行数据
								$("#accountTbody").append("<tr>"+td+"</tr>");
							}
							else{
							 	alert(param.error);
							} */
				   	}
				});
			}
			else{
				alert("请输入代理手机号码");
			}
		}
		
           var advertisementImg;
           function changeImg(id,image){ //ajax上传图片
           		alert(id+"--"+image)
               ajaxFileUpload(id,image);
           }
           function ajaxFileUpload(id,image) {//ajax上传图片
              var type = image.substring(image.lastIndexOf(".") + 1, image.length).toLowerCase();
              var fileid;
              var type;
              if (type != "jpeg" && type != "jpg" && type != "png" && type !="bmp") {
                    alert("logo图片格式仅限PNG，JPG或BMP！请重新选择图片上传！！");
                     return;
              }else{
	              	fileid = "upImg"+id;
	                $.ajaxFileUpload
	                (
                    {
                        url: "<%=basePath%>uploadAndDown/uploadImg",
                        secureuri: false, //是否需要安全协议，一般设置为false
                        fileElementId: fileid, //文件上传域(上传文件的imput)的ID
                        dataType: "text", //返回值类型 一般设置为json
                        success: function data(data){ //服务器成功响应处理函数
                       	   var dat = eval("("+data+")");
                       	   $("#img"+id+"").attr("src", "<%=basePath%>"+dat.imgurl);
                       	   afterUpImg = dat.imgurl;
                        }
                    }
                );
                return false;
            }
         }
         //退代理商的卡功能，只有超管才能退卡  
         function reduceManagerRoomCard(){
         	//alert(managerId);
         	//alert(userId);
         	$.ajax({	
				   type: "POST",
				   url: "<%=basePath%>controller/manager/reduceManagerRoomCard",
				   data: "managerId="+managerId+"&cardNumb="+$("#reduceManagerCardNum").val(),
				   success: function data(data){
				 			var param = eval('('+data+')');
							if(param.status == "0"){
						 		  $("#accountTbody").html("");
							      var td = "<td>"+param.data.name+"</td>";
										/* 	td+="<td>****</td>"; */
											td+="<td>"+param.data.telephone+"</td>";
											td+="<td>"+param.data.actualcard+"</td>";
											td+="<td>"+param.data.totalcards+"</td>";
											if(param.data.powerId == 2){
												td+="<td>顶级代理</td>";
											}
											else{
												td+="<td>普通代理</td>";
											}
											td+="<th><a href='#rechargeModal' data-toggle='modal'  onclick=getManagerId("+param.data.id+")>充值 </a>/<a href='#reduceRoomCardModal' data-toggle='modal' onclick=getManagerId("+param.data.id+")>退卡 </a></th>";
											td+="<td><a href='#deleteModa' data-toggle='modal' onclick=getManagerId("+param.data.id+")>删除 </a></td>";
								//添加每行数据
								$("#accountTbody").append("<tr>"+td+"</tr>");
							}
							else{
							 	alert(param.error);
							}
				   	}
				});
         
         }  
         
         //退玩家的卡功能，只有超管才能退卡  
         function reduceAccountRoomCard(){
         	//alert(managerId);
         	//alert(userId);
         	$.ajax({	
				   type: "POST",
				   url: "<%=basePath%>controller/manager/reduceAccountRoomCard",
				   data: "accountId="+userId+"&cardNumb="+$("#reduceAccountCardNum").val(),
				   success: function data(data){
				 			var param = eval('('+data+')');
							if(param.status == "0"){
								  $("#userTbody").html("");
								  var td = "<td>"+param.data.uuid+"</td>";
									    td+="<td>"+param.data.nickname+"</td>";
										td+="<td>"+param.data.roomcard+"</td>";
											if(param.data.status =="0"){
												td+="<td>正常</td>";
											}else{
												td+="<td>注销</td>";
											}	
											td+="<th><a href='#setModal' data-toggle='modal' onclick=getUserId("+param.data.id+")>设置 </a></th>";
											td+="<th><a href='#rechargeModal' data-toggle='modal' onclick=getUserId("+param.data.id+")>充值 </a>/<a href='#reduceAccountRoomCardModal' data-toggle='modal' onclick=getUserId("+param.data.id+")>退卡 </a></th>";
									//添加每行数据
									$("#userTbody").append("<tr>"+td+"</tr>");
							}
							else{
							 	alert(param.error);
							}
				   	}
				});
         } 
         
         //修改玩家状态 status
         function updateAccountStatus(){
         	if(confirm("确认删除该用户？")){
	         	$.ajax({	
					   type: "POST",
					   url: "<%=basePath%>controller/manager/updateAccountStatus",
					   data: "accountId="+userId+"&status="+$("#accountStatus").val(),
					   success: function data(data){
					 			var param = eval('('+data+')');
								if(param.status == "0"){
									  alert("删除成功");
									  selectPage("user");
								}
								else{
								 	alert(param.error);
								}
					   	}
					});
         	}
         } 
         
         //删除代理商
         function deleteProxy(managerid){
         if(confirm("确认删除该代理商?")){
	         	$.ajax({	
					   type: "POST",
					   url: "<%=basePath%>controller/manager/updateManagerStatus",
					   data: "manangerId="+managerid,
					   success: function data(data){
					 			var param = eval('('+data+')');
								if(param.status == "0"){
									  alert("删除成功");
									  selectPage("account");
								}
								else{
								 	alert(param.error);
								}
					   	}
					});
         	}
         }
         //充值代理商密码
         function resetManagerPwd(){
         	var resetOnePwd = $("#resetOnePwd").val();
         	var resetTwoPwd = $("#resetTwoPwd").val();
         	if(resetOnePwd == resetTwoPwd){
	         	$.ajax({	
					   type: "POST",
					   url: "<%=basePath%>controller/manager/updateManagerPwd",
					   data: "managerId="+managerId+"&newPwd="+resetOnePwd,
					   success: function data(data){
					 			var param = eval('('+data+')');
								if(param.status_code == "0"){
									  alert("修改成功");
									  selectPage("account");
									  $("#resetOnePwd").val("");
         								$("#resetTwoPwd").val("");
								}
								else{
								 	alert(param.error);
								}
					   	}
					});
         	}
         	else{
         		alert("两次密码必须一致!");
         	}
         }
         
         
         //管理员密码账号修改保存
         function saveManagerInfo(){
         		var oldPwd = $("#oldPwd").val();
         		var oldTel = $("#oldTel").val();
         		var newOnePwd = $("#newOnePwd").val();
         		var oneTel = $("#oneTel").val();
         		var newTwoPwd = $("#newTwoPwd").val();
         		var twoTel = $("#twoTel").val();
         		if(newOnePwd ==newTwoPwd &&  oneTel == twoTel){
         			$.ajax({	
					   type: "POST",
					   url: "<%=basePath%>controller/manager/updateManagerInfo",
					   data: "oldPwd="+oldPwd+"&oldTel="+oldTel+"&newPwd="+newOnePwd+"&oneTel="+oneTel,
					   success: function data(data){
					 			var param = eval('('+data+')');
								if(param.status == "0"){
									  alert("资料修改成功");
									  
								}
								else{
								 	alert(param.error);
								}
								//清除数据,
								$("#oldPwd").val("");
				         		$("#oldTel").val("");
				         		$("#newOnePwd").val("");
				         		$("#oneTel").val("");
				         		$("#newTwoPwd").val("");
				         		$("#twoTel").val("");
				         		//更新个人信息展示
				         		if(oneTel == twoTel && oneTel != null && oneTel != ""){
									$("#tel").text(param.tel);
				         		}
					   	}
					});
         		}
         		else{
         			alert("两次输入的新密码或者新手机号必须相同!");
         		}
         }
         //退出登录
         function logout(){
       			  $.ajax({	
					   type: "POST",
					   url: "<%=basePath%>controller/manager/logout",
					   data: "",
					   success: function data(data){
					   			window.location = "<%=basePath%>login.jsp";
					   	}
					});
         }
         
         //app端抽奖功能开启 关闭
         function changeStatus(status){
         	if(status == "开启"){
         		//关闭抽奖
         		$.ajax({	
				   type: "POST",
				   url: "<%=basePath%>controller/manager/prizesStatus",
				   data: "type=1&status=1",
				   success: function data(data){
				   			var param = eval('('+data+')');
				   			if(param.status == "0"){
				   				alert("关闭成功");
				   				$("#prizeType").val("关闭");
				   			}
				   			else {
				   				alert(param.error);
				   			}
				   }
				});
         	}
         	else if(status == "关闭"){         		
         		//开启抽奖
         		$.ajax({	
				   type: "POST",
				   url: "<%=basePath%>controller/manager/prizesStatus",
				   data: "type=1&status=0",
				   success: function data(data){
				   			var param = eval('('+data+')');
				   			if(param.status == "0"){
				   				alert("开启成功");
				   				$("#prizeType").val("开启");
				   			}
				   			else {
				   				alert(param.error);
				   			}
				   }
				});
         	}
         }
         
         function userinfo(){
         	 $("#mobileUserInfo").toggle();	
         }
         
	</script>

</html>