<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>여행후기 수정페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<style>
body {
	background-color: #f8f9fa;
}

.main-container {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.card-container {
	width: 100%;
	max-width: 800px; /* 원하는 최대 너비로 설정 */
}

.form-inline {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	align-items: center;
}

#title {
	width: 100%;
	margin-bottom: 15px;
}

#summernote {
	width: 90%;
	margin: 0 auto;
}

.text-right {
	display: flex;
	justify-content: flex-end;
	width: 100%;
}

@media (max-width: 768px) {
	.card-container {
		padding: 10px; /* 작은 화면에서 패딩 추가 */
	}
	.form-inline {
		flex-direction: column;
		align-items: stretch;
	}
	#title {
		margin-bottom: 10px;
	}
}
</style>

</head>

<body>
	<div class="container-fluid main-container">
		<div class="container card-container">
			<c:set var="travelReviewPage" value="내 여행일기" />
			<%@ include file="../../fragments/header.jspf"%>

			<header> </header>
			<main>
				<div class="mt-2 card">
					<div class="card-header">
						<h4>여행후기 수정페이지</h4>
					</div>
					<div class="card-body">
						<form id="modifyForm" action="/audiro/post/review/update"
							method="post" class="form-inline">
							<input type="hidden" id="postId" name="postId"
								value="${list.postId}" /> 
                            <input type="hidden" id="id"
								name="id" value="${list.id}" /> 
                            <input id="title"
								class="form-control" name="title" value="${list.title}"
								type="text" required />
							<div id="summernoteContainer" class="w-100">
							    <textarea id="summernote" name="content">${list.content}</textarea>
							</div>
							<div class="w-100 mt-3 text-right">
							    <div class="d-flex justify-content-end align-items-center">
							        <label id="modifiedTime" class="col-form-label mr-2">${list.modifiedTime}</label>
							        <button class="btn btn-primary ml-2" id="modifyBtn">수정완료</button>
							    </div>
							</div>
						</form>
					</div>
				</div>
			</main>
		</div>
	</div>

	<div class="container-fluid">
		<%@ include file="../../fragments/footer.jspf"%>
	</div>

	<script>
		// Summernote 설정
		$('#summernote').summernote({
			placeholder : '내용을 입력하세요',
			tabsize : 2,
			height : 500, // Summernote의 초기 높이 설정
			width: '100%'
		});

		// textarea의 높이 자동 조정
		$('#summernote').on('summernote.change', function() {
			// textarea의 높이를 Summernote의 높이에 맞게 조정
			$(this).height('');
			$(this).height(this.scrollHeight);
		});
	</script>

	<!-- Axios 라이브러리 포함 -->
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<!-- reviewMypage.js -->
	<c:url var="mypageJS" value="/js/modify.js" />
	<script src="${mypageJS}"></script>

</body>
</html>
