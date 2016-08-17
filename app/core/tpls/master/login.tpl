<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="title" content="{x2;$apps['core']['appsetting']['seo']['title']}">
<meta name="description" content="{x2;$apps['core']['appsetting']['seo']['description']}">
<meta name="keywords" content="{x2;$apps['core']['appsetting']['seo']['keywords']}">
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>{x2;$apps['core']['appsetting']['seo']['title']}</title>
<!–[if lt IE9]>
<script src="app/core/styles/js/html5.js"></script>
<![endif]–>
<!-- Le styles -->
<link href="app/core/styles/css/bootstrap.css" rel="stylesheet">
<link href="app/core/styles/css/layoutit.css" rel="stylesheet">
<link href="app/core/styles/css/plugin.css" rel="stylesheet">
<!--
<script type="text/javascript" src="app/core/styles/js/jquery.min.js"></script>
-->
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="app/core/styles/js/html5shiv.js"></script>
<![endif]-->
<script type="text/javascript" src="app/core/styles/js/jquery-1.9.1.min.js"></script>

<script type="text/javascript" src="app/core/styles/js/bootstrap.min.js"></script>
<script type="text/javascript" src="app/core/styles/js/jquery-ui.js"></script>
<script type="text/javascript" src="app/core/styles/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="app/core/styles/js/swfu/swfupload.js"></script>
<script type="text/javascript" src="app/core/styles/js/plugin.js"></script>
<link href="app/user/styles/css/theme.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="row-fluid top">
	<div class="container">
		<div class="span12"><h2><img src="app/user/styles/img/theme/logo.png" /> 后台管理</h2></div>
		</div>
	</div>
</div>
<div class="row-fluid">
	<div class="container logcontent">
		<div class="logbox">
			<form class="form-horizontal logform" method="post" action="index.php?core-master-login">
				<fieldset>
					<legend>用户登录</legend>
					<div class="logcontrol">
						<div class="control-group">
							<label class="control-label" for="inputEmail">用户名：</label>
							<div class="controls">
								<input class="input-xlarge" type="text" name="args[username]" datatype="userName" needle="needle" msg="请你输入用户名"/><span>请输入您的用户名</span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="inputPassword">密码：</label>
							<div class="controls">
								<input class="input-xlarge" type="password" name="args[userpassword]" datatype="password" needle="needle" msg="请你输入密码"/><span>密码长度6位以上，数字、字母或其他字符</span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="inputPassword">验证码：</label>
							<div class="controls">
								<input class="input-small" type="text" maxlength="4" name="randcode"/><span><img src="index.php?core-api-randcode" class="randCode img-rounded"/></span><span>验证码长度4位，数字或字母</span>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<input type="hidden" value="1" name="userlogin"/>
								<button class="btn btn-info logbtn" type="submit">登录</button>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<p>请输入正确的用户名和密码登录　如果您还没有帐号，请在此<a href="index.php?user-app-register">注册</a></p>
							</div>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
		<div class="logbotm"></div>
	</div>
</div>
<div class="row-fluid">
	<div class="container logfooter">
		<ul class="inline unstyled">
			<li><a href="http://www.huikaowang.com">网站首页</a></li>
			<li>|</li>
			<li><a href="http://www.huikaowang.com/bbs/">用户须知</a></li>
			<li>|</li>
			<li><a href="http://www.huikaowang.com/bbs/">隐私协议</a></li>
			<li>|</li>
			<li><a href="http://www.huikaowang.com/bbs/">网站论坛</a></li>
			<li>|</li>
			<li>豫ICP备13016752号-1</li>
		</ul>
	</div>
</div>
</body>
</html>