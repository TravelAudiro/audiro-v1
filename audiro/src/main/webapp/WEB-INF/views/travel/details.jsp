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
    <c:url var="travelDetailsCss" value="/css/travel-details.css" />
    <link href="${travelDetailsCss}" rel="stylesheet" />
    <c:url var="heartCss" value="/css/heart.css" />
    <link href="${heartCss}" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <header>
            <%@ include file="../fragments/header.jspf" %>
        </header>
        
        <main>
            <div class="card">
                <div class="card-header">
                    <span class="d-none" id="destination-id">${destination.travelDestinationId}</span>
                    <span>${destination.name}</span>
                    <c:url var="imgLike" value="/images/like_black.png" />
                    <img src="${imgLike}" class="img-like" alt="like" />
                </div>
                
                <div class="card-body">
                    <img src="${destination.imgUrl}" alt="${destination.name}">
                    <h5>상세정보</h5>
                    <p>${destination.description}</p>
                </div>
            
                <div class="card-footer">
                    <div id="map" latitude="${destination.latitude}" longitude="${destination.longitude}"></div>
                    <div class="row">
                        <div class="col-3">
                            <p>문의 및 안내</p>
                            <p>홈페이지</p>
                            <p>주소</p>
                        </div>
                        <div class="col-9">
                            <p>${destination.phone}</p>
                            <a href="${destination.site}">${destination.site}</a>
                            <p>${destination.address}</p>
                        </div>
                    </div>
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
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a100046aeeb3a25f545a7ba94f0e6c8"></script>
    
    <c:url var="travelDetailsJs" value="/js/travel-details.js" />
    <script src="${travelDetailsJs}"></script>
</body>
</html>