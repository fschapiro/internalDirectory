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

<c:if test="${renderContext.loggedIn}">

    <p><fmt:message key="busdirnt_employee.photo"/>:
        <input type="file" name="photo"/>
    </p>

    <template:tokenizedForm>
	<form action="${url.base}${currentNode.path}" method="post" enctype="multipart/form-data">
        <h2>${currentNode.properties['firstName'].string}&nbsp;${currentNode.properties['lastName'].string}</h2>
        <h4>${currentNode.properties['jcr:title'].string}</h4>
				<p><fmt:message key="busdirnt_employee.email"/>: ${currentNode.properties['email'].string}</p>
				<p><fmt:message key="busdirnt_employee.team"/>: <template:module node="${team}" view="default"/></p>

				<p><fmt:message key="busdirnt_employee.location"/>:
                    <c:set var="registeredLocation" value="${currentNode.properties['location'].string}"/>
					<select name="location">
						<option <c:if test="${registeredLocation eq 'Geneva'}">selected="selected"</c:if>>Geneva</option>
						<option <c:if test="${registeredLocation eq 'Paris'}">selected="selected"</c:if>>Paris</option>
						<option <c:if test="${registeredLocation eq 'Toronto'}">selected="selected"</c:if>>Toronto</option>
						<option <c:if test="${registeredLocation eq 'Klagenfurt'}">selected="selected"</c:if>>Klagenfurt</option>
						<option <c:if test="${registeredLocation eq 'Dusseldorf'}">selected="selected"</c:if>>Dusseldorf</option>
						<option <c:if test="${registeredLocation eq 'Washington D.C.'}">selected="selected"</c:if>>Washington D.C.</option>
						<option <c:if test="${registeredLocation eq 'Houston'}">selected="selected"</c:if>>Houston</option>
						<option <c:if test="${registeredLocation eq 'Other'}">selected="selected"</c:if>>Other</option>
					</select>
				</p>
				<p><fmt:message key="busdirnt_employee.fixPhoneNumber"/>: <input type="text" name="fixPhoneNumber" size="20" value="${currentNode.properties['fixPhoneNumber'].string}"/></p>
				<p><fmt:message key="busdirnt_employee.mobilePhoneNumber"/>:<input type="text" name="mobilePhoneNumber" size="20" value="${currentNode.properties['mobilePhoneNumber'].string}"/></p>
				<p><fmt:message key="busdirnt_employee.skypeID"/>:<input type="text" name="skypeID" size="20" value="${currentNode.properties['skypeID'].string}"/></p>

				<input type="submit" value="Cancel"/>
				<input type="submit" value="Update"/>

		<input type="hidden" name="jcrNodeType" value="busdirnt:employee"/>
		<input type="hidden" name="jcrRedirectTo" value="${url.base}${renderContext.mainResource.node.path}.employee-details"/>
		<input type="hidden" name="jcrNewNodeOutputFormat" value="html"/>
		<input type="hidden" name="jcrResourceID" value="${currentNode.identifier}"/>
        <input type="hidden" name="jcrMethodToCall" value="input"/>

	</form>
    </template:tokenizedForm>
</c:if>
<c:if test="${not renderContext.loggedIn}">
	<h4>this form only appears when logged in</h4>
</c:if>