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


<div id="teamStructure">
    <ul>
        <li><template:module node="${currentNode}" view="noFormat" /></li>
        <ul>
        <c:forEach items="${currentNode.nodes}" var="nodeOfTeam">
            <c:if test="${jcr:isNodeType(nodeOfTeam,'busdirnt:employee')}">
                <li> <template:module node="${nodeOfTeam}" view="default" /></li>
            </c:if>
            <c:if test="${jcr:isNodeType(nodeOfTeam,'busdirnt:team')}">
                <template:module node="${nodeOfTeam}" view="treeView" />
            </c:if>
        </c:forEach>
        </ul>
    </ul>
</div>




