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

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="description" value="${currentNode.properties['description'].string}"/>
<c:set var="image" value="${currentNode.properties['image'].node}"/>
<c:set var="fixPhoneNumber" value="${currentNode.properties['fixPhoneNumber'].string}"/>
<c:set var="faxNumber" value="${currentNode.properties['faxNumber'].string}"/>

<c:set var="street" value="${currentNode.properties['j:street'].string}"/>
<c:set var="town" value="${currentNode.properties['j:town'].string}"/>
<c:set var="zipCode" value="${currentNode.properties['j:zipCode'].string}"/>
<c:set var="country" value="${currentNode.properties['j:country'].string}"/>

<div class="card">
	<div class="info">
		<c:if test="${not empty image}">
			<img src="${url.files}${image.path}" alt="${title}"/>
		</c:if>

		<h2><a href="${currentNode.url}">${title}</a></h2>

		<jcr:sql var="agencyEmployees"
				 sql="SELECT * FROM [busdirnt:employee] AS emp WHERE ISDESCENDANTNODE(emp, '${currentNode.resolveSite.path}') AND emp.[location] = '${currentNode.identifier}'"/>
		<h3><a href="#">${agencyEmployees.nodes.size} <fmt:message key="busdir.label.members"/></a></h3>

		<div class="splitter"></div>
		<c:if test="${not empty fixPhoneNumber}">
			<div class="field">
				<img
						src="<c:url value="${url.currentModule}/img/ic_phone.png" />" /><h4><a href="tel:">${fixPhoneNumber}</a></h4>
			</div>
		</c:if>
		<c:if test="${not empty faxNumber}">
			<div class="field">
				<img src="<c:url value="${url.currentModule}/img/ic_fax.png" />" /><h4><a href="tel:">${faxNumber}</a></h4>
			</div>
		</c:if>

		<div class="field">
			<address>
				<img src="<c:url value="${url.currentModule}/img/ic_location.png" />" />
				<h4>
					<c:if test="${not empty street}">
						${fn:escapeXml(street)}
					</c:if>
					<c:if test="${not empty zipCode || not empty town}">
						,
						<c:if test="${not empty zipCode}">
							${fn:escapeXml(zipCode)}&nbsp;
						</c:if>
						${not empty town ? fn:escapeXml(town) : ''}
					</c:if>
					<jcr:nodePropertyRenderer name="j:country" node="${currentNode}" renderer="country" var="country"/>
					<c:if test="${not empty country}">
						(${fn:escapeXml(country.displayName)})
					</c:if>
				</h4>
			</address>
		</div>
	</div>
</div>