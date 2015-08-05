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

<c:set var="teamName" value="${currentNode.properties['jcr:title'].string}"/>

<c:set var="employees" value="${jcr:getChildrenOfType(currentNode, 'busdirnt:employee')}"/>

<div class="team-card">
	<div class="card-header-info">
		<h1 class="card-title"><a href="${currentNode.url}">${teamName}</a></h1>
		<div class="card-subtitle"><a href="teams2.html#members">${fn:length(employees)}&nbsp;<fmt:message
				key="busdir.label.members"/></a></div>
	</div>
</div>