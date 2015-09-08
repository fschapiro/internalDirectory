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

<h1 class="section-title">${currentNode.properties['jcr:title'].string}</h1>

<c:set var="manager" value="${currentNode.properties['manager'].node}"/>
<c:if test="${not empty manager}">
	<h4><fmt:message key="busdir.label.manager"/>&nbsp;:&nbsp;<a href="${manager.url}">
			${manager.properties['j:firstName'].string}
		&nbsp;${manager.properties['j:lastName'].string}</a></h4>
</c:if>

<c:set var="subteams" value="${jcr:getChildrenOfType(currentNode, 'busdirnt:team')}"/>
<c:if test="${not empty subteams}">
	<h4 class="section-subtitle"><fmt:message key="busdir.label.teamsUnderThisTeam"/></h4>

	<div>
		<c:forEach items="${subteams}" var="subteam" varStatus="status">
			<c:if test="${status.index % 2 == 0}">
				<div class="row">
				<div class="col-md-1"></div>
			</c:if>
			<div class="col-md-5">
				<template:module node="${subteam}" view="smallCard"/>
			</div>
			<c:if test="${status.index % 2 == 1}">
				</div>
			</c:if>
			<c:if test="${status.index % 2 == 0 && status.last}">
				<div class="col-md-5">
				</div>
			</c:if>
		</c:forEach>
	</div>
</c:if>

<c:set var="employees" value="${jcr:getChildrenOfType(currentNode, 'busdirnt:employee')}"/>
<c:if test="${not empty employees}">
	<h4 class="section-subtitle"><fmt:message key="busdir.label.memberOfThisTeam"/></h4>

	<div>
		<c:forEach items="${employees}" var="employee" varStatus="status">
			<c:if test="${status.index % 2 == 0}">
				<div class="row">
				<div class="col-md-1"></div>
			</c:if>
			<div class="col-md-5">
				<template:module node="${employee}" view="smallCard"/>
			</div>
			<c:if test="${status.index % 2 == 1}">
				</div>
			</c:if>
			<c:if test="${status.index % 2 == 0 && status.last}">
				<div class="col-md-5">
				</div>
			</c:if>
		</c:forEach>
	</div>
</c:if>

<c:if test="${renderContext.editMode}">
	<template:module path="*"/>
</c:if>