<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri = "jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>signup</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous" />
    <c:url var="header2Css" value="/css/header2.css" />
    <link href="${header2Css}" rel="stylesheet" />
    <c:url var="signUpCss" value="/css/signup.css" />
    <link href="${signUpCss}" rel="stylesheet" />
</head>
<body>

    <div class="container">
        <header>
            <%@ include file="../fragments/header2.jspf" %>
        </header>
        
        <main>
            <div class="card card-body col-6 mx-auto">
                <c:url var="signUpPage" value="/user/signup"/>
                <form action="${signUpPage}" method="post">
                    <input type="text" class="form-control" id="id" name="id" placeholder="아이디" required autofocus />
                    <div id="checkIdResult"></div>
                    <input type="password" class="form-control" id="password" name="passwordHash" placeholder="비밀번호" required />
                    <input type="password" class="form-control" id="confirmPassword" placeholder="비밀번호 확인" required />
                    <div id="checkPasswordResult"></div>
                    <input type="text" class="form-control" id="username" name="userName" placeholder="이름" required />
                    <div id="checkUsernameResult"></div>
                    <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임" required />
                    <div id="checkNicknameResult"></div>
                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="전화번호" required />
                    <div id="checkPhoneResult"></div>
                    <input type="email" class="form-control" id="email" name="email" placeholder="이메일" required />
                    <div id="checkEmailResult"></div>
                    <button class="form-control btn btn-outline-success disabled" id="btnSignUp">작성 완료</button>
                </form>
            </div>
        </main>
        
        <footer>
            <%@ include file="../fragments/footer.jspf" %>
        </footer>  
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    
    <c:url var="signUpJs" value="/js/signup.js" />
    <script src="${signUpJs}"></script>
</body>
</html>