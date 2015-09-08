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

<template:addResources type="javascript" resources="modernizr-2.8.3-respond-1.4.2.min.js"/>
<template:addResources type="css" resources="businessDirectory.css"/>
<template:addResources type="css" resources="bootstrap.min.css"/>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<%--<div class="row">--%>
	<h1 class="section-title">${title}</h1>

	<div class="col-md-10 col-md-offset-1">
		<div id="menu" class="panel list-group">
			<c:forEach items="${jcr:getChildrenOfType(currentNode, 'busdirnt:team')}" var="subteam">
				<template:module node="${subteam}" view="default"/>
			</c:forEach>
		</div>
	</div>
	<c:if test="${renderContext.editMode}">
		<template:module path="*"/>
	</c:if>
<%--</div>--%>