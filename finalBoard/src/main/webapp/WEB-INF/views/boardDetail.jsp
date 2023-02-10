<%--
  Created by IntelliJ IDEA.
  User: smart5
  Date: 2023-02-09
  Time: 오후 6:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시글 상세</title>
</head>
<body>
    <table>
        <tr>
            <th>아이디</th>
            <td>${board.id}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${board.boardWriter}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td>${board.boardTitle}</td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${board.boardHits}</td>
        </tr>
        <tr>
            <th>작성 시간</th>
            <td>${board.boardCreateTime}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${board.boardContents}</td>
        </tr>
    </table>
    <button onclick="returnToList()">목록</button>
    <button onclick="update()">수정</button>
    <button onclick="deleteFn()">삭제</button>

</body>
<script>
    const returnToList = () => {
        location.href = "/board/";
    }

    const update = () => {
        const id = '${board.id}';
        location.href = "/board/update?id=" + id;
    }

    const deleteFn = () => {
        const id = '${board.id}';

        location.href = "/board/delete?id=" + id;
    }
</script>
</html>
