<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cms:formatter var="content">
	<c:set var="hashTag" value="${content.value.HashTag}" />
	<c:set var="SocialList" value="${content.valueList.SocialList}"/>
	<footer id="${hashTag}">
		<div class="container">
			<div class="social text-center">
				<c:forEach var="item" items="${SocialList}">
					<c:choose>
						<c:when test="${item.value.SocialNetwork.stringValue eq 'git'}">
							<a href="${item.value.Link}" target="_blank"><i class="fa fa-github"></i></a>
						</c:when>
						<c:when test="${item.value.SocialNetwork.stringValue eq 'fb'}">
							<a href="${item.value.Link}" target="_blank" class="fa fa-facebook"></a>
						</c:when>
						<c:when test="${item.value.SocialNetwork.stringValue eq 'tw'}">
							<a href="${item.value.Link}" target="_blank"><i class="fa fa-twitter"></i></a>
						</c:when>
						<c:when test="${item.value.SocialNetwork.stringValue eq 'gg'}">
							<a href="${item.value.Link}" target="_blank"><i class="fa fa-google"></i></a>
						</c:when>
						<c:when test="${item.value.SocialNetwork.stringValue eq 'yt'}">
							<a href="${item.value.Link}" target="_blank"><i class="fa fa-youtube"></i></a>
						</c:when>
						<c:when test="${item.value.SocialNetwork.stringValue eq 'ins'}">
							<a href="${item.value.Link}" target="_blank"><i class="fa fa-instagram"></i></a>
						</c:when>
						<c:when test="${item.value.SocialNetwork.stringValue eq 'sky'}">
							<a href="${item.value.Link}" target="_blank"><i class="fa fa-skype"></i></a>
						</c:when>
						<c:when test="${item.value.SocialNetwork.stringValue eq 'ya'}">
							<a href="${item.value.Link}" target="_blank"><i class="fa fa-yahoo"></i></a>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
			<div class="clear"></div>
			<!--CLEAR FLOATS-->
		</div>
	</footer>
	<!--/.page-section-->
	<section class="copyright">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 text-center">
					Copyright 2018 | All Rights Reserved  -- Template by <a href="https://webthemez.com/" target="_blank">Thanks to WebThemez.com
					</a> Develop by <a href="https://facebook.com/pinestran.it" target="_blank">Pines Tran </a>
				</div>
			</div>
			<!-- / .row -->
		</div>
	</section>
	<c:if test="${not cms.element.inMemoryOnly and cms.edited}">
		${cms.reloadMarker}
	</c:if>
</cms:formatter>