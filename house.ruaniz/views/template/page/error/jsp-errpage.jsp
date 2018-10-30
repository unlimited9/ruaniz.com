<%@ page import="java.io.*" %>
<%@ page isErrorPage="true" %>
<html>
<head>
<title></title>
<style type="text/css"><!--
body	{font-family:arial,sans-serif}
div.nav	{margin-top:1ex}
div.nav A	{font-size:10pt; font-family:arial,sans-serif}
span.nav	{font-size:10pt; font-family:arial,sans-serif; font-weight:bold}
div.nav A,span.big	{font-size:12pt; color:#0000cc}
div.nav A	{font-size:10pt; color:black}
A.l:link	{color:#6f6f6f}
A.u:link	{color:green}
//--></style>
</head>
<body text=#000000 bgcolor=#ffffff>
	<table border=0 cellpadding=2 cellspacing=0 width=100%>
		<tr>
		<td rowspan=3 width=1% nowrap>
		<b>
		<font face=times color=#0039b6 size=10>Hajimaro</font>&nbsp;&nbsp;</b>
		<td>&nbsp;</td>
		</tr><tr><td bgcolor=#3366cc>
		<font face=arial,sans-serif color=#ffffff>
		<b>Error</b>
		</font>
		</td>
		</tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
	</table>
	<blockquote>
	<H1> An exception was thrown: </H1> <%= exception %>
	
	<p> With the following stack trace:
	
	<%
	    ByteArrayOutputStream ostr = new ByteArrayOutputStream();
	    exception.printStackTrace(new PrintStream(ostr));
	    out.print(ostr);
	%>
	<p>
	</blockquote>
	<table width=100% cellpadding=0 cellspacing=0>
		<tr>
		<td bgcolor=#3366cc>
		<img alt="" width=1 height=4>
		</td>
		</tr>
	</table>
</body>
</html>

