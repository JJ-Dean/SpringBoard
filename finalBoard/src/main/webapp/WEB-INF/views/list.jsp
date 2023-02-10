<%--
  Created by IntelliJ IDEA.
  User: smart5
  Date: 2023-02-08
  Time: 오후 3:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>list</title>
</head>
<body>
<table>
    <tr>
        <th>id</th>
        <th>email</th>
        <th>password</th>
        <th>name</th>
        <th>age</th>
        <th>mobile</th>
        <th>조회</th>
        <th>삭제</th>
    </tr>
    <c:forEach items="${memberList}" var="member">
<%--        var 는 반복문 안에서 쓰일 반복 변수 member로 객체에 접근할 수 있다.--%>
        <tr>
            <td>${member.id}</td>
<%--            member.ㅡ 에서 'ㅡ' 는 dto의 필드 이름과 같다.--%>

            <td>
                <a href="/member?id=${member.id}">${member.memberEmail}</a>
            </td>
            <td>${member.memberPassword}</td>
            <td>${member.memberName}</td>
            <td>${member.memberAge}</td>
            <td>${member.memberMobile}</td>
            <td>
                <a href="/member?id=${member.id}">조회</a>
            </td>
            <td>
                <button onclick="deleteMember('${member.id}')">삭제</button>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
<script>
    const deleteMember = (id) => {
        console.log(id);
        location.href = "/member/delete?id="+id;
    }
</script>
</html>
