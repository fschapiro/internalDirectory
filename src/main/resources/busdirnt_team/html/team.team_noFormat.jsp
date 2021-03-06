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

<c:set var="manager" value="${currentNode.properties['manager'].node}"/>
<template:addCacheDependency node="${manager}"/>

<c:if test="${not empty manager}">
  <a href="${currentNode.url}">${teamName}</a> &nbsp; - &nbsp; <a href="${manager.url}">
  ${manager.properties['j:firstName'].string} &nbsp; ${manager.properties['j:lastName'].string}</a>
</c:if>

<c:if test="${empty manager}">
  <template:module node="${currentNode}" view="team_noFormat_noManager"/>
</c:if>