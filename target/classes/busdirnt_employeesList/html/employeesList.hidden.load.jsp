<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<c:set var="statement" value="select * from [busdirnt:employee] as emp where isdescendantnode(['${currentNode.resolveSite.path}']) order by emp.[lastName] asc"/>

<c:set var="maxResults" value="${currentNode.properties['maxResults'].double}"/>

<c:choose>
  <c:when test="${not empty maxResults}">
    <query:definition var="listQuery" statement="${statement}" limit="${currentNode.properties.maxResults.double}"/>
  </c:when>
  <c:otherwise>
	<query:definition var="listQuery" statement="${statement}"/>
  </c:otherwise>
</c:choose>


<c:set target="${moduleMap}" property="editable" value="false" />
<c:set target="${moduleMap}" property="emptyListMessage">
	<fmt:message key="busdirnt.noEmployeeFound"/>
</c:set>
<c:set target="${moduleMap}" property="listQuery" value="${listQuery}" />
<c:set target="${moduleMap}" property="subNodesView"
       value="${currentNode.properties.resultView.string}" />
