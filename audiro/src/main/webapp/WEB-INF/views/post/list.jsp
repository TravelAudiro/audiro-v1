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
    border-color: white !important;
}

.likeReview.active {
    filter: grayscale(0%) brightness(100%);
    color: red !important;
    border-color: white !important;
}

</style>
</head>

 
<body>
    <div class="container-fluid">
        <c:set var="travelReviewPage" value="여행후기" />
        <%@ include file="../fragments/header.jspf"%>

        <main class="row">
        <input id="id" name="id" type="hidden" value="${signedInUser}" />
            <!-- 여행일기 목록불러오기 -->
            <div class="col-md-8">
                <div class="mt-2 card" id="list">
                    <div class="card-body">
                        <div class="mb-3">
                            <h3>
                                <a href="<c:url value='/post/review/list' />"
                                   class="card-link">여행 후기 게시판</a>
                            </h3>
                        </div>
                        <div>
                            <c:set var="createUrl" value="create" />
                            <a href="${createUrl}"><button>여행 후기 작성하러 가기</button></a>
                        </div>

                        <!-- 여행후기 게시판 제목 --><!-- 정렬순 -->
                        <div class="d-flex justify-content-end mb-3">
                            <form id="rank" name="rank" method="get" action="/api/review/list">
                                <select id="sortSelect" class="form-select form-select-sm me-2"
                                    aria-label=".form-select-sm example">
                                    <option value="latest">최신순</option>
                                    <option value="likes">좋아요순</option>
                                </select>
                            </form>
                        </div>
                        
                        
                        <!-- 검색창 -->
                        <div class="mb-3">
                            <form id="search" name="search" method="GET" action="search">
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

                        <div class="row row-cols-1 row-cols-md-4 g-4">
                            <!-- 여행후기 카드 반복문  이미지변경하기 -->
                            <c:forEach var="list" items="${list}">
                                <div class="col">
                                    <div class="card h-80">
                                        <div class="card-header" style="text-align: right">
                                            <button class="btn likeReview ${list.favoritePost != null ? 'active' : ''}" data-review-id="${list.postId}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="20"
                                                    height="20" fill="currentColor"
                                                    class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
                                                    <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1" />
                                                </svg>
                                            </button>
                                        </div>
                                        <div>
                                            <img
                                                src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=f8f357b6-4fdf-41dc-a6ff-cfddb4087409"
                                                class="card-img-top" alt="...">
                                        </div>
                                        <div class="card-body">
                                            <!-- 클릭 시 상세페이지로 이동하는 링크 -->
                                            <h5 class="card-title">
                                                <a href="details?postId=${list.postId}&id=${list.id}"class="card-link">${list.title}</a>
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

                        <!-- 페이징 -->
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center mt-4">
                                <li class="page-item"><a class="page-link" href="#"
                                    aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#"
                                    aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>

            <!-- 랭킹자리 -->
            <div class="col-md-4">
                <div class="mt-2 card" id="ranking">
                    <div class="card-body">
                        <h5 class="card-title">여행후기 많이 작성한 유저 TOP3</h5>

                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><a href="/post/1">1등</a></li>
                            <li class="list-group-item"><a href="/post/2">2등</a></li>
                            <li class="list-group-item"><a href="/post/3">3등</a></li>
                        </ul>   
                    </div>
                    
                    <div class="card-body">
                        <h5 class="card-title">댓글 많은 여행후기 TOP3</h5>

                         <ul class="list-group list-group-flush">
                            <li class="list-group-item"><a href="/post/1">1등</a></li>
                            <li class="list-group-item"><a href="/post/2">2등</a></li>
                            <li class="list-group-item"><a href="/post/3">3등</a></li>
                        </ul>
                    </div>
                    
                    <div class="card-body">
                        <h5 class="card-title">good 많은 여행후기 TOP3</h5>

                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><a href="details?postId=${rank.postId}">1등</a></li>
                            <li class="list-group-item"><a href="/post/2">2등</a></li>
                            <li class="list-group-item"><a href="/post/3">3등</a></li>
                        </ul>   
                    </div>
                </div>
            </div>
        </main>
    </div>

	<!-- 로그인유저저장 -->
	<script>
		var signedInUser = "${signedInUser}";
	</script>

	<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-wEmeIV1mKuiNp12aFgE3XrA6sgC09K6Qap604vR9CLMNHOVvA20vFJo7Gh2NvGhP"
        crossorigin="anonymous">
    </script>

    <!-- Axio JS 라이브러리 -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <!-- reviewMypage.js -->
    <c:url var="listJS" value="/js/list.js" />
    <script src="${listJS}"></script>

</body>
</html>