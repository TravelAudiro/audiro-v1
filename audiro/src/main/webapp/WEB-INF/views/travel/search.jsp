<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri = "jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous" />
    <c:url var="travelSearchCss" value="/css/travel-search.css" />
    <link href="${travelSearchCss}" rel="stylesheet" />
    <c:url var="heartCss" value="/css/heart.css" />
    <link href="${heartCss}" rel="stylesheet" />
</head>
<body>

    <div class="container">
        <header>
            <%@ include file="../fragments/header.jspf" %>
        </header>
        
        <main> 
            <div class="row">
                <div class="col-2">
                    <div>
                        <p>지역</p>
                        <button class="badge text-bg-light"># 서울</button>
                        <button class="badge text-bg-light"># 부산</button>
                        <button class="badge text-bg-light"># 대구</button>
                        <button class="badge text-bg-light"># 인천</button>
                        <button class="badge text-bg-light"># 광주</button>
                        <button class="badge text-bg-light"># 대전</button>
                        <button class="badge text-bg-light"># 울산</button>
                        <button class="badge text-bg-light"># 세종</button>
                        <button class="badge text-bg-light"># 경기</button>
                        <button class="badge text-bg-light"># 강원</button>
                        <button class="badge text-bg-light"># 충북</button>
                        <button class="badge text-bg-light"># 충남</button>
                        <button class="badge text-bg-light"># 경북</button>
                        <button class="badge text-bg-light"># 경남</button>
                        <button class="badge text-bg-light"># 전북</button>
                        <button class="badge text-bg-light"># 전남</button>
                        <button class="badge text-bg-light"># 제주</button>
                    </div>
                    <div>
                        <p>테마</p>
                        <button class="badge text-bg-light"># 힐링</button>
                        <button class="badge text-bg-light"># 액티비티</button>
                        <button class="badge text-bg-light"># 문화</button>
                        <button class="badge text-bg-light"># 체험</button>
                    </div>
                    <div>
                        <p>동행자</p>
                        <button class="badge text-bg-light"># 가족</button>
                        <button class="badge text-bg-light"># 친구</button>
                        <button class="badge text-bg-light"># 연인</button>
                        <button class="badge text-bg-light"># 혼자</button>
                        <button class="badge text-bg-light"># 반려동물</button>
                    </div>
                </div>
                
                <div class="col-10">
                    <div class="row">
                        <div class="col-10">
                            <input type="text" id="inputSearch" class="form-control" />
                        </div>
                        <div class="col-2">
                            <button class="form-control btn btn-success" id="btnSearch">검색</button>
                        </div>
                    </div>
                    
                    <div id="tagContainer"></div>
                    
                    <div id="cardContainer">
                        <div class="row">
                        </div>
                    </div>
                    
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center" id="pagination">
                        </ul>
                    </nav>
                </div>
            </div>
            
            <div id="heart-animation">
                <c:url var="imgHeart" value="../images/heart.png" />
                <img src="${imgHeart}" alt="heart" class="heart" />
            </div>
        </main>
        
        <footer>
            <%@ include file="../fragments/footer.jspf" %>
        </footer>
    </div>
    
    <script>
        const signedInUser = `${signedInUser}`;
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    
    <c:url var="SearchJs" value="/js/travel-search.js" />
    <script src="${SearchJs}"></script>
</body>
</html>