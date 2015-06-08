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


<c:set var="photo" value="${currentNode.properties['photo'].node}"/>
<c:if test="${not empty photo}">
	<img src="${photo.url}" align="left" hspace="10" vspace="10"/>
</c:if>
<c:if test="${ empty photo}">
	<img align="left" hspace="10" vspace="10"/>
</c:if>

<h2>${currentNode.properties['firstName'].string}&nbsp;${currentNode.properties['lastName'].string}</h2>
<h5>${currentNode.properties['jcr:title'].string}</h5>

<c:set var="location" value="${currentNode.properties['location'].string}"/>
<c:if test="${not empty location}">
	<p><fmt:message key="busdirnt_employee.location"/>:&nbsp;${location}</p>
</c:if>

<c:set var="email" value="${currentNode.properties['email'].string}"/>
<c:if test="${not empty email}">
	<p><fmt:message key="busdirnt_employee.email"/>:&nbsp;${email}</p>
</c:if>

<c:set var="mobile" value="${currentNode.properties['mobilePhoneNumber'].string}"/>
<c:if test="${not empty mobile}">
	<p><fmt:message
			key="busdirnt_employee.mobilePhoneNumber"/>:&nbsp;${mobile}</p>
</c:if>
<c:set var="fixnumber" value="${currentNode.properties['fixPhoneNumber'].string}"/>
<c:if test="${not empty fixnumber}">
	<p><fmt:message key="busdirnt_employee.fixPhoneNumber"/>:&nbsp;${fixnumber}</p>
</c:if>

<c:set var="skypeID" value="${currentNode.properties['skypeID'].string}"/>
<c:if test="${not empty skypeID}">
	<p><fmt:message key="busdirnt_employee.skypeID"/>:&nbsp;${skypeID}</p>
</c:if>

<c:set var="team" value="${currentNode.parent}"/>
<c:if test="${not empty team}">
	<fmt:message key="busdirnt_employee.team"/>:&nbsp;<template:module node="${team}" view="team_noFormat"/>
</c:if>
<c:if test="${empty team}">
	<fmt:message key="busdirnt_employee.team"/>:&nbsp;<fmt:message key="busdirnt.noTeam"/>
</c:if>

<c:if test="${(renderContext.loggedIn) and (currentNode.properties['jcr:title'].string eq renderContext.user.username)}">

<form action="${url.base}${currentNode.path}.employeeSwitchToUpdateAction.do" method="post">
    <input type="submit" value="Update" class="button"/>

	<input type="hidden" name="jcrNodeType" value="busdirnt:employee"/>
	<input type="hidden" name="jcrRedirectTo" value="${url.base}${renderContext.mainResource.node.path}.updateform"/>
	<input type="hidden" name="jcrNewNodeOutputFormat" value="html"/>
	<input type="hidden" name="jcrResourceID" value="${currentNode.identifier}"/>
</form>
</c:if>
