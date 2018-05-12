<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cms:formatter var="content">
<c:set var="hashTag" value="${content.value.HashTag}" />
<c:set var="Title" value="${content.value.Title}" />
<c:set var="TextDes" value="${content.value.TextDes}" />
<c:set var="Image" value="${content.valueList.Image}" />
	<section id="portfolio" class="page-section section appear clearfix secPad">
	<span id="${hashTag}"></span>
        <div class="container">

            <div class="heading text-center">
                <!-- Heading -->
                <h2>${Title}</h2>
                <p>${TextDes}</p>
            </div>

            <div class="row">            
                <div class="col-md-12">
                    <div class="row">
                        <div class="portfolio-items isotopeWrapper clearfix" id="3">
							<c:forEach var="item" items="${Image}">
                            <article class="col-sm-4 isotopeItem webdesign">
                                <div class="portfolio-item">
                                    <img src="${item}" alt="" />
                                    <div class="portfolio-desc align-center">
                                        <div class="folio-Get It!">
                                            <a href="${item}" class="fancybox">                                                
                                                <i class="fa fa-arrows-alt fa-2x"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </article>
							</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<c:if test="${not cms.element.inMemoryOnly and cms.edited}">
		${cms.reloadMarker}
	</c:if>
</cms:formatter>