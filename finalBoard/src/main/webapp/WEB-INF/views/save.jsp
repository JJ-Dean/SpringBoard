<%--
  Created by IntelliJ IDEA.
  User: smart5
  Date: 2023-02-07
  Time: 오후 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
    <form action="/member/save" method="post">
        <input type="text" name="memberEmail" placeholder="이메일" id="memberEmail" onblur="emailCheck()">
        <p id="check-result"></p>
        <input type="text" name="memberPassword" placeholder="비밀번호">
        <input type="text" name="memberName" placeholder="이름">
        <input type="text" name="memberAge" placeholder="나이">
        <input type="text" name="memberMobile" placeholder="전화번호">
        <input type="submit" value="회원가입" readonly>
    </form>
</body>
<script>
    // email 중복 체크 with Ajax
    // 1. email 입력값 가져온다.
    // 2. 입력값을 서버로 전송하고 똑같은 이메일이 있는지 체크한다.
    // 3. 사용 가능 여부를 이메일 입력창 아래에 표시

    const emailCheck = () => {
        const email = $("#memberEmail").val();
        const checkResult = document.querySelector('#check-result');
        console.log("입력한 이메일 = " + email);

        $.ajax({
            // 요청방식 : post, url : "email-check", data : email
            type: "post",
            url: "/member/email-check",
            data: {
                "memberEmail": email,
            },
            success: function(res) {
                console.log("요청 성공", res);
                if (res == 'ok') {
                    console.log("사용 가능한 이메일");
                    checkResult.style.color = "green";
                    checkResult.innerHTML = "사용 가능한 이메일이다."
                }else {
                    console.log("불가능");
                    checkResult.style.color = "red";
                    checkResult.innerHTML = "중복된 이메일이다."
                }
            },
            error: (err) => {
                console.log("에러 에러 ", err);
            }
        })
    }
</script>
</html>
