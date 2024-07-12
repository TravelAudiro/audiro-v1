<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Post Details</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous" />
    
<c:url var="css" value="/css/bootstrap.css" />
<link href="${css}" rel="stylesheet">    
<style>


     .main-class {
            margin-top:100px;
            margin-left: 200px;
            margin-right: 200px;
        }

 
    
    .c-profile-image {
        width: 80px; /* 프로필 이미지의 크기 설정 */
        height: 80px;
        border-radius: 50%; /* 동그라미 형태를 만들기 위한 설정 */
        object-fit: cover; /* 이미지가 잘리지 않고 비율을 유지하도록 설정 */
    }
    
    .card-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    
    #p-profile-image {
        width: 50px; /* 프로필 이미지의 크기 설정 */
        height: 50px; 
        border-radius: 50%; /* 동그라미 형태를 만들기 위한 설정 */
        object-fit: cover; /* 이미지가 잘리지 않고 비율을 유지하도록 설정 */
        margin-left: 10px; 
        margin-right: 10px;" 
    }
    
    .label-time.text-center {
        text-align: center;
        font-size: 2.5em; /* 글자 크기 키우기 */
        display: block;
    }
    .like-btn {
        margin-right: 10px;
    }
    
    
    .label-title{
        width: 300%;
        text-align: center;
         font-size: 2.5em;
    }
    
    .favorite-btn {
            fill: #98FF98;
            transition: fill 0.3s;
        }

    .favorite-btn.clicked {
            fill: #3EB489;
        }
        
    #content {
        width: 100%;
        min-height: 500px;
        white-space: pre-line;
        margin-bottom: 20px;
        }
        
    .nickname-link {
        text-decoration: none; /* 링크 스타일 제거 */
        color: inherit; /* 글자 색상 상속 */
    }    
       
</style>
</head>
<body>
    <div class="container-fluid">
        <c:set var="pageTitle" value="Post Details" />
        <%@ include file="../fragments/header.jspf"%>

        <main>
            <div class="main-class mt-2 card">                
                    <input id="postId" name="postId" type="hidden" value="${post.postId}" /> 
                    <input type="hidden" id="id" value="${signedInUser}" />
                    <table class="table table-borderless">
                        <tbody>
                            <tr>
                                <td colspan="2"
                                    class="d-flex align-items-center justify-content-between">
                                    <label id="title" class="label-title">${post.title}</label> <!-- 후기 찜담기 버튼 (하트이미지 추후에 변경) -->
                                    <button class="btn favorite-btn" data-review-id="${post.postId}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
                                        <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1" />
                                    </svg>
                                    <label class="favoriteMe" for="like-btn-${post.postId}">${countFavorite}</label>
                                    </button>
                                    <!-- 좋아요버튼
                                    <button class="btn like-btn" data-review-id="${post.postId}" style="color: mint;">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
                                            <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2 2 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a10 10 0 0 0-.443.05 9.4 9.4 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a9 9 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.2 2.2 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.9.9 0 0 1-.121.416c-.165.288-.503.56-1.066.56z" />
                                        </svg>
                                        <label class="like-count" for="like-btn-${post.postId}">${countLike}</label>
                                    </button> -->
                                </td>
                                </tr>
                                <tr>
                                <td class="profile-container" colspan="2"
                                    style="display: flex; align-items: center; justify-content: space-between;">
                                    <div style="display: flex; align-items: center;">
                                        <img src="../../images/bagic_profile.png" alt="프로필 이미지" class="p-profile-image"
                                            id="p-profile-image" />
                                        <div>
										<a href="/audiro/post/review/mypage?id=${sessionScope.signedInUsersId}"
											class="nickname-link"> <span>${post.nickname}</span>
										</a> <br /> 
										<label for="modifiedTime" class="label-time"
                                                   style="margin-left: 2px; flex-shrink: 0; font-size: 0.8em;">
                                                   ${post.formattedModifiedTime} 
                                            </label>
                                        </div>
                                    </div>
                            
                                    <!-- 로그인한 경우 추가 기능 -->
                                    <c:if test="${!empty signedInUser}">
                                        <div>
                                            <div>
                                            <form class="reviewBtn" method="post">
                                            <input id="postId" name="postId" type="hidden" value="${post.postId}" />
                                                <!-- <button type="button" class="btn btn-danger" onclick="deletePost(${post.postId}, '${signedInUser}')">삭제</button> -->
                                                <button id="deletebtn" class="btn btn-outline-danger"
                                                    style="margin-left: auto;">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
                                                        <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47M8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/>
                                                    </svg>    
                                                </button>
                                                <button id="modifybtn" class="btn btn-outline-success">수정</button>
                                            </form>
                                            </div>
                                       </div>
                                    </c:if>        

                                </td>                
                            </tr>
                            <tr>
                                <td>
                                    <div id="content" class="form-control"
                                        style="white-space: pre-line; margin-bottom: 20px;">${post.content}</div>
                                </td>
                            </tr>
                        </tbody>
                    </table>

				<!-- 댓글창 -->
				<table class="table table-borderless" style="width: 100%;">
					<tbody>
						<tr>
							<td style="border: none; width: 85%;">
								<div style="display: flex; align-items: flex-end;">
									<!-- 프로필 db내용불러오기로 수정할 예정 -->
									<div style="margin-right: 10px; display: flex; flex-direction: column; align-items: center;">
									<img src="../../images/bagic_profile.png" alt="프로필 이미지"
										 class="p-profile-image" id="p-profile-image" />
									<div>${post.nickname}</div>
									</div>
									<textarea id="comment" class="form-control" rows="3"
										style="flex: 1; margin-right: 10px;"></textarea>
									<button id="registerCommmetnbtn" type="button"
										class="btn btn-dark" style="align-self: flex-end;"
										onClick="javascript:addReply();">댓글등록</button>
								</div>
							</td>
						</tr>
					</tbody>
				</table>

				<div id="commentList" class="mt-1">
                        <!-- 댓글목록리스트 -->
                    </div>
            </div>
        </main>
        
        <!-- 로그인유저저장 -->
       <script>var signedInUser = "${signedInUser}"; </script>

        <!-- Bootstrap의 JS 라이브러리 -->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

         <!-- Axios 라이브러리 포함 -->
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        
        <!-- reviewMypage.js -->
        <c:url var="detailsJS" value="/js/details.js" />
        <script src="${detailsJS}"></script>
    </div>
</body>
</html>