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
_setSbMenu = function() {
	$('#_nav_title_area').text($('#_rtMenu_'+_current_workplace[1]).text());

	var sbMenus = _workplace.selectNodes("/workplace-config/workplace[@id='"+_current_workplace[1]+"']/sub-workplace/workplace[@status='A']");

	$('#_nav_area').css('display', sbMenus.length == 0 ? 'none' : 'block');
	$('#_main_area').css('left', sbMenus.length == 0 ? '0px' : $('#_nav_area').css('width'));
	
	var sbMenuArea = $('#_nav_sub_menu_area');
	sbMenuArea.children().remove();
	
	for(var sbMenuIdx=0; sbMenuIdx < sbMenus.length; sbMenuIdx++) {
		var sbMenu = sbMenus[sbMenuIdx];
		sbMenuArea.append("<li><a href=\""+_getHyperlinkReference(sbMenu)+"\"><button id=\"_sbMenu_"+sbMenu.getAttribute("id")+"\" onclick=\"javascript:_selectSbMenu('"+sbMenu.getAttribute("id")+"');\" class=\"btn sub_menu"+((_current_workplace[2] == sbMenu.getAttribute("id")) ? "_selected" : "")+"\">"+sbMenu.getAttribute("inscription")+"</button></a></li>");
	}
};

_selectSbMenu = function(menuID) {
	if(_current_workplace[2] != menuID) {
		$('#_sbMenu_'+_current_workplace[2]).attr('class', 'btn sub_menu');
		_current_workplace[2] = menuID;
		$('#_sbMenu_'+_current_workplace[2]).attr('class', 'btn sub_menu_selected');
	}
	
	$('#_main_frame').attr('src', $('#_sbMenu_'+_current_workplace[2]).parent().attr("href"));
};

-->
</script>
</head>
<body>
<header id="_nav_header">
	<div style="position:absolute; top:0px; left:0px; right:0px; z-index:5; height:32px;">
		<section id="_nav_title">
			<div style="background-color: #3b609a; border-radius: 5px;"><!-- #254e8f -->
				<table>
					<tr>
						<td id="_nav_title_area" height="32px" style="padding-left:10px; color: #FFFFFF; font-weight: bold; font-size: 13px;"></td>
					</tr>
				</table>
			</div>
		</section>
	</div>
</header>

<section id="_nav_content">
	<div style="position:absolute; top:32px; bottom:0px; left:0px; right:0px; z-index:0; background-color: #eeeeee;">
		<article id="_nav_article">
			<div style="padding: 2px; font-size: 13px;">
				<ul id="_nav_sub_menu_area" style="border-top:1px solid #bfbfbf;"></ul>
			</div>
		</article>
	</div>
</section>

<footer id="_nav_footer">
	<div style="position:absolute; bottom:5px; left:0px; right:0px; z-index:5; background-color: #eeeeee;">
		<section id="_nav_contact">
			<div style="margin:5px; padding:2px; background-color:#d7d7d7; border-radius:5px; font-size: 12px;">
				<table style="width:100%; background-color:#f4f4f4; border-radius:5px;">
					<tr>
						<td style="padding-left:8px; line-height:24px; letter-spacing:-0.03em; font-size: 13px; font-weight:bold; color:#296f9f; text-decoration: underline;">
							CONTACT POINT
						</td>
					</tr><tr>
						<td style="padding:0px 8px 5px 8px;">
							<ul style="list-style: none; padding-bottom:5px;">
								<li>- 인프라팀</li>
								<li>- <b>FWA 홍길동 대리</b></li>
								<li>- 010-9876-5432</li>
								<li>- honggildong@mail.com</li>
							</ul>
							<ul style="list-style: none; border-top:1px dashed #000; padding-top:5px;">
								<li>- 인프라팀</li>
								<li>- <b>FWA 홍길동 대리</b></li>
								<li>- 010-9876-5432</li>
								<li>- honggildong@mail.com</li>
							</ul>
						</td>
					</tr>
				</table>
			</div>
		</section>
	</div>
</footer>

</body>
</html>