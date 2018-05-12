<%@page import="com.thongtv.service.Impl.HomeServiceImpl"%>
<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cms:formatter var="content">
<%
	HomeServiceImpl home = new HomeServiceImpl(pageContext, request, response);
	if(home.saveInfoUserContact()){
		System.out.println("Insert success.");
	}
	else{
		System.out.println("Insert fail.");
	}
%>
	<c:set var="hashTag" value="${content.value.HashTag}" />
	<c:set var="Title" value="${content.value.Title}" />
	<c:set var="ShortDes" value="${content.value.ShortDes}"/>
	<c:set var="DetailInfo" value="${content.value.DetailInfo}" />
	<c:set var="Image" value="${content.value.Image}" />
	<c:set var="FirstNameLabel" value="${content.value.FirstNameLabel}" />
	<c:set var="LastNameLabel" value="${content.value.LastNameLabel}" />
	<c:set var="EmailLabel" value="${content.value.EmailLabel}" />
	<c:set var="CommentsLabel" value="${content.value.CommentsLabel}" />
	<c:set var="SubmitLabel" value="${content.value.SubmitLabel}" />

	<section id="contactUs" class="page-section secPad">
	<span id="${hashTag}"></span>
		<div class="container">

			<div class="row">
				<div class="heading text-center">
					<!-- Heading -->
					<h2>${Title}</h2>
					<p>${ShortDes}</p>
				</div>
			</div>

			<div class="row mrgn30">

				<form method="post" action="" id="contactfrm" role="form">

					<div class="col-sm-4">
						<div class="form-group">
							<label for="name">${FirstNameLabel}</label>
							<input type="text" class="form-control" name="firstname" id="name" placeholder="Enter first name" title="Please enter your name (at least 2 characters)">
						</div>
						<div class="form-group">
							<label for="name">${LastNameLabel}</label>
							<input type="text" class="form-control" name="lastname" id="name" placeholder="Enter last name" title="Please enter your name (at least 2 characters)">
						</div>
						<div class="form-group">
							<label for="email">${EmailLabel}</label>
							<input type="email" class="form-control" name="email" id="email" placeholder="Enter email" title="Please enter a valid email address">
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<label for="comments">${CommentsLabel}</label>
							<textarea name="comment" class="form-control" id="comments" cols="3" rows="5" placeholder="Enter your message…" title="Please enter your message (at least 10 characters)"></textarea>
						</div>
						<button name="submit" type="submit" class="btn btn-lg btn-primary" id="submit">${SubmitLabel}</button>
						<div class="result"></div>
					</div>
				</form>
				<div class="col-sm-4">
					<c:if test="${DetailInfo.stringValue eq ''}">
						<h4>Address:</h4>
						<address>
							WebThemez Company<br>
							134 Stilla. Tae., 414515<br>
							Leorislon, SA 02434-34534 USA
							<br>
						</address>
						<h4>Phone:</h4>
						<address>
							12345-49589-2<br>
						</address>
					</c:if>
					${DetailInfo}
				</div>
			</div>
		</div>
		<!--/.container-->
	</section>
	<c:if test="${not cms.element.inMemoryOnly and cms.edited}">
		${cms.reloadMarker}
	</c:if>
</cms:formatter>