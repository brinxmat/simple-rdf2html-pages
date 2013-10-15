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
		
		<title>Search</title>

	</head>
	<body>
		<header>
			<div class="header">
				<div class="title">
					<h1>
						GSS
					</h1>
				</div>
				<div class="search">
					<form name="search" action="search" method="GET">
						<fieldset class="searchbox">
							<input name="query" class="autocomplete search" value="${it.query}">
							<input type="submit" class="searchGo" value="søk">
						</fieldset>
					</form>
				</div>
			</div>
		</header>
		<div class="search-results">
		  <h2>Total hits: ${it.hits.total}</h2>
		  <ul>
		  	<c:forEach items="${it.hits.hits}" var="s">
    	    	<li class="hit">
    	    	  <a href="document/${s._id}">
    	    	  <div>
    	    	    <span class="title">${s["_source"]["http://schema.org/title"]}</span><br>
    	    	    <span class="author">${s["_source"]["http://schema.org/creator"]}</span>
    	    	    <span class="date">${s["_source"]["http://schema.org/dateCreated"]}</span>    	    	    
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