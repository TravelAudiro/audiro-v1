<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 여행일기</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous" />
<style>
body {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-color: #f8f9fa;
    margin: 0;
}

.container-fluid {
    width: 100%;
    max-width: 1200px;
}

.heart-icon {
    width: 70px;
    height: 70px;
}

.heart-icon.active {
    filter: grayscale(0%) brightness(100%); /* 클릭 후 색이 변하도록 필터 적용 */
}

.list-group-item a {
    text-decoration: none;
    color: inherit; /* 부모 요소의 색상을 상속 */
}

.list-group-item a:hover {
    text-decoration: none; /* 호버 시 텍스트 밑줄 제거 */
    color: inherit; /* 부모 요소의 색상을 상속 */
}

#ranking {
    max-height: 700px; /* 원하는 랭킹 섹션 최대 높이로 조정 */
    max-width: 300px; /* 랭킹 섹션의 최대 너비 조정 */
    margin: auto; /* 가운데 정렬 */
}

/* 여행후기 게시판 제목에 마우스 오버 시 포인트 스타일 변경 */
.card-link {
    cursor: pointer;
    color: #000; /* 기본 텍스트 색상 */
    transition: color 0.3s; /* 색상 변경 트랜지션 설정 */
    text-decoration: none; /* 밑줄 제거 */
}

.card-link:hover {
    color: #007bff; /* 마우스 호버 시 텍스트 색상 변경 */
    text-decoration: none; /* 밑줄 제거 */
}

.likeReview {
    width: 70px;
    height: 70px;
	border:none!important;
}

.likeReview.active {
    filter: grayscale(0%) brightness(100%);
}

.likeReview .likeIcon{
	background-image: url(/audiro/images/like.png);
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    display: inline-block;
}


.likeReview.active .likeIcon{
	background-image: url(/audiro/images/like_red2.png);
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    display: inline-block;
}

</style>
</head>
<body>
    <div class="container-fluid">
        <c:set var="travelReviewPage" value="여행후기" />
        <%@ include file="../../fragments/header.jspf"%>

        <main class="row justify-content-center">
            <input id="postId" name="postId" type="hidden" value="${post.postId}" /> 
            <input id="usersId" name="usersId" type="hidden" value="${signedInUsersId}" /> 
      
            <!-- 여행일기 목록불러오기 -->
            <div class="col-md-8">
                <div class="mt-2 card" id="list">
                    <div class="card-body">
                        <div class="mb-3">
                            <h3>
                                <a href="<c:url value='/post/review/list' />" class="card-link">여행 후기 게시판</a>
                            </h3>
                        </div>
                        <div>
                            <!-- 로그인한 경우 추가 기능 -->
                            <c:if test="${not empty signedInUser}">
                                <div>
                                    <c:set var="createUrl" value="create" />
                                    <a href="${createUrl}"><button>여행 후기 작성하러 가기</button></a>
                                </div>
                                <c:set var="mypageUrl" value="mypage?id=${signedInUsersId}"/>
                                <a href="${mypageUrl}"><button>나의 여행일기</button></a>
                                </div>
                            </c:if>
                        </div>

                        <!-- 여행후기 게시판 제목 --><!-- 정렬순 -->
					<div class="d-flex justify-content-end mb-3">
						<form id="rank" name="rank" method="get" action="/api/review/list">
							<button id="sortLatest" class="btn btn-sm btn-primary me-2"
								type="button">최신순</button>
							<button id="sortLikes" class="btn btn-sm btn-primary"
								type="button">좋아요순</button>
						</form>
					</div>


					<!-- 검색창 -->
                        <div class="mb-3">
                            <form id="search" name="search" method="GET" action="list">
                                <div class="input-group">
                                    <select class="form-select form-select-sm me-2" name="category" style="flex: 2;">
                                        <option value="t">제목</option>
                                        <option value="c">내용</option>
                                        <option value="tc">제목+내용</option>
                                        <option value="n">닉네임</option>
                                    </select>
                                    <input type="text" class="form-control" placeholder="검색어를 입력하세요" aria-label="검색어를 입력하세요" name="keyword" style="flex: 8;">
                                    <button class="btn btn-outline-secondary" type="submit">검색</button>
                                </div>
                            </form>
                        </div>

                        <div class="row row-cols-1 row-cols-md-4 g-4"  id="reviewContainer">
                            <!-- 여행후기 카드 반복문  이미지변경하기 -->
                            <c:forEach var="list" items="${list}">
                                <div class="col">
                                <input id="postId" name="postId" type="hidden" value="${post.postId}" /> 
                                <input id="usersId" name="usersId" type="hidden" value="${signedInUsersId}" /> 
                                    <div class="card h-80">
                                        <div class="position-relative">
                                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=f8f357b6-4fdf-41dc-a6ff-cfddb4087409" class="card-img-top" alt="...">
                                            <p class="btn likeReview ${list.favoritePost != null ? 'active' : ''}" data-review-id="${list.postId}" style="position: absolute; top: 10px; right: 1px; z-index: 10;">
                                              <%--   <img src="<c:url value='/images/like.png' />" alt="like" style="width: 24px; height: 24px;" /> --%>
                                                <span class="likeIcon" alt="like" style="width: 24px; height: 24px;" />
                                            </p>
                                        </div>
                                        <div class="card-body">
                                            <!-- 클릭 시 상세페이지로 이동하는 링크 -->
                                            <h5 class="card-title">
                                                <a href="details?postId=${list.postId}&id=${list.id}" class="card-link">${list.title}</a>
                                            </h5>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="d-flex w-100 justify-content-between">
                                                    <small>${list.modifiedTime}</small>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
        </main>
</div>
   

    <!-- Bootstrap의 JS 라이브러리 -->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

    <!-- Axio JS 라이브러리 -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <!-- reviewMypage.js -->
    <c:url var="listJS" value="/js/list.js" />
    <script src="${listJS}"></script>

</body>
</html>
