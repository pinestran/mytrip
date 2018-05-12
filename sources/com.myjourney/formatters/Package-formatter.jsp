<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cms:formatter var="content">

	<c:set var="title" value="${content.value.Title}"/>
	<c:set var="description" value="${content.value.Description}"/>
	<c:set var="lstItems" value="${content.valueList.Destinations}"/>
	<c:set var="hashTag" value="${content.value.HashTag}" />
	<fmt:parseNumber var="count" value="0" type="number" />
	<section id="packages" class="secPad">
	<span id="${hashTag}"></span>
		<div class="container">
			<div class="heading text-center">
				<!-- Heading -->
				<h2>${title}</h2>
				<p>${description}</p>
			</div>

			<c:forEach var="item" items="${lstItems}">
				<c:if test="${count == 0}">
					<div class="row">
						</c:if>
					<c:set var="image" value="${item.value.Image}" />
					<c:if test="${image.stringValue eq ''}">
						<c:set var="image" value="/system/modules/com.myjourney/resources/images/pic/pic-1.jpg" />
					</c:if>
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="cuadro_intro_hover " style="background-color:#cccccc;">
							<p style="text-align:center;">
								<img src="${image}" class="img-responsive" alt="">
							</p>
							<div class="caption">
								<div class="blur"></div>
								<div class="caption-text">
									<h3>${item.value.PlaceName}</h3>
									<p>${item.value.ShortDescription}</p>
									<a class=" btn btn-default" href="${item.value.Link}">${item.value.CheckOutLabel}</a>
								</div>
							</div>
						</div>
					</div>
					<fmt:parseNumber var="count" value = "${count + 1}" />
					<c:if test="${count == 4}">
						<fmt:parseNumber var="count" value = "0" />
						</div>
				</c:if>
			</c:forEach>
		</div>
	</section>
	<c:if test="${not cms.element.inMemoryOnly and cms.edited}">
		${cms.reloadMarker}
	</c:if>
</cms:formatter>