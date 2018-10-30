<%@ page session="false" contentType="text/html;charset=utf-8"%>
<script type="text/javascript">
	<c:if test="${!empty requestScope.acknowledgeCd && !empty requestScope.acknowledgeMsg}">
		parent.frame_body.message(<c:out value="${requestScope.acknowledgeCd}"/>,'<c:out value="${requestScope.acknowledgeMsg}"/>');
	</c:if>	
	<c:if test="${!empty requestScope.reaction}">
		<c:out value="${requestScope.reaction}"/>
	</c:if>
</script>