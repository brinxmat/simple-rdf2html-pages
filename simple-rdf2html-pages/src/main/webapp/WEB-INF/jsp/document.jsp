<!DOCTYPE html><%@ page pageEncoding="UTF-8" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %><fmt:setLocale value="en" scope="session"/><fmt:setBundle basename="Messages" var="lingua" /><fmt:message key="initialSearchText" bundle="${lingua}" var="initialSearchText" /><fmt:message key="searchButtonText" bundle="${lingua}" var="searchButtonText" /><fmt:message key="webeditor" bundle="${lingua}" var="webeditor" /><fmt:message key="about" bundle="${lingua}" var="about" /><fmt:message key="rightsnotice" bundle="${lingua}" var="rightsnotice" /><fmt:message key="contact" bundle="${lingua}" var="contact" />
<c:set var="uri" value="${it.baseuri.baseuri[0]}"/>
<c:set var="baseuri" value=""/>
<%
pageContext.setAttribute("baseuri",pageContext.findAttribute("uri").toString() + request.getAttribute("javax.servlet.forward.servlet_path").toString());
%>
<c:set var="twitterTitle" value="${fn:substring(it[baseuri]['http://schema.org/title'][0],0,65)}…"/>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="chrome-1">
		<meta content="True" name="HandheldFriendly">
		<meta name="viewport" content="width=device-width">
		<link href="http://fonts.googleapis.com/css?family=Share+Tech" rel="stylesheet" type="text/css">
	 	<link href="http://folk.ntnu.no/greenall/simple-rdf2html-pages/css/reset.css" rel="stylesheet" type="text/css">
		<link href="http://folk.ntnu.no/greenall/simple-rdf2html-pages/css/responsive.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="http://folk.ntnu.no/greenall/simple-rdf2html-pages/css/small.css" type="text/css" media="only screen and (max-width: 480px), only screen and (max-device-width: 480px), only screen and (max-height: 480px), only screen and (max-device-height: 480px)">
		<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/ui-darkness/jquery-ui.min.css" rel="stylesheet" type="text/css">
		<title>${it[baseuri]['http://schema.org/title'][0]}</title>
		<script src="//ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js"></script>
		<script type="text/javascript" src="http://ubit.fillager.bibsys.no/fsi/js/fsiwriter.js"></script>
	</head>
	<body>
		<%@include file="include/header.jsp" %>
		<div class="view">
			<div class="documentViewer">
				<script type="text/javascript">
					<!--
					writeFlashCode("${it[baseuri]['http://schema.org/associatedMedia'][0]}");
					// -->
				</script>
				<noscript>
					<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,65,0" width="100%" height="100%">
						<param name="movie" value="${it[baseuri]['http://schema.org/associatedMedia'][0]}">
						<param name="wmode" value="transparent" />
						<param name="allowscriptaccess" value="always" />
						<param name="allowfullscreen" value="true" />
						<param name="quality" value="high" />
						<embed src="${it[baseuri]['http://schema.org/associatedMedia'][0]}"
							width="100%"
							height="100%"
							wmode="transparent"
							allowscriptaccess="always"
							allowfullscreen="true"
							quality="high"
							type="application/x-shockwave-flash"
							pluginspage="http://www.adobe.com/go/getflashplayer">
						</embed>
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
							<li class="subjects">
							</li>
						</ul>
					</div>
				</div>
				<div class="resources">

					<ul>
						<c:forEach items="${it[baseuri]['http://schema.org/about']}" var="entry">
    						<li itemscope itemtype="${it[entry]['http://www.w3.org/1999/02/22-rdf-syntax-ns#type'][0]}" prefix="schema: http://schema.org/ rdf: http://www.w3.org/1999/02/22-rdf-syntax-ns# dcterms: http://purl.org/dc/terms/" typeof="${it[entry]['http://www.w3.org/1999/02/22-rdf-syntax-ns#type'][0]}" about="${entry}"><span itemprop="name" ><a href="${searchuri}?query=${it[entry]["http://schema.org/name"][0]}">${it[entry]["http://schema.org/name"][0]}</a></span><span itemprop="geo" itemscope itemtype="http://schema.org/GeoCoordinates"><meta itemprop="latitude" property="schema:latitude" content="${it[entry]["http://schema.org/latitude"][0]}"/><meta itemprop="longitude" property="schema:longitude" content="${it[entry]["http://schema.org/longitude"][0]}"/></span></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="twitter">
				<a href="https://twitter.com/share" class="twitter-share-button" data-text="${it[baseuri]['http://schema.org/creator'][0]} ${it[baseuri]['http://schema.org/dateCreated'][0]} ${twitterTitle} ${it[baseuri][0]}" data-lang="no" data-dnt="true">Tweet</a>
			</div>
			<div id="disqus_thread"></div>
		</div>
		<%@include file="include/footer.jsp" %>
		<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
		<script type="text/javascript" src="http://folk.ntnu.no/greenall/simple-rdf2html-pages/js/document.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
		<script type="text/javascript" src="http://folk.ntnu.no/greenall/simple-rdf2html-pages/js/autocomplete.js"></script>
		<script type="text/javascript">
    		var disqus_shortname = 'gunnerusspecialcollections';
    		(function() {
        		var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        		dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
        		(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    		})();
		</script>
	</body>
</html>