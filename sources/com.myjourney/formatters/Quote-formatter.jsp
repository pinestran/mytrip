<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cms:formatter var="content">

<c:set var="text" value="${content.value.Text}" />
<c:set var="image" value="${content.value.Image}" />
<c:set var="hashTag" value="${content.value.HashTag}" />
<c:if test="${image.stringValue eq ''}">
	<c:set var="image" value="/system/modules/com.myjourney/resources/images/banner-bg2.jpg" />
</c:if>

	<section id="quote" class="bg-parlex" style="background-image: url('${image}');">
	<span id="${hashTag}"></span>
		<div class="parlex-back">
			<div class="container secPad text-center">
				<c:if test="${text.stringValue eq ''}">
				<h2>"The World is a book, and those who do not travel read only a page."
				</h2><h3>-Saint Augustine</h3>
				</c:if>
				${text}
			</div>
			<!--/.container-->
		</div>
	</section>
	<c:if test="${not cms.element.inMemoryOnly and cms.edited}">
		${cms.reloadMarker}
	</c:if>
</cms:formatter>