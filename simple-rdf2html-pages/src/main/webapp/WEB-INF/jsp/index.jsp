<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang = "${it}[0]">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="chrome-1">
		<title></title>
		<link rel="stylesheet" href="css/grid.css" type="text/css" media="screen" charset="utf-8">
		<link rel="stylesheet" href="http://folk.ntnu.no/greenall/gunnweb/css/main.css" type="text/css" media="screen" charset="utf-8">
		<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/humanity/jquery-ui.css" type="text/css" media="screen" charset="utf-8">
	</head>
	<body>
		<div class="container clearfix">
			<img src="images/bb.png" alt="" class="border prayerbook">
			<div class="grid_12">
				<div class="grid_12 header">
					<header>
						<h1></h1>
					<header>
					<nav><span class="grid_2 about"></span><span class="grid_2 licensing"></span><span class="grid_2 empty">&nbsp;</span><span class="grid_2 flag"><img src="" title="" alt=""/></span></nav>
				</div>
				<img src="images/impigh_small.png" class="decor-top" alt="">
				<div class="grid_8 search">
					<div class="content">
						<form name="search" action="search" method="GET">
							<input id="autocomplete" class="autocomplete searchbox" name="query" value="…"><input type="submit" class="submit searchbox" value="">
						</form>
					</div>
				</div>
				<section>
					<div class="grid_8 contentbox">
					
				    </div>
				</section>
				<div class="grid_4 rightcolumn">
				</div>
			</div>
		</div>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"></script>
		<script src="http://folk.ntnu.no/greenall/gunnweb/js/main.js"></script>
	</body>
</html>