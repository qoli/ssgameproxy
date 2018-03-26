<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta HTTP-EQUIV="Pragma" CONTENT="no-cache"/>
		<meta HTTP-EQUIV="Expires" CONTENT="-1"/>
		<link rel="shortcut icon" href="images/favicon.png"/>
		<link rel="icon" href="images/favicon.png"/>
		<title>软件中心 - ssgameproxy</title>
		<link rel="stylesheet" type="text/css" href="index_style.css"/>
		<link rel="stylesheet" type="text/css" href="form_style.css"/>
		<link rel="stylesheet" type="text/css" href="usp_style.css"/>
		<script type="text/javascript" src="/state.js"></script>
		<script type="text/javascript" src="/popup.js"></script>
		<script type="text/javascript" src="/help.js"></script>
		<script type="text/javascript" src="/validator.js"></script>
		<script type="text/javascript" src="/js/jquery.js"></script>
		<script type="text/javascript" src="/general.js"></script>
		<script type="text/javascript" src="/switcherplugin/jquery.iphone-switch.js"></script>
		<script>
		var submitDatas = {};
		submitDatas["action_mode"] = " Refresh ";
		submitDatas["SystemCmd"] = "ssrproxy.sh";
		submitDatas["current_page"] = "Module_ssgameproxy.asp";
		submitDatas["ssgameproxy_request"] = 00;
		function init() {
			show_menu();
			getDataStatus();
		}

		function onClick() {
			submitData("switch")
			setTimeout(getDataStatus,3000);
		}

		function onCP() {
			submitData("cp")
			setTimeout(getDataStatus,3000);
		}

		function submitData(r) {
			submitDatas["ssgameproxy_request"] = r;
			$.ajax({
				type: "POST",
				url: "applydb.cgi?p=ssgameproxy_",
				dataType: "text",
				data: submitDatas,
				success: function(data) {
					console.log(data)
					console.log(submitDatas["ssgameproxy_request"])
					$("#info").html("通信中……"+r);
				},
				error: function() {
					$("#info").html("與 applydb 通信錯誤");
				}
			})
		}

		function getDataStatus() {
			$.ajax({
				type: "get",
				url: "dbconf?p=ssgameproxy_",
				dataType: "script",
				success: function(s) {
					// 設定開關狀態
					// buildIphoneSwitch(db_ssgameproxy_['ssgameproxy_enable'])
					if (db_ssgameproxy_['ssgameproxy_enable'] == 1) {
						$("#info").html("運行中…");
					} else {
						$("#info").html("關閉");
					}
					$("#server").html(db_ssgameproxy_['ssgameproxy_server']);
					$("#pid").html(db_ssgameproxy_['ssgameproxy_pid']);
				}
			})
		}

		// function buildIphoneSwitch(x) {
		// 	ssgameproxyEnable = x;
		// 	$('#radio_enable').iphoneSwitch(x, function() {
		// 		ssgameproxyEnable = 1;
		// 	}, function() {
		// 		ssgameproxyEnable = 0;
		// 	})
		// }

		function reload_Soft_Center(){
			location.href = "/Main_Soft_center.asp";
		}
		</script>
	</head>
	<body onload="init();">
		<div id="TopBanner"></div>
		<div id="Loading" class="popup_bg"></div>
		<input type="hidden" name="preferred_lang" id="preferred_lang" value="<% nvram_get("preferred_lang"); %>"/>
		<table class="content" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="17">&nbsp;</td>
				<td valign="top" width="202">
					<div id="mainMenu"></div>
					<div id="subMenu"></div>
				</td>
				<td valign="top">
					<div id="tabMenu" class="submenuBlock"></div>
					<table width="98%" border="0" align="left" cellpadding="0" cellspacing="0">
						<tr>
							<td align="left" valign="top">
								<table width="760px" border="0" cellpadding="5" cellspacing="0" bordercolor="#6b8fa3" class="FormTitle" id="FormTitle">
									<tr>
										<td bgcolor="#4D595D" colspan="3" valign="top">
											<div class="formfonttitle">單獨的遊戲代理</div>
											<div style="float:right; width:15px; height:25px;margin-top:10px"><img id="return_btn" onclick="reload_Soft_Center();" align="right" style="cursor:pointer;position:absolute;margin-left:-30px;margin-top:-25px;" title="返回软件中心" src="/images/backprev.png" onMouseOver="this.src='/images/backprevclick.png'" onMouseOut="this.src='/images/backprev.png'"></img></div>
											<div style="margin-left:5px;margin-top:10px;margin-bottom:10px"><img src="/images/New_ui/export/line_export.png"></div>
											<div class="formfontdesc" id="cmdDesc"></div>
											<table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable" >
												<tr>
													<tr>
														<th width="20%">伺服器</th>
														<td><span id="server">-</span>
													</td>
													<tr>
														<th width="20%">狀態</th>
														<td><span id="info"></span>
													</td>
													<tr>
														<th width="20%">PID</th>
														<td><span id="pid"></span>
													</td>
												</tr>
											</table>
											<div class="apply_gen">
												<button class="button_gen" onclick="onCP()">複製配置</button>
												<button class="button_gen" onclick="onClick()">啟動或關閉</button>
											</div>
											<div style="margin-left:5px;margin-top:10px;margin-bottom:10px"><img src="/images/New_ui/export/line_export.png"></div>
											<div id="NoteBox">
												
<h2>獨立的代理設定</h2>
<h3>簡單操作說明</h3>
<h3>流程：</h3>
<p></p>
<ol><li>在「科學上網」工具下，連接將要用於「SSProxy」的代理。</li>
<li>在「SSProxy」工具，點擊「複製配置」按鈕。</li>
<li>在「科學上網」下，可以使用你喜歡的代理了。</li>
<li>回來「SSProxy」工具，點擊「啟動或關閉」按鈕。</li>
</ol>
<div>代理可用於 PS4 或其他可指定 Socks5 代理的軟體和遊戲<br />
驗證代理是否成功，可訪問 ip111.cn</div>
<h3>Socks5 代理：</h3>
<p>192.168.1.1:5500</p>
<h3>HTTP 代理：</h3>
<p>192.168.1.1:5501</p>
<h4>備註：</h4>
<div>PS4 需要使用 http 代理</div>
<div>socks5 代理是基於 ss-local 的 ACL 配置以實現大陸白遊戲模式的智能分流。</div>
<div><h4>terminal.app Proxy 設定模板</h4>
<pre>export https_proxy=http://192.168.1.1:5501;export http_proxy=http://192.168.1.1:5501</pre> </div>

											</div>
											
											<div style="margin-left:5px;margin-top:10px;margin-bottom:10px"><img src="/images/New_ui/export/line_export.png"></div>
											<div class="KoolshareBottom">
												<br/>论坛技术支持： <a href="http://www.koolshare.cn" target="_blank"> <i><u>www.koolshare.cn</u></i> </a> <br/>
												后台技术支持： <i>Xiaobao</i> <br/>
												Shell, Web by： <a href="http://ganky.vicp.net" target="_blank"><i>Ganky</i></a><br/>
											</div>
											</td>
										</tr>
									</table>
								</td>
								<td width="10" align="center" valign="top"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</td>
<td width="10" align="center" valign="top"></td>
</tr>
</table>
<div id="footer"></div>
</body>
</html>