<%--
  Created by IntelliJ IDEA.
  User: smart5
  Date: 2023-02-08
  Time: 오후 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>login</title>
</head>
<body>
<form action="/member/login" method="post">
  <input type="text" name="memberEmail" placeholder="이메일">
  <input type="text" name="memberPassword" placeholder="비밀번호">
  <input type="submit" value="로그인">
</form>
</body>
</html>
