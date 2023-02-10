<%--
  Created by IntelliJ IDEA.
  User: smart5
  Date: 2023-02-09
  Time: 오후 7:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글 수정</title>
</head>
<body>
  <form action="/board/update" method="post" name="updateForm">
    <input type="hidden" name="id" value="${board.id}" readonly>
    <input type="text" name="boardWriter" value="${board.boardWriter}" readonly>
    <input type="text" name="boardPass" id="boardPass" placeholder="비밀번호 입력">
    <input type="text" name="boardTitle" value="${board.boardTitle}">
    <textarea name="boardContents" cols="30" rows="10">${board.boardContents}</textarea>
    <input type="button" value="수정" onclick="updateReqFn()">

  </form>
</body>

<script>
  const updateReqFn = () => {
    const passInput = document.querySelector('#boardPass').value;
    const passDB = '${board.boardPass}';
    if (passInput == passDB) {
      document.updateForm.submit();
    }else {
      alert("비밀번호가 틀림");
    }
  }

</script>

</html>
