<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>
	<%		
		session.invalidate();
	%>
	<script>
		location.href = 'index.jsp';
	</script>
</body>
</html>