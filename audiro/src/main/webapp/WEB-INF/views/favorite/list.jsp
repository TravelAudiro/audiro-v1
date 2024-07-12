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
    
<c:url var="favoriteListCss" value="/css/favorite_list.css" />
<link href="${favoriteListCss}" rel="stylesheet" />
 
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
                                <a class="nav-link ${activeTab == '#tab-destination' ? 'active' : ''}" data-bs-toggle="tab" href="#tab-destination">여행지</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link ${activeTab == '#tab-users' ? 'active' : ''}" data-bs-toggle="tab" href="#tab-users">관심유저</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link ${activeTab == '#tab-post' ? 'active' : ''}" data-bs-toggle="tab" href="#tab-post">여행후기</a>
                            </li>
                        </ul>
                        
                        <!-- Sort Options -->
						<div id="sort-container" class="mt-3">
						    <select id="sort-select" onchange="sortFavorites()">
						        <option value="created_time" ${currentSort == 'created_time' ? 'selected' : ''}>최근 ♥순</option>
						        <option value="name" ${currentSort == 'name' ? 'selected' : ''}>이름순</option>
						    </select>
						</div>
                        
                        <!--Tab panes -->
                        <div class="tab-content">
                            <div id="tab-destination" class="tab-pane fade ${activeTab == '#tab-destination' ? 'show active' : ''}">
                                <div id="favorite-list">
						            <c:forEach items="${favoriteDestination}" var="destination">
						                <c:if test="${destination.usersId == sessionScope.signedInUsersId}">
						                    <div class="favorite-list-container card">
						                        <img src="${destination.imgUrl}" alt="${destination.favoriteDestination}" />
						                        <div class="title-like-container">
	                                                 <h5 class="card-title">${destination.favoriteDestination}</h5>
	                                                 <c:url var="like" value="/images/like_black.png" />
	                                                 <p class="like" onclick="toggleLike(this)" data-type="destination" data-id="${destination.destinationId}">
	                                                 	<img src="${like}" alt="like"></p>
	                                                 
                                                </div>
						                    </div>
						                </c:if>
						            </c:forEach>
						        </div>
                            </div>
                            <div id="tab-users" class="tab-pane fade ${activeTab == '#tab-users' ? 'show active' : ''}">
                                <div id="favorite-list">
						            <c:forEach items="${favoriteUsers}" var="user">
						                <c:if test="${user.usersId == sessionScope.signedInUsersId}">
						                    <div class="favorite-list-container card">   
						                        <div class="title-like-container">
	                                                 <h5 class="card-title">${user.interestedUserNickname}</h5>
	                                                 <c:url var="like" value="/images/like_black.png" />
	                                                 <p class="like" onclick="toggleLike(this)" data-type="user" data-id="${user.interestedUserId}" >
	                                                 	<img src="${like}" alt="like"></p>
                                                </div>
						                    </div>
						                </c:if>
						            </c:forEach>
						        </div>
                            </div>
                            <div id="tab-post" class="tab-pane fade ${activeTab == '#tab-post' ? 'show active' : ''}">
                                <div id="favorite-list">
						            <c:forEach items="${favoritePost}" var="post">
						                <c:if test="${post.usersId == sessionScope.signedInUsersId}">
						                    <div class="favorite-list-container card"> 
						                        <div class="title-like-container">
	                                                 <h5 class="card-title">${post.favoritePostTitle}</h5>
	                                                 <c:url var="like" value="/images/like_black.png" />
	                                                 <p class="like" onclick="toggleLike(this)" data-type="post" data-id="${post.postId}">
	                                                 	<img src="${like}" alt="like"></p>
                                                </div>
						                    </div>
						                </c:if>
						            </c:forEach>
						        </div>
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
	
	<!-- <script>
		window.embeddedChatbotConfig = {
		chatbotId: "pgf573bMUX-3poQ0E4AMT",
		domain: "www.chatbase.co"
		}
	</script>
	
	<script
		src="https://www.chatbase.co/embed.min.js"
		chatbotId="pgf573bMUX-3poQ0E4AMT"
		domain="www.chatbase.co"
		defer>
	</script>
	-->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous">
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    
    <script>
	const signedInUser = `${signedInUser}`;
	</script>
	<c:url var="favoriteListJS" value="/js/favorite_list.js" />
	<script src="${favoriteListJS}"></script>
        
   
</body>
</html>