<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cms:formatter var="content">

<c:set var="message" value="${content.valueList.Description}"/>
<c:set var="bannerImage" value="${content.value.BannerImage}"/>
<c:set var="introText" value="${content.value.IntroText}" />
<c:set var="hashTag" value="${content.value.HashTag}" />
<c:if test="${bannerImage.stringValue eq ''}">
	<c:set var="bannerImage" value="/system/modules/com.myjourney/resources/images/banner-bg.jpg"/>
</c:if>
    <section id="home">
		<span id="${hashTag}"></span>
        <div class="banner-container" style="background: url('${bannerImage}') no-repeat;">
         <!--   <img src="images/banner-bg.jpg" alt="banner" />-->
            <div class="container banner-content">
                <div id="da-slider" class="da-slider">
					<c:forEach var="item" items="${message}">
						<div class="da-slide">
							<h2>${item.value.Title}</h2>
							<p>${item.value.TextDescription}</p>
							<a href="${item.value.Link}" class="da-link">${item.value.ReadMoreLabel}</a>
							<div class="da-img"></div>
						</div>
					</c:forEach>             
                </div>
            </div>
        </div>
    </section>
    <section id="introText">
        <div class="container">
			<div class="text-center">
				<c:choose >
					<c:when test="${introText ne ''}">
						${introText}
					</c:when>
					<c:otherwise>
						<h1>My Trip Gives You a Great Holiday Package</h1>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse interdum erat et neque tincidunt volutpat. Cras eget augue id dui varius pretium. Cras posuere dolor risus. Pellentesque elementum ultricies quam, sit amet rhoncus nisl viverra in. Cras imperdiet nisi a euismod molestie. Ut a metus arcu. Pellentesque feugiat dictum erat. Nulla vehicula condimentum purus, quis imperdiet nisl ultricies eleifend. Nulla quis rhoncus risus. Ut vel vehicula urna.</p>
					</c:otherwise>
				</c:choose>
			</div>
        </div>

    </section>
	<c:if test="not cms.element.inMemoryOnly and cms.edited">
		${cms.reloadMarker}
	</c:if>
</cms:formatter>