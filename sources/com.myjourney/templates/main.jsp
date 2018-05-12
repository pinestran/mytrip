<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:setLocale value="${cms.locale}" />
<!doctype html>
<html lang="${cms.locale}" class="no-js">
	<!--<![endif]-->
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<!--[if lt IE 9]> 
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<![endif]-->
		<title><cms:info property="opencms.title" /></title>
		<meta name="description" content="Toure package">
		<meta name="author" content="Thank WebThemez">
		<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
		<!--[if lte IE 8]>
<script type="text/javascript" src="http://explorercanvas.googlecode.com/svn/trunk/excanvas.js"></script>
<![endif]-->
		<link rel="icon" href="<cms:link>/system/modules/com.myjourney/resources/images/favicon.png</cms:link>" />
		<link rel="stylesheet" href="<cms:link>/system/modules/com.myjourney/resources/css/bootstrap.min.css</cms:link>" />
		<link rel="stylesheet" type="text/css" href="<cms:link>/system/modules/com.myjourney/resources/css/isotope.css</cms:link>" media="screen" />
		<link rel="stylesheet" href="<cms:link>/system/modules/com.myjourney/resources/js/fancybox/jquery.fancybox.css</cms:link>" type="text/css" media="screen" />
		<link rel="stylesheet" type="text/css" href="<cms:link>/system/modules/com.myjourney/resources/css/da-slider.css</cms:link>" />
		<!-- Owl Carousel Assets -->
		<link href="<cms:link>/system/modules/com.myjourney/resources/js/owl-carousel/owl.carousel.css</cms:link>" rel="stylesheet">
		<link rel="stylesheet" href="<cms:link>/system/modules/com.myjourney/resources/css/styles.css</cms:link>" />
		<!-- Font Awesome -->
		<link href="<cms:link>/system/modules/com.myjourney/resources/css/font-awesome.min.css</cms:link>" rel="stylesheet">
		<cms:enable-ade/>


	</head>

	<body>
		<c:if test="${cms.isEditMode}">
			<!-- this place to show editor mode -->
			<div id="toolbar-placeholder" style="height: 55px"></div>
		</c:if>
		<div id="#top"></div>
		<cms:container name="navbar">
			<h3> Drap and drop any content types here.</h3>
		</cms:container>
		<a href="#top" class="topHome"><i class="fa fa-chevron-up fa-2x"></i></a>

		<!--[if lte IE 8]><script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script><![endif]-->
		<script src="<cms:link>/system/modules/com.myjourney/resources/js/modernizr-latest.js</cms:link>"></script>
		<script src="http://code.jquery.com/jquery-1.8.2.min.js" type="text/javascript"></script>
		<script src="<cms:link>/system/modules/com.myjourney/resources/js/bootstrap.min.js</cms:link>" type="text/javascript"></script>
		<script src="<cms:link>/system/modules/com.myjourney/resources/js/jquery.isotope.min.js</cms:link>" type="text/javascript"></script>
		<script src="<cms:link>/system/modules/com.myjourney/resources/js/fancybox/jquery.fancybox.pack.js</cms:link>" type="text/javascript"></script>
		<script src="<cms:link>/system/modules/com.myjourney/resources/js/jquery.nav.js</cms:link>" type="text/javascript"></script>
		<script src="<cms:link>/system/modules/com.myjourney/resources/js/jquery.cslider.js</cms:link>" type="text/javascript"></script>
		<script src="<cms:link>/system/modules/com.myjourney/resources/js/custom.js</cms:link>" type="text/javascript"></script>
		<script src="<cms:link>/system/modules/com.myjourney/resources/js/owl-carousel/owl.carousel.js</cms:link>"></script>
	</body>
</html>
