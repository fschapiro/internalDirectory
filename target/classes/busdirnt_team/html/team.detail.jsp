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

<h2>${currentNode.properties['jcr:title'].string}</h2>

<c:set var="manager" value="${currentNode.properties['manager'].node}"/>
<c:if test="${not empty manager}">
    <h5><a href="${currentNode.url}">${teamName}</a> &nbsp; - &nbsp; <a href="${manager.url}">${manager.properties['firstName'].string} &nbsp; ${manager.properties['lastName'].string}</a></h5>
</c:if>
<c:if test="${empty manager}">
    <h5><fmt:message key="busdirnt_team.manager"/>:</h5>
</c:if>


<fmt:message key="busdir.label.memberOfThisTeam"/>
<ul>
<c:forEach items="${jcr:getChildrenOfType(currentNode, 'busdirnt:employee')}" var="employee">
    <li><template:module node="${employee}" view="default"/></li>
</c:forEach>
</ul>

<fmt:message key="busdir.label.teamsUnderThisTeam"/>
<ul>
<c:forEach items="${jcr:getChildrenOfType(currentNode, 'busdirnt:team')}" var="subteam">
    <li><template:module node="${subteam}" view="default"/></li>
</c:forEach>
</ul>

<c:if test="${renderContext.editMode}">
    <template:module path="*" />
</c:if>