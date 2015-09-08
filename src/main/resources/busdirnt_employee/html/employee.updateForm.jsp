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

<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6">
		<div class="profile-card">
			<a class="but-cancel" href="${url.base}${currentNode.path}.html"><fmt:message
					key="busdir.label.cancel"/></a>

			<img class="card-header-info">
				<button class="change-photo">
					<div class="camera-bg">
						<div class="camera">
							<img src="<c:url value="${url.currentModule}/img/ic_camera.png"/>"/>
						</div>
					</div>
					<c:set var="photo" value="${currentNode.properties['image'].node}"/>
					<img class="card-picture" src="${photo.url}?t=thumbnail"/>
				</button>
			</div>

			<div class="card-body-info">
				<template:tokenizedForm>
				<form action="${url.base}${currentNode.path}" method="post" enctype="multipart/form-data">
					<div class="form-field">
						<label for="j:firstName"><fmt:message key="busdirnt_employee.j_firstName"/></label>
						<input type="text" id="j:firstName" name="j:firstName"
							   value="${currentNode.properties['j:firstName'].string}"/>
					</div>
					<div class="form-field">
						<label for="j:lastName"><fmt:message key="busdirnt_employee.j_lastName"/></label>
						<input type="text" id="j:lastName" name="j:lastName"
							   value="${currentNode.properties['j:lastName'].string}"/>
					</div>
					<div class="form-field">
						<label for="role"><fmt:message key="busdirnt_employee.role"/></label>
						<input type="text" id="role" name="role"
							   value="${currentNode.properties['role'].string}"/>
					</div>
					<div class="form-field">
						<label for="email"><fmt:message key="busdirnt_employee.email"/></label>
						<input type="text" id="email" name="email" value="${currentNode.properties['email'].string}"/>
					</div>
					<div class="form-field">
						<label for="fixPhoneNumber"><fmt:message key="busdirnt_employee.fixPhoneNumber"/></label>
						<input type="text" id="fixPhoneNumber" name="fixPhoneNumber"
							   value="${currentNode.properties['fixPhoneNumber'].string}"/>
					</div>
					<div class="form-field">
						<label for="mobilePhoneNumber"><fmt:message key="busdirnt_employee.mobilePhoneNumber"/></label>
						<input type="text" id="mobilePhoneNumber" name="mobilePhoneNumber"
							   value="${currentNode.properties['mobilePhoneNumber'].string}"/>
					</div>
					<div class="form-field">
						<label for="skypeID"><fmt:message key="busdirnt_employee.skypeID"/></label>
						<input type="text" id="skypeID" name="skypeID"
							   value="${currentNode.properties['skypeID'].string}"/>
					</div>

					<template:include view="hidden.updateForm.agenciesList"/>

					<div class="form-field">
						<label for="description"><fmt:message key="busdirnt_employee.description"/></label>
						<textarea class="text" id="description"
								  name="description">${currentNode.properties['description'].string}</textarea>
					</div>
						<input class="but-save" type="submit" value="<fmt:message key="busdir.label.saveChanges"/>"/>

					<input type="hidden" name="jcrNodeType" value="busdirnt:employee"/>
					<input type="hidden" name="jcrRedirectTo"
						   value="${url.base}${currentNode.path}"/>
					<input type="hidden" name="jcrNewNodeOutputFormat" value="html"/>
					<input type="hidden" name="jcrResourceID" value="${currentNode.identifier}"/>
					<input type="hidden" name="jcrMethodToCall" value="input"/>
				</form>
			</div>
			</template:tokenizedForm>

		</div>
	</div>
</div>


<%--<c:if test="${(renderContext.loggedIn) and (currentNode.properties['jcr:title'].string eq
renderContext.user.username)}">--%>
<%--
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
--%>
<%--</c:if>--%>