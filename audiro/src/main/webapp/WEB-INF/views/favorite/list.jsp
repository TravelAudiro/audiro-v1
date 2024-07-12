<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>audiro</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous" />

<style>  
    .title {
         margin: 20px 0 0 0 ;
         text-align: center;
    }
    .card-wrapper {
            display: flex;
            justify-content: center;
            width: 100%;
    }
    
    .card {
        width: 600px; /* card 너비 설정 */
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        border-radius: 8px;
    }
    
    /* 탭 너비 조절 */
    .nav-tabs {
        flex: 0 0 600px; /* 내용에 맞게 너비 조절 */
        max-width: 600px; /* 탭이 필요에 따라 확장되도록 설정 */
        justify-content: center;
    }
    
    .tab-content {
        height: auto; /* 내용에 맞게 자동으로 높이 조절 */
}
    
    .nav-tabs .nav-link {
        font-size: 16px; /* 필요에 따라 글꼴 크기 조절 */
    }
    
    thead {
    		font-size:16px;
    }
    
    tbody {
    		font-size: 14px;
    }
    
</style>
    
</head>
<body>
    <div class="container-fluid">
        <%@ include file="../fragments/header.jspf"%>
        <main class="favorite d-flex justify-content-center">
            <div>
            <div class="title">
                <c:url var="heart" value="/images/heart.png" />
                <img src="${heart}" alt="heart" height="100">
            </div>
                <div class="card-wrapper">
                <div class="card mt-2">
                    <div class="card-body">
                        
                        <!--Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="tab" href="#tab-destination">여행지</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#tab-users">관심유저</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#tab-post">여행후기</a>
                            </li>
                        </ul>
                        
                        <!--Tab panes -->
                        <div class="tab-content">
                            <div id="tab-destination" class="tab-pane fade show active">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>user id</th>
                                            <th>favorite destination</th>
                                        </tr>    
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${favoriteDestination}" var="destination">
                                        <tr>
                                            <td>${destination.usersId}</td>
                                            <td>${destination.favoriteDestination}</td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div id="tab-users" class="tab-pane fade">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>user id</th>
                                            <th>favorite user nickname</th>
                                        </tr>    
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${favoriteUsers}" var="user">
                                        <tr>
                                            <td>${user.usersId}</td>
                                            <td>${user.interestedUserNickname}</td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div id="tab-post" class="tab-pane fade">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>user id</th>
                                            <th>favorite post</th>
                                        </tr>    
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${favoritePost}" var="post">
                                        <tr>
                                            <td>${post.usersId}</td>
                                            <td>${post.favoritePostTitle}</td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </main>
    </div>
    
    <div class="container-fluid">
        <%@ include file="../fragments/footer.jspf" %>
    </div>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>