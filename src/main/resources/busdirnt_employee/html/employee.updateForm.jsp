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

<%--<c:if test="${(renderContext.loggedIn) and (currentNode.properties['jcr:title'].string eq
renderContext.user.username)}">--%>
	<h1>${currentNode.properties['j:firstName'].string}&nbsp;${currentNode.properties['j:lastName'].string}</h1>
	<template:tokenizedForm><label class="control-label"><fmt:message key="busdirnt_employee.photo"/></label>


		<form action="${url.base}${currentNode.path}" method="post" enctype="multipart/form-data">
			<input type="file" name="photo"
				   class="control-input-file"/>
			<div><span><fmt:message key="busdirnt_employee.email"/></span>
					${currentNode.properties['j:email'].string}</div>

			<div><span><fmt:message key="busdirnt_employee.team"/></span>
				<template:module node="${team}" view="default"/></div>

			<div>
				<label for="location"><fmt:message key="busdirnt_employee.location"/></label>
				<c:set var="registeredLocation" value="${currentNode.properties['location'].string}"/>
				<select name="location" id="location">
					<option <c:if test="${registeredLocation eq 'Geneva'}">selected="selected"</c:if>>Geneva</option>
					<option <c:if test="${registeredLocation eq 'Paris'}">selected="selected"</c:if>>Paris</option>
					<option <c:if test="${registeredLocation eq 'Toronto'}">selected="selected"</c:if>>Toronto</option>
					<option <c:if test="${registeredLocation eq 'Klagenfurt'}">selected="selected"</c:if>>Klagenfurt
					</option>
					<option <c:if test="${registeredLocation eq 'Dusseldorf'}">selected="selected"</c:if>>Dusseldorf
					</option>
					<option <c:if test="${registeredLocation eq 'Washington D.C.'}">selected="selected"</c:if>>
						Washington D.C.
					</option>
					<option <c:if test="${registeredLocation eq 'Houston'}">selected="selected"</c:if>>Houston</option>
					<option <c:if test="${registeredLocation eq 'Other'}">selected="selected"</c:if>>Other</option>
				</select>
			</div>

			<div>
				<label for="fixPhoneNumber"><fmt:message
						key="busdirnt_employee.fixPhoneNumber"/></label>
				<input
						type="text"
						name="fixPhoneNumber"
						id="fixPhoneNumber"
						size="20"
						value="${currentNode.properties['fixPhoneNumber'].string}"
						class="input-large"/>
			</div>
			<div>
				<label for="mobilePhoneNumber"><fmt:message
						key="busdirnt_employee.mobilePhoneNumber"/></label>
				<input
						type="text"
						name="mobilePhoneNumber"
						id="mobilePhoneNumber" size="20"
						value="${currentNode.properties['mobilePhoneNumber'].string}"/>
			</div>

			<div>
				<label
					   for="skypeID"><fmt:message key="busdirnt_employee.skypeID"/></label>
				<input type="text"
					   name="skypeID"
					   id="skypeID"
					   size="20"
					   value="${currentNode.properties['skypeID'].string}"/>
			</div>

			<div>
				<input class="btn btn-primary" type="button" value="Cancel"
					   onclick="window.history.back()"/>
				<input class="btn btn-primary" type="submit" value="Update"/>
			</div>

			<input type="hidden" name="jcrNodeType" value="busdirnt:employee"/>
			<input type="hidden" name="jcrRedirectTo"
				   value="${url.base}${renderContext.mainResource.node.path}.employee-details"/>
			<input type="hidden" name="jcrNewNodeOutputFormat" value="html"/>
			<input type="hidden" name="jcrResourceID" value="${currentNode.identifier}"/>
			<input type="hidden" name="jcrMethodToCall" value="input"/>

		</form>
	</template:tokenizedForm>
	</div>
<%--</c:if>
<c:if test="${not renderContext.loggedIn}">
	<h4>this form only appears when logged in</h4>
</c:if>--%>