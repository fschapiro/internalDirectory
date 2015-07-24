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

<c:set var="treeLevel" value="${currentResource.moduleParams.treeLevel}"/>
<c:set var="parentTreeLevel" value="${currentResource.moduleParams.parentTreeLevel}"/>
<c:set var="initialLoop" value="0"/>

<c:if test="${empty treeLevel}">
    <c:set var="treeLevel" value="0"/>
    <c:set var="parentTreeLevel" value="${treeLevel}"/>
</c:if>

<c:if test="${treeLevel eq 0}">
<table id="teamStructure-${treeLevel}">
</c:if>
    <c:choose>
        <c:when test="${treeLevel eq 0}">
        <tr data-tt-id="${treeLevel}">
            <td><template:module node="${currentNode}" view="team_noFormat" /></td>
            <c:set var="initialLoop" value="1"/>
        </tr>
        </c:when>
        <c:otherwise>
            <tr data-tt-id="${treeLevel}" data-tt-parent-id="${parentTreeLevel}">
                <td><template:module node="${currentNode}" view="team_noFormat" /></td>
                <c:set var="initialLoop" value="0"/>
            </tr>
        </c:otherwise>
    </c:choose>

<c:set var="parentTreeLevel" value="${treeLevel}"/>
<c:set var="treeLevel" value="${treeLevel+1}"/>

        <c:forEach items="${currentNode.nodes}" var="nodeOfTeam">
            <c:if test="${jcr:isNodeType(nodeOfTeam,'busdirnt:employee')}">
                <tr data-tt-id="${treeLevel}" data-tt-parent-id="${parentTreeLevel}"><td><template:module node="${nodeOfTeam}" view="employee_noFormat" /></td></tr>
                <c:set var="treeLevel" value="${treeLevel+1}"/>
            </c:if>
            <c:if test="${jcr:isNodeType(nodeOfTeam,'busdirnt:team')}">
                <template:module node="${nodeOfTeam}" view="treeView">
                    <template:param name="parentTreeLevel" value="${parentTreeLevel}"></template:param>
                    <template:param name="treeLevel" value="${treeLevel+1}"></template:param>
                </template:module>
            </c:if>
        </c:forEach>
<c:if test="${initialLoop eq 1}">
</table>
</c:if>

<c:if test="${initialLoop eq 1}">
    <template:addResources type="css" resources="${url.currentModule}/css/jquery.treetable.theme.default.css,${url.currentModule}/css/jquery.treetable.css"/>
<script src="${url.currentModule}/javascript/jquery-2.1.4.min.js"></script>
<script src="${url.currentModule}/javascript/jquery.treetable.js"></script>
<script>
    $('#teamStructure-${parentTreeLevel}').treetable({expandable: true, initialState: "expanded"});
</script>
</c:if>
<c:set var="initialLoop" value="0"/>




