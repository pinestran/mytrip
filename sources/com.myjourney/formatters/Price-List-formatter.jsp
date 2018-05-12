<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cms:formatter var="content">

	<c:set var="title" value="${content.value.Title}"/>
	<c:set var="description" value="${content.value.TextDescription}"/>
	<c:set var="listPrice" value="${content.valueList.ListPrice}"/>
	<c:set var="hashTag" value="${content.value.HashTag}" />
	<section id="priceTable" class="secPad white">
	<span id="${hashTag}"></span>
		<div class="container">
			<div class="heading text-center">
				<!-- Heading -->
				<h2>${title}</h2>
				<p>${description}</p>
			</div>
			<div class="row"> 
			<c:forEach var="item" items="${listPrice}">
				<c:set var="titlePackage" value="${item.value.TitlePackage}" />
				<c:set var="Price" value="${item.value.Price}" />
				<c:set var="ButtonSigupLabel" value="${item.value.ButtonSigupLabel}" />
				<c:set var="DetailContent" value="${item.valueList.DetailContent}" />
				<c:set var="Active" value="${item.value.Active}" />
				<c:set var="classActive1" value="panel-default" />
				<c:set var="classActive2" value="btn-default" />
				<c:set var="priceOdd" value="${fn:split(Price, '.')}"/>
				<c:if test="${Active eq 'true'}">
					<c:set var="classActive1" value="panel-danger" />
					<c:set var="classActive2" value="btn-primary" />
				</c:if>
				<div class="col-sm-3">
					<div class="panel ${classActive1} text-center">
						<div class="panel-heading">
							<h3>${titlePackage}</h3>
						</div>
						<div class="panel-body">
							<h3 class="panel-title price">${priceOdd[0]} <span class="price-cents">${priceOdd[1]}</span><span class="price-month">mo.</span></h3>
						</div>
						<ul class="list-group">
							<c:forEach var="child" items="${DetailContent}">
								<li class="list-group-item">${child.value.valueIndex}</li>
							</c:forEach>
							<li class="list-group-item"><a class="btn ${classActive2}">${ButtonSigupLabel}</a></li>
						</ul>
					</div>          
				</div>
			</c:forEach>
			</div>
		</div>      
	</section>
	<c:if test="${not cms.element.inMemoryOnly and cms.edited}">
		${cms.reloadMarker}
	</c:if>
</cms:formatter>