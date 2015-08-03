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
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<template:addResources type="css" resources="businessDirectory.css"/>
<template:addResources type="css" resources="bootstrap.min.css"/>
<template:addResources type="javascript" resources="plugins.js"/>
<template:addResources type="javascript" resources="businessDirectory.js"/>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="agencies" value="${jcr:getChildrenOfType(currentNode, jcr:getConstraints(currentNode))}"/>
<h1>${title}</h1>
<%-- Agencies display --%>
<c:if test="${not empty agencies}">
	<c:forEach items="${agencies}" var="agency" varStatus="status">
		<c:if test="${status.index % 2 == 0}">
			<div class="row">
			<div class="col-md-1"></div>
		</c:if>
		<div class="col-md-5">
			<template:module node="${agency}" view="resume"/>
		</div>
		<c:if test="${status.index % 2 == 1}">
			</div>
		</c:if>
		<c:if test="${status.index % 2 == 0 && status.last}">
			<div class="col-md-5">
			</div>
		</c:if>
	</c:forEach>
</c:if>

<c:if test="${renderContext.editMode}">
	<template:module path="*"/>
</c:if>

