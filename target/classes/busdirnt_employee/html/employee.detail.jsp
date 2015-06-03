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


<c:set var="photo" value="${currentNode.properties['photo'].node}"/>
<c:if test="${not empty photo}">
    <img src="${currentNode.properties['photo'].node.url}" align="left" hspace="10" vspace="10"/>
</c:if>
<c:if test="${ empty photo}">
    <img align="left" hspace="10" vspace="10"/>
</c:if>

<h2>${currentNode.properties['firstName'].string}&nbsp;${currentNode.properties['lastName'].string}</h2>
<h5>${currentNode.properties['jcr:title'].string}</h5>

<c:set var="location" value="${currentNode.properties['location'].string}"/>
<c:if test="${not empty location}">
    <p><fmt:message key="busdirnt_employee.location"/>:${currentNode.properties['location'].string}</p>
</c:if>

<c:set var="email" value="${currentNode.properties['email'].string}"/>
<c:if test="${not empty email}">
    <p><fmt:message key="busdirnt_employee.email"/>:${currentNode.properties['email'].string}</p>
</c:if>

<c:set var="mobile" value="${currentNode.properties['mobilePhoneNumber'].string}"/>
<c:if test="${not empty mobile}">
    <p><fmt:message key="busdirnt_employee.mobilePhoneNumber"/>:${currentNode.properties['mobilePhoneNumber'].string}</p>
</c:if>
<c:set var="fixnumber" value="${currentNode.properties['fixPhoneNumber'].string}"/>
<c:if test="${not empty fixnumber}">
    <p><fmt:message key="busdirnt_employee.fixPhoneNumber"/>:${currentNode.properties['fixPhoneNumber'].string}</p>
</c:if>

<c:set var="skypeID" value="${currentNode.properties['skypeID'].string}"/>
<c:if test="${not empty skypeID}">
    <p><fmt:message key="busdirnt_employee.skypeID"/>:${currentNode.properties['skypeID'].string}</p>
</c:if>
