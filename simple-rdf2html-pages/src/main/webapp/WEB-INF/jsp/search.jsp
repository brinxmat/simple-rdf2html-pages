<!DOCTYPE html><%@ page pageEncoding="UTF-8" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %><fmt:setLocale value="en" scope="session"/><fmt:setBundle basename="Messages" var="lingua" /><fmt:message key="initialSearchText" bundle="${lingua}" var="initialSearchText" /><fmt:message key="searchButtonText" bundle="${lingua}" var="searchButtonText" /><fmt:message key="webeditor" bundle="${lingua}" var="webeditor" /><fmt:message key="about" bundle="${lingua}" var="about" /><fmt:message key="rightsnotice" bundle="${lingua}" var="rightsnotice" /><fmt:message key="contact" bundle="${lingua}" var="contact" />
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

		<title><fmt:message key="title" bundle="${lingua}" /></title>
	</head>
	<body>
		<%@include file="include/header.jsp" %>
		<div class="search-results">
		  <h2>Total hits: ${it.hits.total}</h2>
		  <ul>
		  	<c:forEach items="${it.hits.hits}" var="s">
		  	 	<c:set var="identifier" value="${s._source.identifier.identifier[0]}"/>
		  	
    	    	<li class="hit">
    	    	  <a href="${identifier}">
    	    	  <div>
    	    	    <div class="title">${s["_source"][identifier]["http://schema.org/title"][0]}</div><br>
    	    	    <div class="author">${s["_source"][identifier]["http://schema.org/creator"][0]}</div>
    	    	    <div class="date">${s["_source"][identifier]["http://schema.org/dateCreated"][0]}</div>    	    	    
    	    	  </div>
    	    	  </a>
    	    	</li>
		  	</c:forEach>
		  </ul>					
		</div>
		<div class="search-nav">
		  <c:forEach begin="0" end="${it.hits.total/it.size}" varStatus="i">
		    <c:choose>
		      <c:when test="${ i.index * it.size != it.from}">
		        <span><a class="searchpagelinks" href="search?query=${it.query}&from=${it.size * i.index}&size=${it.size}">${i.index+1}</a></span>
		      </c:when>
		      <c:otherwise>
		        <span>${i.index+1}</span>
		      </c:otherwise>
		    </c:choose>
		  </c:forEach>
		</div>
		<%@include file="include/footer.jsp" %>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
		<script type="text/javascript" src="http://folk.ntnu.no/greenall/simple-rdf2html-pages/js/autocomplete.js"></script>
	</body>
</html>