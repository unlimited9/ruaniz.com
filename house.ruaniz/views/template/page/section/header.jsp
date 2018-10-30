<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/template/include/prelude.jspf" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title><es:message key="main.title" /></title>
<link rel="shortcut icon" type="image/ico" href="<es:uri uritype="web" uri="/image/favicon.ico" />" />
<link type="text/css" href="<es:uri uritype="web" uri="/stylesheet/cascade/style.css" />" rel="stylesheet" />
<script type="text/javascript" src="<es:uri uritype="web" uri="/script/jquery.js" />"></script>
<script type="text/javascript" src="<es:uri uritype="web" uri="/script/default.js" />"></script>
<script type="text/javascript">
<!--
_setRtMenu = function() {
	var rtMenus = _workplace.selectNodes("/workplace-config/workplace[@status='A']");
	var rtMenuArea = $('#_top_root_menu_area');
	rtMenuArea.children().remove();

	for(var rtMenuIdx=0; rtMenuIdx < rtMenus.length; rtMenuIdx++) {
		var rtMenu = rtMenus[rtMenuIdx];
		
		if(rtMenu.getAttribute("id") == 'administration' && !${fn:containsIgnoreCase(sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.authorities,'ROLE_ADMIN')})
			continue;

		rtMenuArea.append("<li><a href=\""+_getHyperlinkReference(rtMenu)+"\"><button id=\"_rtMenu_"+rtMenu.getAttribute("id")+"\" onclick=\"javascript:_selectRtMenu('"+rtMenu.getAttribute("id")+"');\" class=\"btn root_menu"+((_current_workplace[1] == rtMenu.getAttribute("id")) ? "_selected" : "")+"\">"+rtMenu.getAttribute("inscription")+"</button></a></li>");
	}
};

_selectRtMenu = function(menuID) {
	if(_current_workplace[1] != menuID) {
		$('#_rtMenu_'+_current_workplace[1]).attr('class', 'btn root_menu');
		_current_workplace[1] = menuID;
		$('#_rtMenu_'+_current_workplace[1]).attr('class', 'btn root_menu_selected');
	}

	$('#_main_frame').attr('src', $('#_rtMenu_'+_current_workplace[1]).parent().attr("href"));

	var _selectedMenu = _workplace.selectSingleNode("/workplace-config/workplace[@id='"+_current_workplace[1]+"']");

	var link = _selectedMenu.selectSingleNode("link");
	_current_workplace[2] = (link != null && link.getAttribute("type") == "submenu") ? link.selectSingleNode("text()").nodeValue : null;

	_setSbMenu();
};
-->
</script>
</head>
<body>
<header id="_top_header">
	<div style="position:absolute; top:0px; left:0px; right:0px; z-index:5; font-size: 13px;">
		<table style="width: 100%; min-width: 900px;">
			<tr>
				<td width="210px"><a href="<es:uri uritype="app" uri="" />" target="_top" onfocus='this.blur()'><img src="<es:uri uritype="web" uri="/image" />/layout/header/logo.jpeg" name="logo_img" width="210px" height="58px" border="0" id="logo_img" /></a></td>
				<td>
					<div style="text-align: right;">
						${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}님
						<form action="<es:uri uritype="dspt" uri="/security/authe/sign_out"/>" method="post" target="_top">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<input type="image" src="<es:uri uritype="web" uri="/image" />/layout/header/logout.gif" alt="로그아웃" />
							<!-- input type="submit" value="Logout" / -->
						</form>
					</div>
					<div style="margin-left: 20px; background: #254e8f; background: linear-gradient(#254e8f, #385d99); background: -ms-linear-gradient(#254e8f, #385d99); border-top: 1px solid #bfbfbf; border-bottom: 3px solid #173a6b; height: 32px; box-shadow: -20px 0px 0 #eee;">
						<ul id="_top_root_menu_area" style="list-style: none;"></ul>
					</div>
				</td>
			</tr>
		</table>
	</div>
</header>
</body>
</html>