<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<c:if test="${checkResult.id != null}">
				<i style="color:#da532c;" class="fas fa-times"></i>
			</c:if>
			<c:if test="${checkResult.id == null}">
				<i style="color:#7CBB00;" class="fas fa-check"></i>
			</c:if>	
</body>
</html>