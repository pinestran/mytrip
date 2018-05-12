<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cms:formatter var="content">
	<c:set var="hashTag" value="${content.value.HashTag}" />
	<c:set var="Title" value="${content.value.Title}"/>
	<c:set var="ShortDes" value="${content.value.ShortDes}"/>
	<c:set var="Image" value="${content.value.Image}"/>
	<c:set var="LongDes" value="${content.value.LongDes}"/>
	<c:set var="MemberInfo" value="${content.valueList.MemberInfo}"/>

	<section id="aboutUs" class="secPad">
	<span id="${hashTag}"></span>
		<div class="container">
			<div class="heading text-center">
				<!-- Heading -->
				<h2>${Title}</h2>
				<p>${ShortDes}</p>
			</div>
			<div class="row">
				<div class="col-md-4">
					<c:if test="${Image.stringValue eq ''}">
						<c:set var="Image" value="/system/modules/com.myjourney/resources/images/banner-bg3.jpg"/>
					</c:if>
					<img src="${Image}" alt="" class="img-responsive img-thumbnail">
				</div>
				<div class="col-md-8">
					<c:if test="${LongDes.stringValue eq ''}">
						<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. </p>
						<blockquote class="blockquote-1">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante. Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid</p>
							<small>Someone famous in <cite title="Source Title">Source Title</cite></small>
						</blockquote>
					</c:if>
					${LongDes}
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="carousel slide" data-ride="carousel" id="quote-carousel">
						<!-- Bottom Carousel Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#quote-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#quote-carousel" data-slide-to="1" class=""></li>
							<li data-target="#quote-carousel" data-slide-to="2" class=""></li>
						</ol>

						<!-- Carousel Slides / Quotes -->
						<div class="carousel-inner">
							<!-- Quote 1 -->
							<c:set var="active" value="active"/>
							<fmt:parseNumber var="count" value="0" />
							<c:forEach var="item" items="${MemberInfo}">
								<c:if test="${count > 0}">
									<c:set var="active" value=""/>
								</c:if>
								<div class="item ${active}">
								<fmt:parseNumber var="count" value="${count + 1}" />
									<blockquote>
										<div class="row">
											<div class="col-sm-3 text-center">
												<c:set var="ImageChild" value="${item.value.Image}"/>
												<c:if test="${ImageChild.stringValue eq ''}">
													<c:set var="ImageChild" value="/system/modules/com.myjourney/resources/images/banner-bg2.jpg"/>
												</c:if>
												<img class="img-circle" src="${ImageChild}" style="width: 100px; height: 100px;">
											</div>
											<div class="col-sm-9">
												<c:if test="${item.value.Description.stringValue eq ''}">
													<p>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit!</p>
													<small>Someone famous</small>
												</c:if>
												${item.value.Description}
											</div>
										</div>
									</blockquote>
								</div>
							</c:forEach>
						</div>

						<!-- Carousel Buttons Next/Prev -->
						<a data-slide="prev" href="#quote-carousel" class="left carousel-control"><i class="fa fa-chevron-left"></i></a>
						<a data-slide="next" href="#quote-carousel" class="right carousel-control"><i class="fa fa-chevron-right"></i></a>
					</div>
				</div>
			</div>
		</div>   
	</section>
	<c:if test="${not cms.element.inMemoryOnly and cms.edited}">
		${cms.reloadMarker}
	</c:if>
</cms:formatter>