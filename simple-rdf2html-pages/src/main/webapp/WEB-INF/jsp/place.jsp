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
				<form name="searchForm" method="GET" action="../search">
					<fieldset class="searchbox">
						<input name="query" class="search" id="search" placeholder="${initialSearchText}"/><input type="submit" class="searchGo" value="${searchButtonText}"/>
					</fieldset>
				</form>
			</div>
		</div>
		<div class="view">
			<div class="content">
				<script type="text/javascript" src="http://ubit.fillager.bibsys.no/fsi/js/fsiwriter.js"></script>
				<script type="text/javascript">
			<!--
			writeFlashCode( "http://ubit.fillager.bibsys.no/fsi/viewer/fsi.swf?cfg=pages_presets%2Fhard_cover_book&pages_dir=Publisering%2F${it.identifier.identifier[0]}&skin=black&language=english&effects=sharpen%3D30%2526quality%3D80&viewerborder=0A0000&pages_bendeffect=Matte&roundedskincorners=30&plugins=resize,fullscreen",
			"http://ubit.fillager.bibsys.no/fsi/server?type=image&source=Publisering%2F${it.identifier.identifier[0]}%2F001.jpg&width=468&height=814",
			"width=100%;height=100%;bgcolor=0A0000;mobilesupport=true");
			// -->
				</script>
				<noscript>
					<object data="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,65,0" type="x-application/shockwave-flash">
					<param name="movie" value="http://ubit.fillager.bibsys.no/fsi/viewer/fsi.swf?cfg=pages_presets%2Fhard_cover_book&amp;pages_dir=Publisering%2F${it.identifier.identifier[0]}&amp;skin=black&amp;language=english&amp;effects=sharpen%3D30%2526quality%3D80&amp;viewerborder=0A0000&amp;pages_bendeffect=Matte&amp;roundedskincorners=30&amp;plugins=resize,fullscreen">
					<param name="bgcolor" value="0A0000" />
					<param name="mobilesupport" value="true" />
					<param name="allowscriptaccess" value="always" />
					<param name="allowfullscreen" value="true" />
					<param name="quality" value="high" />
					<embed src="http://ubit.fillager.bibsys.no/fsi/viewer/fsi.swf?cfg=pages_presets%2Fhard_cover_book&amp;pages_dir=Publisering%2F${it.identifier.identifier[0]}&amp;skin=black&amp;language=english&amp;effects=sharpen%3D30%2526quality%3D80&amp;viewerborder=0A0000&amp;pages_bendeffect=Matte&amp;roundedskincorners=30&amp;plugins=resize,fullscreen"
					mobilesupport="true"
					allowscriptaccess="always"
					allowfullscreen="true"
					quality="high"
					type="application/x-shockwave-flash"
					pluginspage="http://www.adobe.com/go/getflashplayer" />
					</object>
				</noscript>
			</div>
		</div>
		<div class="text">
			<div class="content">
				<div class="resource-data" itemscope itemtype="${it[baseuri]['http://www.w3.org/1999/02/22-rdf-syntax-ns#type'][0]}" prefix="schema: http://schema.org/ rdf: http://www.w3.org/1999/02/22-rdf-syntax-ns# dcterms: http://purl.org/dc/terms/" typeof="${it[baseuri]['http://www.w3.org/1999/02/22-rdf-syntax-ns#type'][0]}" about="${baseuri}">
					<div class="metadata">
						<ul>
							<li class="title" property="schema:title" itemprop="name">${it[baseuri]['http://schema.org/title'][0]}</li>
							<li class="author" property="schema:creator"  itemprop="creator" itemscope itemtype="http://schema.org/Person">${it[baseuri]['http://schema.org/creator'][0]}</li>
							<li class="date" property="schema:dateCreated" itemProp="dateCreated">${it[baseuri]['http://schema.org/dateCreated'][0]}</li>
							<li class="identifier" property="dcterms:identifier">${it['identifier']['identifier'][0]}</li>
							<li class="subjects">
							</li>
						</ul>
					</div>
				</div>
				<div class="resources">

					<ul>
						<c:forEach items="${it[baseuri]['http://schema.org/about']}" var="entry">
    						<li itemscope itemtype="${it[entry]['http://www.w3.org/1999/02/22-rdf-syntax-ns#type'][0]}" prefix="schema: http://schema.org/ rdf: http://www.w3.org/1999/02/22-rdf-syntax-ns# dcterms: http://purl.org/dc/terms/" typeof="${it[entry]['http://www.w3.org/1999/02/22-rdf-syntax-ns#type'][0]}" about="${entry}"><span itemprop="name" >${it[entry]["http://schema.org/name"][0]}</span><span itemprop="geo" itemscope itemtype="http://schema.org/GeoCoordinates"><meta itemprop="latitude" property="schema:latitude" content="${it[entry]["http://schema.org/latitude"][0]}"/><meta itemprop="longitude" property="schema:longitude" content="${it[entry]["http://schema.org/longitude"][0]}"/></span></li>
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