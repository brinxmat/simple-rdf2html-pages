<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang = "en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta content="True" name="HandheldFriendly">
		<meta name="viewport" content="width=device-width">
		<link rel="stylesheet" href="http://folk.ntnu.no/greenall/simple-rdf2html-pages/css/main.css" type="text/css" media="only screen and (min-width:481px)">
		
		<link rel="stylesheet" href="http://folk.ntnu.no/greenall/simple-rdf2html-pages/css/small.css" type="text/css" media="only screen and (max-width: 480px), only screen and (max-device-width: 480px), only screen and (max-height: 480px), only screen and (max-device-height: 480px)">
		
		<title>${it['http://schema.org/title']}</title>

	</head>
	<body>
		<header>
			<div class="header">
				<div class="title">
					<h1>
						GSS:${it['http://schema.org/title']}
					</h1>
				</div>
				<div class="search">
					<form name="search" action="../search" method="GET">
						<fieldset class="searchbox">
							<input name="query" class="autocomplete search">
							<input type="submit" class="searchGo" value="søk">
						</fieldset>
					</form>
				</div>
			</div>
		</header>
		<div class="content">
								<script type="text/javascript" src="http://ubit.fillager.bibsys.no/fsi/js/fsiwriter.js"></script>
			<script type="text/javascript">
			<!--
			writeFlashCode( "http://ubit.fillager.bibsys.no/fsi/viewer/fsi.swf?cfg=pages_presets%2Fhard_cover_book&pages_dir=Publisering%2F${it.identifier}&skin=black&language=english&effects=sharpen%3D30%2526quality%3D80&viewerborder=0A0000&pages_bendeffect=Matte&roundedskincorners=30&plugins=resize,fullscreen",
			"http://ubit.fillager.bibsys.no/fsi/server?type=image&source=Publisering%2F${it.identifier}%2F001.jpg&width=468&height=814",
			"width=100%;height=100%;bgcolor=0A0000;mobilesupport=true");
			// -->
			</script>
			<noscript>
			<object data="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,65,0" type="x-application/shockwave-flash">
			<param name="movie" value="http://ubit.fillager.bibsys.no/fsi/viewer/fsi.swf?cfg=pages_presets%2Fhard_cover_book&amp;pages_dir=Publisering%2F${it.identifier}&amp;skin=black&amp;language=english&amp;effects=sharpen%3D30%2526quality%3D80&amp;viewerborder=0A0000&amp;pages_bendeffect=Matte&amp;roundedskincorners=30&amp;plugins=resize,fullscreen">
			<param name="bgcolor" value="0A0000" />
			<param name="mobilesupport" value="true" />
			<param name="allowscriptaccess" value="always" />
			<param name="allowfullscreen" value="true" />
			<param name="quality" value="high" />
			<embed src="http://ubit.fillager.bibsys.no/fsi/viewer/fsi.swf?cfg=pages_presets%2Fhard_cover_book&amp;pages_dir=Publisering%2F${it.identifier}&amp;skin=black&amp;language=english&amp;effects=sharpen%3D30%2526quality%3D80&amp;viewerborder=0A0000&amp;pages_bendeffect=Matte&amp;roundedskincorners=30&amp;plugins=resize,fullscreen"
			mobilesupport="true"
			allowscriptaccess="always"
			allowfullscreen="true"
			quality="high"
			type="application/x-shockwave-flash"
			pluginspage="http://www.adobe.com/go/getflashplayer" />
			</object>
			</noscript>
	
		</div>
		<div class="sidebar">
			<div class="resource-data" itemscope itemtype="${it['http://www.w3.org/1999/02/22-rdf-syntax-ns#type']}" prefix="schema: http://schema.org/ rdf: http://www.w3.org/1999/02/22-rdf-syntax-ns# dcterms: http://purl.org/dc/terms/" about="<%=request.getAttribute("javax.servlet.forward.request_uri")%>">
				<div class="metadata">
					<ul>
					<li class="title" property="schema:title" itemprop="name">${it['http://schema.org/title']}</li>
					<li class="author" property="schema:creator"  itemprop="creator" itemscope itemtype="http://schema.org/Person">${it['http://schema.org/creator']}</li>
					<li class="date" property="schema:dateCreated" itemProp="dateCreated">${it['http://schema.org/dateCreated']}</li>
					<li class="identifier" property="dcterms:identifier">${it.identifier}</li>
					<li class="subjects">
						<c:forEach items="${it['http://schema.org/about']}" var="s">
    						<span class="subject" property="schema:about" itemprop="about"><a href="../search?query=${s.value}">${s.value}</a> </span>
						</c:forEach>
					</li>
					</ul>
				</div>
			</div>
			<div class="resources">
				<ul>
					<li>Related data 1</li>
					<li>Related data 2</li>
					<li>Related data 3</li>
				</ul>
			</div>
			</div>
		<footer>
			<div class="footer">
				<div class="editor">Gunnerus library</div>
			</div>
		</footer>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>

		<script type="text/javascript">
		</script>
	</body>
</html>