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
<link
	href="https://webfontworld.github.io/Cafe24SsurroundAir/Cafe24SsurroundAir.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin>
<style>

font
body {
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	background-color: #f8f9fa;
	margin: 0;
	font-family: 'Cafe24SsurroundAir', sans-serif; /* 웹폰트 적용 */
	
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
	border: none !important;
}

.likeReview.active {
	filter: grayscale(0%) brightness(100%);
}

.likeReview .likeIcon {
	background-image: url(/audiro/images/like_black.png);
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	display: inline-block;
}

.likeReview.active .likeIcon {
	background-image: url(/audiro/images/like_red2.png);
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	display: inline-block;
}

.btn-mint {
	background-color: #d4f0f0; /* 파스텔 민트 색상 */
	border: none;
	color: black;
	font-weight: bold;
	padding: 10px 20px; /* 버튼 크기 조정 */
	font-size: 1em; /* 글자 크기 */
	border-radius: 5px; /* 모서리 둥글게 */
	transition: background-color 0.3s; /* 호버 효과 */
	margin-bottom: 20px; /* 아래 마진 추가 */
}

.btn-mint:hover {
	background-color: #a2e1db; /* 조금 더 진한 파스텔 민트 색상 */
}

.card-fixed-height {
	height: 300px; /* 원하는 고정 높이 설정 */
	overflow: hidden; /* 내용이 넘칠 경우 숨김 */
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	border: 1px solid #ccc;
	border-radius: 8px;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	background-color: #fff;
}

.card-body {
	flex: 1; /* 카드 본문이 남은 공간을 차지하도록 설정 */
	overflow: hidden; /* 넘치는 내용 숨김 */
	display: flex;
	flex-direction: column;
}

.card-content {
	flex-grow: 1; /* 내용이 적더라도 공간을 채우도록 설정 */
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 5; /* 원하는 줄 수로 설정 */
	-webkit-box-orient: vertical;
	max-height: 100px; /* 최대 높이 설정 */
}

.card-content img {
	max-width: 100%; /* 이미지가 카드의 너비를 넘지 않도록 설정 */
	height: auto; /* 이미지의 높이는 자동 조정 */
	max-height: 100px; /* 이미지의 최대 높이 설정 */
	object-fit: cover; /* 이미지가 컨테이너에 맞게 조정되도록 설정 */
}
</style>
</head>
<body>
	<c:set var="travelReviewPage" value="여행후기" />
	<%@ include file="../../fragments/header.jspf"%>
	
	<div class="container-fluid">
	</div>
		<div class="container">
		<main class="row justify-content-center" style="margin-top: 50px;">
			<input id="postId" name="postId" type="hidden" value="${post.postId}" />
			<input id="usersId" name="usersId" type="hidden" value="${signedInUsersId}" />

			<!-- 여행일기 목록불러오기 -->
			<div class="col-md-8">
				<div class="mt-2 card" id="list">
					<div class="card-body">
						<div class="mb-3">
							<h3>
								<a href="<c:url value='/post/review/list' />" class="card-link">여행
									후기 게시판</a>
							</h3>
						</div>
						<div>
							<!-- 로그인한 경우 추가 기능 -->
							<c:if test="${not empty signedInUser}">
								<div
									style="display: flex; align-items: center; gap: 10px; justify-content: flex-end;">
									<!-- 한 줄로 배치하고 버튼 간격 설정 -->
									<c:set var="createUrl" value="create" />
									<a href="${createUrl}">
										<button type="button" class="btn-mint">여행 후기 작성하러 가기</button>
									</a>
									<c:set var="mypageUrl" value="mypage?id=${signedInUsersId}" />
									<a href="${mypageUrl}">
										<button type="button" class="btn-mint">나의 여행일기</button>
									</a>
								</div>
							</c:if>

						</div>

						<!-- 검색창 -->
						<div class="mb-3">
							<form id="search" name="search" method="GET" action="list">
								<div class="input-group">
									<select class="form-select form-select-sm me-2" name="category"
										style="flex: 2;">
										<option value="t">제목</option>
										<option value="c">내용</option>
										<option value="tc">제목+내용</option>
										<option value="n">닉네임</option>
									</select> <input type="text" class="form-control"
										placeholder="검색어를 입력하세요" aria-label="검색어를 입력하세요"
										name="keyword" style="flex: 8;">
									<button class="btn btn-outline-secondary" type="submit">검색</button>
								</div>
							</form>
						</div>

						<div class="row row-cols-1 row-cols-md-4 g-4" id="reviewContainer">
							<!-- 여행후기 카드 반복문  이미지변경하기 -->
							<c:forEach var="list" items="${list}">
								<div class="col">
									<input id="postId" name="postId" type="hidden"
										value="${post.postId}" /> <input id="usersId" name="usersId"
										type="hidden" value="${signedInUsersId}" />
									<div class="card h-80">
										<div class="position-relative">
											<a href="details?postId=${list.postId}&id=${list.id}"
												class="card-link"></a>
											<div class="card-content"
												onclick="window.location.href='details?postId=${list.postId}&id=${list.id}'">
												${list.content}</div>
											<p
												class="btn likeReview ${list.favoritePost != null ? 'active' : ''}"
												data-review-id="${list.postId}"
												style="position: absolute; top: 10px; right: 1px; z-index: 10;">
												<%--   <img src="<c:url value='/images/like.png' />" alt="like" style="width: 24px; height: 24px;" /> --%>
												<span class="likeIcon" alt="like"
													style="width: 24px; height: 24px;" />
											</p>
										</div>
										<div class="card-body">
											<!-- 클릭 시 상세페이지로 이동하는 링크 -->
											<h5 class="card-title">
												<a href="details?postId=${list.postId}&id=${list.id}"
													class="card-link">${list.title}</a>
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
	
	<script>
		const signedInUser = `${signedInUser}`;
	</script>

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
