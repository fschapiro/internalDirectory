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

<template:addResources type="css" resources="${url.currentModule}/css/businessdirectory.css"/>

<div class="busdir-employee">
	<h2>${currentNode.properties['j:firstName'].string}&nbsp;${currentNode.properties['j:lastName'].string}</h2>

	<c:set var="photo" value="${currentNode.properties['j:picture'].node}"/>
	<c:if test="${not empty photo}">
		<img class="busdir-photo" src="${photo.url}?t=thumbnail"/>
	</c:if>

	<c:set var="location" value="${currentNode.properties['location'].node}"/>
	<c:if test="${not empty location}">
		<div>
				<fmt:message key="busdirnt_employee.location"/>&nbsp;<template:module node="${location}"/>
		</div>
	</c:if>

	<c:set var="email" value="${currentNode.properties['email'].string}"/>
	<c:if test="${not empty email}">
		<div>
				<fmt:message key="busdirnt_employee.email"/>&nbsp;${email}
		</div>
	</c:if>

	<c:set var="mobile" value="${currentNode.properties['mobilePhoneNumber'].string}"/>
	<c:if test="${not empty mobile}">
		<div>
				<fmt:message key="busdirnt_employee.mobilePhoneNumber"/>&nbsp;${mobile}
		</div>
	</c:if>
	<c:set var="fixnumber" value="${currentNode.properties['fixPhoneNumber'].string}"/>
	<c:if test="${not empty fixnumber}">
		<div>
				<fmt:message key="busdirnt_employee.fixPhoneNumber"/>&nbsp;${fixnumber}
		</div>
	</c:if>

	<c:set var="skypeID" value="${currentNode.properties['skypeID'].string}"/>
	<c:if test="${not empty skypeID}">
		<div>
				<fmt:message key="busdirnt_employee.skypeID"/>&nbsp;${skypeID}
		</div>
	</c:if>

	<c:set var="team" value="${currentNode.parent}"/>
		<div class="control-group">
				<fmt:message key="busdirnt_employee.team"/><br/>
				<c:choose>
					<c:when test="${not empty team}">
						<template:module node="${team}" view="team_noFormat"/>
					</c:when>
					<c:otherwise>
						<fmt:message key="busdirnt.noTeam"/>
					</c:otherwise>
				</c:choose>
		</div>

	<%--<c:if test="${(renderContext.loggedIn) and (currentNode.properties['jcr:title'].string eq
	renderContext.user.username)}">--%>
		<div class="control-group-button">
		<form action="${url.base}${currentNode.path}.employeeSwitchToUpdateAction.do" method="post">
			<input type="submit" value="Update" class="control-button btn btn-primary"/>

			<input type="hidden" name="jcrNodeType" value="busdirnt:employee"/>
			<input type="hidden" name="jcrRedirectTo"
				   value="${url.base}${renderContext.mainResource.node.path}.updateform"/>
			<input type="hidden" name="jcrNewNodeOutputFormat" value="html"/>
			<input type="hidden" name="jcrResourceID" value="${currentNode.identifier}"/>
		</form>
		</div>
	<%--</c:if>--%>
</div>
