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

<c:if test="${(renderContext.loggedIn) and (currentNode.properties['jcr:title'].string eq
renderContext.user.username)}">
<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6">
		<div class="profile-card">
			<a class="but-cancel" href="${url.base}${currentNode.path}.html"><fmt:message
					key="busdir.label.cancel"/></a>

			<div class="card-header-info">
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
				<form action="${url.basePreview}${currentNode.path}" method="post" enctype="multipart/form-data">
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
						   value="${url.baseLive}${currentNode.path}"/>
					<input type="hidden" name="jcrNewNodeOutputFormat" value="html"/>
					<input type="hidden" name="jcrResourceID" value="${currentNode.identifier}"/>
					<input type="hidden" name="jcr:mixinTypes" value="jmix:autoPublish"/>
					<input type="hidden" name="jcrMethodToCall" value="input"/>
				</form>
			</div>
			</template:tokenizedForm>
		</div>
	</div>
</div>
</c:if>