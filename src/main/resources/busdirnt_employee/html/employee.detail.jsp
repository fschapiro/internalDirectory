<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>

<template:addResources type="css" resources="businessDirectory.css"/>
<template:addResources type="css" resources="bootstrap.min.css"/>

<c:set var="location" value="${currentNode.properties['location'].node}"/>
<template:addCacheDependency node="${location}"/>
<div class="col-md-3"></div>
<div class="col-md-6">
	<div class="profile-card">
		<c:if test="${(renderContext.loggedIn) and (currentNode.properties['jcr:title'].string eq
		renderContext.user.username)}">
		<a class="but-edit" href="${url.base}${currentNode.path}.employee-update.html"><fmt:message
				key="busdir.label.update"/></a>
		</c:if>

		<div class="card-header-info">
			<c:set var="photo" value="${currentNode.properties['image'].node}"/>
			<c:if test="${not empty photo}">
				<img class="card-picture" src="${photo.url}?t=thumbnail"/>
			</c:if>
			<h2 class="card-title">${currentNode.properties['j:firstName'].string}&nbsp;${currentNode.properties['j:lastName'].string}</h2>
			<c:set var="role" value="${currentNode.properties['role'].string}"/>
			<c:if test="${not empty role}">
				<div class="card-role">${role}</div>
			</c:if>
			<div class="card-location"><a href="${url.base}${location.path}html"><template:module
					node="${location}" view="small"/></a></div>
			<c:set var="employeeSince" value="${currentNode.properties['employeeSince'].time}"/>
			<div class="card-date"><fmt:message key="busdir.label.employeeSince"/>&nbsp;
				<c:choose>
					<c:when test="${not empty employeeSince}">
						<fmt:formatDate
								value="${employeeSince}" pattern="dd/MM/yyyy" />
					</c:when>
					<c:otherwise>
						<fmt:message key="busdir.label.NA"/>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
		<div class="card-body-info">
			<div class="card-info-split">
				<c:set var="fixnumber" value="${currentNode.properties['fixPhoneNumber'].string}"/>
				<c:if test="${not empty fixnumber}">
					<div class="field">
						<img src="<c:url value="${url.currentModule}/img/ic_phone.png" />"/>

						<div class="card-field">${fixnumber}</div>
					</div>
				</c:if>
				<c:set var="mobile" value="${currentNode.properties['mobilePhoneNumber'].string}"/>
				<c:if test="${not empty mobile}">
					<div class="field">
						<img src="<c:url value="${url.currentModule}/img/ic_mobile.png" />"/>

						<div class="card-field">${mobile}</div>
					</div>
				</c:if>
				<c:set var="email" value="${currentNode.properties['email'].string}"/>
				<c:if test="${not empty email}">
					<div class="field">
						<img src="<c:url value="${url.currentModule}/img/ic_mail.png" />"/>

						<div class="card-field">${email}</div>
					</div>
				</c:if>
				<c:set var="skypeID" value="${currentNode.properties['skypeID'].string}"/>
				<c:if test="${not empty skypeID}">
					<div class="field">
						<img src="<c:url value="${url.currentModule}/img/ic_skype.png" />"/>

						<div class="card-field">${skypeID}</div>
					</div>
				</c:if>
				<c:set var="description" value="${currentNode.properties['description'].string}"/>
				<c:if test="${not empty description}">
					<div class="about">
						<p class="card-about">
								${description}
						</p>
					</div>
				</c:if>
				<c:set var="team" value="${currentNode.parent}"/>
				<div class="team">
					<div class="card-team"><span><fmt:message key="busdir.label.team"/>&nbsp;</span><a
							href="${team.url}">
						<template:module
								node="${team}"
								view="team_noFormat"/></a></div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>