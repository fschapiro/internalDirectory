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

<c:set var="photo" value="${currentNode.properties['j:picture'].node}"/>
<c:set var="role" value="${currentNode.properties['role'].string}"/>
<c:set var="location" value="${currentNode.properties['location'].node}"/>

<div class="profile-card">
	<%-- TODO : display following DIV if the employee is new
	<div class="new-label">NEW</div>--%>
	<div class="card-header-info">
		<c:if test="${not empty photo}">
			<img class="card-picture" src="${photo.url}?t=thumbnail"/>
		</c:if>
		<h2 class="card-title"><a href="${currentNode.url}">${currentNode.properties['j:firstName'].string}&nbsp;
		${currentNode.properties['j:lastName'].string}</a></h2>
		<c:if test="${not empty role}">
			<div class="card-role">${role}</div>
		</c:if>
		<c:if test="${not empty location}">
			<div class="card-location"><fmt:message key="busdirnt_employee.location"/>&nbsp;:&nbsp;<template:module
					node="${location}" view="small"/></div>
		</c:if>
	</div>
</div>