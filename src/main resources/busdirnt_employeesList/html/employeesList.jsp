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

<template:addResources type="css" resources="${url.currentModule}/css/jquery.dataTables.css"/>

<jcr:sql var="employeeListData"
		 sql="SELECT * FROM [busdirnt:employee] AS emp WHERE ISDESCENDANTNODE(emp, '${currentNode.resolveSite.path}') ORDER BY emp.[j:lastName] asc"/>


<table id="listOfEmployees" class="display">
	<thead>
	<tr>
		<th><fmt:message key="busdirnt_employeeList.Name"/></th>
		<th><fmt:message key="busdirnt_employeeList.Team"/></th>
		<th><fmt:message key="busdirnt_employeeList.Manager"/></th>
		<th><fmt:message key="busdirnt_employeeList.Location"/></th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${employeeListData.nodes}" var="employ">
		<tr>
			<td><template:module node="${employ}" view="employee_noFormat"/></td>
			<c:set var="teamOfEmployee" value="${employ.parent}"/>
			<td><template:module node="${teamOfEmployee}" view="team_noFormat_noManager"/></td>
			<c:set var="managerOfTeam" value="${teamOfEmployee.properties['manager'].node}"/>
			<c:choose>
				<c:when test="${not empty managerOfTeam}">
					<td><template:module node="${managerOfTeam}" view="employee_noFormat"/></td>
				</c:when>
				<c:otherwise>
					<td><fmt:message key="busdirnt_employeeList.NoManager"/></td>
				</c:otherwise>
			</c:choose>
			<td><template:module node="${employ.properties['location'].node}" view="small"/></td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<script type="text/javascript" charset="utf8" src="${url.currentModule}/javascript/jquery-2.1.4.min.js"></script>
<script type="text/javascript" charset="utf8" src="${url.currentModule}/javascript/jquery.dataTables.js"></script>
<script>
	$('#listOfEmployees').DataTable();
</script>