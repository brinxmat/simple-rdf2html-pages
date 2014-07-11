<!DOCTYPE html><%@ page pageEncoding="UTF-8" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %><fmt:setLocale value="en" scope="session"/><fmt:setBundle basename="Messages" var="lingua" /><fmt:message key="initialSearchText" bundle="${lingua}" var="initialSearchText" /><fmt:message key="searchButtonText" bundle="${lingua}" var="searchButtonText" /><fmt:message key="webeditor" bundle="${lingua}" var="webeditor" /><fmt:message key="about" bundle="${lingua}" var="about" /><fmt:message key="rightsnotice" bundle="${lingua}" var="rightsnotice" /><fmt:message key="contact" bundle="${lingua}" var="contact" />
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="chrome-1"/>
		<meta content="True" name="HandheldFriendly"/>
		<meta name="viewport" content="width=device-width"/>
		<meta name="google-site-verification" content="a1uf7qcFosH7CrxLKqONQujxnprZGyyOKI5u8WKr2DE" />
		<link href="http://fonts.googleapis.com/css?family=Share+Tech" rel="stylesheet" type="text/css">
	 	<link href="http://www.ntnu.no/ub/data/simple-rdf2html-pages/css/reset.css" rel="stylesheet" type="text/css">
		<link href="http://www.ntnu.no/ub/data/simple-rdf2html-pages/css/responsive.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="http://www.ntnu.no/ub/data/simple-rdf2html-pages/css/small.css" type="text/css" media="only screen and (max-width: 480px), only screen and (max-device-width: 480px), only screen and (max-height: 480px), only screen and (max-device-height: 480px)">
		<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/ui-darkness/jquery-ui.min.css" rel="stylesheet" type="text/css">
		<title><fmt:message key="title" bundle="${lingua}" /></title>
	</head>
	<body>
<%@include file="include/header.jsp" %>
		<div class="view">
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
<%@include file="include/footer.jsp" %>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
		<script type="text/javascript" src="http://www.ntnu.no/ub/data/simple-rdf2html-pages/js/autocomplete.js"></script>
		<script src="http://www.ntnu.no/ub/data/simple-rdf2html-pages/js/${pageContext.request.locale.language}/main.js" type="text/javascript"></script>
	</body>
</html>
