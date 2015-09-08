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

<c:set var="teamName" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="children" value="${jcr:getChildrenOfType(currentNode, 'busdirnt:team')}"/>
<c:set var="employeesChildren" value="${jcr:getChildrenOfType(currentNode, 'busdirnt:employee')}"/>
<div class="panel-title-group">
	<a href="#" class="<c:if test="${not empty children}">accordion-arrow</c:if> accordion collapsed"
	   data-toggle="collapse"
	   data-target="#${currentNode.identifier}"
	   data-parent="#menu"></a>
	<c:set var="numberOfMembers" value="${fn:length(employeesChildren) eq 0 ? 0 : fn:length(employeesChildren)}"/>

	<div class="panel-title"><a href="${url.base}${currentNode.path}.html">${teamName}</a><span
			class="card-subtitle"> (${numberOfMembers}&nbsp;
				<fmt:message key="busdir.label.members"/>)</span></div>
</div>

<c:set var="children" value="${jcr:getChildrenOfType(currentNode, 'busdirnt:team')}"/>

<c:if test="${not empty children}">
	<div id="${currentNode.identifier}" class="collapse">
		<ul class="level">
			<c:forEach items="${jcr:getChildrenOfType(currentNode, 'busdirnt:team')}" var="subteam">
				<template:module node="${subteam}" view="hidden.treeNode"/>
			</c:forEach>
		</ul>
	</div>
</c:if>

<c:if test="${renderContext.editMode}">
	<template:module path="*"/>
</c:if>