<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>여행후기 글쓰기</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />

<!-- Quill CSS 포함 -->
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet">


<style>
body {<!--body 스타일 --> width:80%;
	margin: 0 auto;
	font-family: Arial, sans-serif;
	line-height: 1.6;
	background-color: white !important;
	padding: 100px;
}

#title, #buttons-container { <%--모든 제목, 버튼 비율 --%> width:100%;
	
}

#buttons-container .btn { <%--모든 버튼들 마진--%> margin-right:5px;
	margin-left: 10px;
}

#thumbnailDeleteButton { <%--썸네일 이미지 삭제버튼 --%> display:none;
	
}

#savebtn {
	background-color: #f9f9a3; /* 파스텔 노란색 */
	border: none;
	color: black;
	font-weight: bold;
	padding: 10px 20px; /* 패딩을 늘려서 버튼 크기 키우기 */
	font-size: 1.2em; /* 글자 크기 키우기 */
	position: relative;
	float: right; /* 버튼을 오른쪽으로 이동 */
	margin-right: 5px; /* 다른 버튼과의 간격 */
	margin-top: 10px; /* 위쪽 간격 추가 */
}

#savebtn:hover {
	background-color: #f1f1a3; /* 호버 효과를 위한 조금 더 진한 파스텔 노란색 */
}

.btn.travelCourseBtn, .btn.thumbnailBtn {
	background-color: #a3c6f9; /* 파스텔 하늘색 */
	border: none;
}

.btn.travelCourseBtn:hover, .btn.thumbnailBtn:hover {
	background-color: #a3bff1; /* 호버 효과를 위한 조금 더 진한 파스텔 하늘색 */
}

.form-row {
	display: flex;
	align-items: center;
	justify-content: flex-end; /* 오른쪽 정렬 */
}

#title {
	flex: 1; /* 남은 공간을 차지하도록 설정 */
	margin-right: 20px; /* 버튼과의 간격 */
}

#buttons-container {
	display: flex;
	align-items: center;
	justify-content: flex-end; /* 오른쪽 정렬 */
}

<!--
스타일 태그안에 넣기 --><!--폰트 크기 옵션을 스타일링 -->.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="10px"]::before
	{
	content: '10px';
	font-size: 10px;
}

.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="12px"]::before {
	content: '12px';
	font-size: 12px;
}

.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="14px"]::before {
	content: '14px';
	font-size: 14px;
}

.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="16px"]::before {
	content: '16px';
	font-size: 16px;
}

.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="18px"]::before {
	content: '18px';
	font-size: 18px;
}

.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="20px"]::before {
	content: '20px';
	font-size: 20px;
}

.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="24px"]::before {
	content: '24px';
	font-size: 24px;
}

.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="28px"]::before {
	content: '28px';
	font-size: 28px;
}

.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="32px"]::before {
	content: '32px';
	font-size: 32px;
}

.editor-container {
	height: 500px; /* 원하는 높이로 설정 */
	border: 1px solid #ccc; /* 에디터 경계 설정 */
}
</style>
</head>
<body class="bg-white">
	<div class="container-fluid">
		<
		<c:set var="travelReviewPage" value="내 여행일기" />
		<%@ include file="../../fragments/header.jspf"%>

		<header>
			<main>
				<div class="mt-2 card">
					<div class="card-header">
						<h4>여행후기 글쓰기</h4>
					</div>
					<div class="card-body">
						<c:url var="reviewPage" value="/post/review/list" />

						<form id="createForm">
							<input type="hidden" name="id" value="${signedInUser}" />
							<!-- 여행코스 선택하기(모달창), 썸네일 이미지 선택,삭제하기 (버튼) -->
							<div class="form-row w-100">
								<div class="col-md-8 mb-3">
									<input id="title" name="title" class="form-control" type="text"
										placeholder="제목을 입력하세요" required>
								</div>
								<div id="buttons-container">

									<button type="button" id="selectTravelCourseButton"
										class="btn travelCourseBtn" data-toggle="modal"
										data-target="#selectTravelCourseModal">여행 코스 선택하기</button>
									<button type="button" id="thumbnailButton"
										class="btn thumbnailBtn ml-2">썸네일 이미지 선택하기</button>
									<input type="file" id="thumbnailInput" accept="image/*"
										style="display: none;">
									<button type="button" id="thumbnailDeleteButton"
										class="btn btn-danger ml-2">썸네일 이미지 삭제</button>
								</div>
							</div>

							<!-- 여행코스선택 모달창-->
							<div class="modal fade" id="selectTravelCourseModal"
								tabindex="-1" role="dialog"
								aria-labelledby="selectTravelCourseModalLabel"
								aria-hidden="true">
								<div class="modal-dialog modal-lg" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="selectTravelCourseModalLabel">여행
												코스 선택</h5>

										</div>
										<div class="modal-body" id="modalBodyContent">
											<!-- 여행 코스 선택 모달 본문이 여기에 동적으로 삽입됩니다. -->
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">닫기</button>
											<button type="button" id="selectTravelCourseCompleteButton"
												class="btn btn-primary">선택 완료</button>
										</div>
									</div>
								</div>
							</div>

							<!-- 썸머노트라이브러이 이용한 내용작성
						<textarea id="summernote" name="content"></textarea>-->

							<!-- quill 에디터 이용한 내용작성	-->
							<div class="container mt-3">
								<div class="editor-container" id="editor"></div>
								<!-- Quill 에디터 내용을 저장하기 위한 숨겨진 텍스트 영역 추가 -->
								<textarea id="c_editor" name="content" style="display: none;"></textarea>
							</div>
						</form>

						<!-- create 전체 내용 저장 -->
						<button type="submit" class="btn" id="savebtn">저장</button>
					</div>

				</div>
	</div>
	</main>
	</div>

	<script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	// Summernote 설정
	$('#summernote').summernote({
		placeholder : '내용을 입력하세요',
		tabsize : 2,
		height : 300
	// Summernote의 초기 높이 설정
	});

	// textarea의 높이 자동 조정
	$('#summernote').on('summernote.change', function() {
		// textarea의 높이를 Summernote의 높이에 맞게 조정
		$(this).height('');
		$(this).height(this.scrollHeight);
	});
	*/

	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-wEmeIV1mKuiNp12aFgE3XrA6sgC09K6Qap604vR9CLMNHOVvA20vFJo7Gh2NvGhP"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<c:url var="createJS" value="/js/create.js" />
	<script src="${createJS}"></script>









	<!-- Quill 라이브러리 -->
	<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
	<!-- Quill JavaScript 파일을 포함 -->
	<script>

// 글씨 크기 옵션 설정
var Size = Quill.import('attributors/style/size');
Size.whitelist = ['10px', '12px', '14px', '16px', '18px', '20px', '24px', '28px', '32px']; // 여기서 글씨 크기 옵션을 설정할 수 있습니다
Quill.register(Size, true);

// 글씨 색상 옵션 설정
var Color = Quill.import('attributors/style/color');
Quill.register(Color, true);



// 툴바 옵션 설정
var toolbarOptions = [

    [{ 'size': ['10px', '12px', '14px', '16px', '18px', '20px', '24px', '28px', '32px'] }], // 폰트 크기 옵션
    [{ 'color': [] }], // 글씨 색상 옵션 (Quill에서 기본 색상 팔레트 사용)
    [{ 'header': [1, 2, 3, false] }], // 헤더 스타일
    ['bold', 'italic', 'underline', 'strike'], // 굵게, 기울임, 밑줄, 취소선
    [{ 'list': 'ordered'}, { 'list': 'bullet' }], // 목록 (순서 있는, 순서 없는)
    ['link', 'image', 'video'], // 링크, 이미지, 비디오
    ['blockquote', 'code-block'], // 블럭 인용문, 코드 블럭
    [{ 'script': 'sub'}, { 'script': 'super' }], // 아래첨자, 위첨자
    [{ 'indent': '-1'}, { 'indent': '+1' }], // 들여쓰기, 내어쓰기
    [{ 'direction': 'rtl' }], // 텍스트 방향 (오른쪽에서 왼쪽)
    ['clean'] // 서식 제거
];

// Quill 에디터 초기화
var quill = new Quill('#editor', {
    theme: 'snow', // 'snow' 테마 사용
    placeholder: '여기에 내용을 입력하세요.', // 한국어 placeholder
    modules: {
        toolbar: toolbarOptions // 설정한 툴바 옵션을 사용
    }
});

// 'clean' 버튼 클릭 시 모든 콘텐츠 제거
document.querySelector('.ql-clean').addEventListener('click', function() {
    quill.setContents([]); // 모든 콘텐츠를 제거
});

// 사용자 정의 언어 (한국어) 설정
var koreanTranslations = {
    'bold': '굵게',
    'italic': '기울임',
    'underline': '밑줄',
    'strike': '취소선',
    'link': '링크',
    'image': '이미지',
    'video': '비디오',
    'clean': '서식 제거',
    'header': '헤더',
    'list': '목록',
    'ordered': '순서 있는 목록',
    'bullet': '순서 없는 목록',
    'blockquote': '인용문',
    'code-block': '코드 블럭',
    'script': '첨자',
    'sub': '아래 첨자',
    'super': '위 첨자',
    'indent': '들여쓰기',
    'direction': '텍스트 방향',

};

// 툴바 버튼의 텍스트를 한국어로 변경
var toolbarButtons = document.querySelectorAll('.ql-toolbar button');
toolbarButtons.forEach(button => {
    var format = button.classList[0].split('-')[1];
    if (koreanTranslations[format]) {
        button.title = koreanTranslations[format];
    }
});

// 드롭다운 메뉴의 텍스트를 한국어로 변경
var selectItems = document.querySelectorAll('.ql-toolbar select');
selectItems.forEach(select => {
    var format = select.classList[0].split('-')[1];
    if (koreanTranslations[format]) {
        select.title = koreanTranslations[format];
        Array.from(select.options).forEach(option => {
            if (koreanTranslations[option.value]) {
                option.text = koreanTranslations[option.value];
            }
        });
    }
});


// Quill 이벤트 리스너 추가
quill.on('text-change', function(delta, oldDelta, source) {
    console.log('Text change detected!');
    console.log(delta);
});
</script>






</body>
</html>