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

<jcr:sql var="agencies"
		 sql="select * from [busdirnt:agency] where isdescendantnode(['${currentNode.resolveSite.path}']) order by [jcr:title] asc"/>
<c:if test="${not empty agencies}">
	<div class="form-field">
		<label for="location"><fmt:message key="busdirnt_agency"/></label>
		<select id="location" name="location">
			<c:forEach items="${agencies.nodes}" var="agency">
				<option value="${agency.identifier}"
				<c:if
						test="${currentNode.properties['location'].node.identifier eq agency.identifier}">selected
				</c:if>>
						${agency.properties['jcr:title'].string}</option>
			</c:forEach>
		</select>
	</div>
</c:if>