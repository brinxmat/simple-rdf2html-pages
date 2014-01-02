<!DOCTYPE html><%@ page pageEncoding="UTF-8" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %><fmt:setLocale value="en" scope="session"/><fmt:setBundle basename="Messages" var="lingua" /><fmt:message key="initialSearchText" bundle="${lingua}" var="initialSearchText" /><fmt:message key="searchButtonText" bundle="${lingua}" var="searchButtonText" /><fmt:message key="webeditor" bundle="${lingua}" var="webeditor" /><fmt:message key="about" bundle="${lingua}" var="about" /><fmt:message key="rightsnotice" bundle="${lingua}" var="rightsnotice" /><fmt:message key="contact" bundle="${lingua}" var="contact" />
<c:set var="uri" value="${it.baseuri.baseuri[0]}"/>
<c:set var="baseuri" value=""/>
<%
pageContext.setAttribute("baseuri",pageContext.findAttribute("uri").toString() + request.getAttribute("javax.servlet.forward.servlet_path").toString());
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="chrome-1">
		<meta content="True" name="HandheldFriendly">
		<meta name="viewport" content="width=device-width">
		<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/ui-darkness/jquery-ui.min.css" rel="stylesheet" type="text/css">
		<link href="http://fonts.googleapis.com/css?family=Share+Tech" rel="stylesheet" type="text/css">
	 	<link href="http://folk.ntnu.no/greenall/simple-rdf2html-pages/css/reset.css" rel="stylesheet" type="text/css">
		<link href="http://folk.ntnu.no/greenall/simple-rdf2html-pages/css/responsive.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="http://folk.ntnu.no/greenall/simple-rdf2html-pages/css/small.css" type="text/css" media="only screen and (max-width: 480px), only screen and (max-device-width: 480px), only screen and (max-height: 480px), only screen and (max-device-height: 480px)">
		<title><fmt:message key="title" bundle="${lingua}" /></title>
	</head>
	<body>
		<div class="header">
			<div class="title">
				<h1><fmt:message key="title" bundle="${lingua}" /></h1>
			</div>
			<div class="searchbox">
				<form name="searchForm" method="GET" action="../search">
					<fieldset class="searchbox">
						<input name="query" class="search" id="search" placeholder="${initialSearchText}"/><input type="submit" class="searchGo" value="${searchButtonText}"/>
					</fieldset>
				</form>
			</div>
		</div>
		<div class="view">
			<div class="content">
				<img src="${it[baseuri]['http://schema.org/image'][0]}" alt="${it[baseuri]['http://schema.org/title'][0]}" />
			</div>
		</div>
		<div class="text">
			<div class="content">
				<div class="resource-data" itemscope itemtype="${it[baseuri]['http://www.w3.org/1999/02/22-rdf-syntax-ns#type'][0]}" prefix="schema: http://schema.org/ rdf: http://www.w3.org/1999/02/22-rdf-syntax-ns# dcterms: http://purl.org/dc/terms/" typeof="${it[baseuri]['http://www.w3.org/1999/02/22-rdf-syntax-ns#type'][0]}" about="${baseuri}">
					<div class="metadata">
						<ul>
							<li class="title" property="schema:title" itemprop="name" itemscope itemtype="http://schema.org/Person">${it[baseuri]['http://schema.org/title'][0]} (${it[baseuri]['http://schema.org/birthDate'][0]}–${it[baseuri]['http://schema.org/deathDate'][0]})</li>
							<li class="author" property="schema:description"  itemprop="description">${it[baseuri]['http://schema.org/description'][0]}</li>
							<li class="date" property="schema:dateCreated" itemProp="dateCreated">${it[baseuri]['http://schema.org/dateCreated'][0]}</li>
							<li class="identifier" property="dcterms:identifier">${it['identifier']['identifier'][0]}</li>
							<li class="subjects">
							</li>
						</ul>
					</div>
				</div>
				<div class="resources">

					<ul>
						<c:forEach items="${it[baseuri]['http://xmlns.com/foaf/0.1/made']}" var="entry">
    						<li itemscope itemtype="${it[entry]['http://www.w3.org/1999/02/22-rdf-syntax-ns#type'][0]}" prefix="schema: http://schema.org/ rdf: http://www.w3.org/1999/02/22-rdf-syntax-ns# dcterms: http://purl.org/dc/terms/" typeof="${it[entry]['http://www.w3.org/1999/02/22-rdf-syntax-ns#type'][0]}" about="${entry}"><span itemprop="title" ><a href="${entry}" title="${it[entry]["http://schema.org/title"][0]}">${it[entry]["http://schema.org/title"][0]}</a></span></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="footer">
			<div class="webeditor"><span>${webeditor}</span></div>
			<div class="navigation"><span>${rightsnotice}</span> | <span><a href="../about" title="${about}">${about}</a></span> | <span><a href="../contact" title="${contact}">${contact}</a></span></div>
		</div>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
		<script type="text/javascript" src="http://folk.ntnu.no/greenall/simple-rdf2html-pages/js/autocomplete.js"></script>
	</body>
</html>