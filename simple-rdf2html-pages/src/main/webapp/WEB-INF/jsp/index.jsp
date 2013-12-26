<!DOCTYPE html><%@ page pageEncoding="UTF-8" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %><fmt:setLocale value="en" scope="session"/><fmt:setBundle basename="Messages" var="lingua" /><fmt:message key="initialSearchText" bundle="${lingua}" var="initialSearchText" /><fmt:message key="searchButtonText" bundle="${lingua}" var="searchButtonText" /><fmt:message key="webeditor" bundle="${lingua}" var="webeditor" /><fmt:message key="about" bundle="${lingua}" var="about" /><fmt:message key="rightsnotice" bundle="${lingua}" var="rightsnotice" /><fmt:message key="contact" bundle="${lingua}" var="contact" />
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="chrome-1">
		<meta content="True" name="HandheldFriendly">
		<meta name="viewport" content="width=device-width">
		<link href='http://fonts.googleapis.com/css?family=Share+Tech' rel='stylesheet' type='text/css'>
	 	<link href="http://folk.ntnu.no/greenall/simple-rdf2html-pages/css/reset.css" rel="stylesheet" type="text/css">
		<link href="http://folk.ntnu.no/greenall/simple-rdf2html-pages/css/responsive.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="http://folk.ntnu.no/greenall/simple-rdf2html-pages/css/small.css" type="text/css" media="only screen and (max-width: 480px), only screen and (max-device-width: 480px), only screen and (max-height: 480px), only screen and (max-device-height: 480px)">
		<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/ui-darkness/jquery-ui.min.css" rel="stylesheet" type="text/css">
		<title><fmt:message key="title" bundle="${lingua}" /></title>
	</head>
	<body>
		<div class="header">
			<div class="title">
				<h1><fmt:message key="title" bundle="${lingua}" /></h1>
			</div>
			<div class="searchbox">
				<form name="searchForm" method="GET" action="search">
					<fieldset class="searchbox">
						<input name="query" class="search" id="search" placeholder="${initialSearchText}"/><input type="submit" class="searchGo" value="${searchButtonText}"/>
					</fieldset>
				</form>
			</div>
			
		</div>
		<div class="view">
			<div class="content">
			</div>
		</div>
		<div class="text">
			<div class="content">
				<div class="span-1 textcol">
				</div>
				<div class="span-2 textcol">
				</div>
				<div class="span-3 textcol">
				</div>
			</div>
		</div>
		<div class="footer">
			<div class="webeditor"><span>${webeditor}</span></div>
			<div class="navigation"><span>${rightsnotice}</span> | <span><a href="about" title="${about}">${about}</a></span> | <span><a href="contact" title="${contact}">${contact}</a></span></div>
		</div>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
		<script type="text/javascript" src="http://folk.ntnu.no/greenall/simple-rdf2html-pages/js/autocomplete.js"></script>
		<script src="http://folk.ntnu.no/greenall/simple-rdf2html-pages/js/${pageContext.request.locale.language}/main.js" type="text/javascript"></script>
	</body>
</html>
