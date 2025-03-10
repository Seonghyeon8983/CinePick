<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CinePick</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
    body {
        font-family: 'Jua';
        background-color: #f0f0f0;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: 90vh;
    }

    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        flex: 1;
    }

    .movie-thumbnail-container {
        width: 1200px;
        height: 400px;
        background-color: #d9d9d9;
        border: 1px solid #838383;
        border-radius: 5px;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 10px;
        position: relative;
        overflow: hidden;
    }

    .movie-thumbnail-wrapper {
        display: flex;
        gap: 20px;
        overflow-x: auto;
        scroll-behavior: smooth;
        white-space: nowrap;
        width: 960px;
    }

    /* 개별 썸네일 */
    .movie-thumbnail {
        width: 200px;
        height: 300px;
        background-color: #f0f0f0;
        border: 1px solid #838383;
        border-radius: 5px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 10px;
        text-align: center;
        flex-shrink: 0;
    }

    .movie-thumbnail img {
        width: 150px;
        height: 220px;
        border-radius: 5px;
    }

    .movie-thumbnail-title {
    	width: 160px;
        font-weight: bold;
        font-size: 18pt;
        margin-top: 10px;
        white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
    }

	.btn-prev, .btn-next {
	    position: absolute;
	    top: 50%;
	    transform: translateY(-50%);
	    border: none;
	    background-color: rgba(0, 0, 0, 0.5);
	    color: white;
	    font-size: 24pt;
	    cursor: pointer;
	    width: 50px;
	    height: 50px;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    border-radius: 5px;
	    z-index: 10;
	}
	
	.btn-prev { 
		left: 10px; 
	}
	  
	.btn-next { 
		right: 10px; 
	}
	
	.btn-prev:hover, .btn-next:hover {
	    background-color: rgba(0, 0, 0, 0.7);
	}
	
	.containers_wrapper {
		width: 1230px;
        background-color: #f0f0f0;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
	}
	
	.vote-container, .recommand-container, .reservation-container {
        width: 400px;
        height: 300px;
        background-color: #d9d9d9;
        border: 1px solid #838383;
        border-radius: 5px;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 10px;
        position: relative;
        overflow: hidden;
	}

	.vote-container-wapper, 
	.recommand-container-wapper, 
	.reservation-container-wapper {
        width: 380px;
        height: 280px;
        background-color: #f0f0f0;
        border: 1px solid #838383;
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding: 10px;
        padding-left: 20px;
	}
	
	.vote-container-wapper .title, 
	.recommand-container-wapper .title{
        font-size: 20pt;
        white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	}
	
	.vote-container-wapper .btn-more, 
	.recommand-container-wapper .btn-more{
	    border: none;
	    background-color: rgba(0, 0, 0, 0);
	    color: #838383;
	    font-size: 20px;
	    cursor: pointer;
	    width: 100px;
	    height: 32px;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    border-radius: 5px;
	    margin-left: auto;
	}
	a {
        text-decoration: none;
        color: #f0f0f0;
    }
</style>
</head>
<body>
<%@ include file="./header.jsp" %> 

<div class="container">
    <div class="movie-thumbnail-container">
    <button class="btn-prev">&lt;</button>
    <div class="movie-thumbnail-wrapper">
        <c:forEach var="movie" items="${movieList}">
            <div class="movie-thumbnail" onclick="location.href='movieinfopage?id=${movie.movie_id}'">
                <img src="/images/${movie.title}.jpeg" onerror="this.onerror=null; this.src='/images/01.png';">
                <div class="movie-thumbnail-title">${movie.title}</div>
            </div>
        </c:forEach>
    </div>
    <button class="btn-next">&gt;</button>
</div>
</div>

<div class="containers_wrapper">
	<div class="vote-container">
		<div class="vote-container-wapper">
			<div class="title">영화 추천</div>
			<br>
			<c:if test="${fn:length(boardList) <= 4}">
			    <c:forEach var="board" items="${boardList}" varStatus="status">
			        <div class="title">
			            <a href="/postpage?id=${board.post_id}" style="text-decoration: none; color: inherit;">
			                [${board.movieTitle}] ${board.title}
			            </a>
			        </div>
			    </c:forEach>
			    
			    <c:forEach begin="${fn:length(boardList)}" end="3" varStatus="status">
			        <div class="title">&emsp;</div>
			    </c:forEach>
			</c:if>
			
			<c:if test="${fn:length(boardList) > 4}">
			    <c:forEach var="board" items="${boardList}" varStatus="status">
			        <c:if test="${status.index < 4}">
			            <div class="title">
			                <a href="/postpage?id=${board.post_id}" style="text-decoration: none; color: inherit;">
			                    [${board.movieTitle}] ${board.title}
			                </a>
			            </div>
			        </c:if>
			    </c:forEach>
			</c:if>

			<a href="/boardpage">
	        	<button type="button" class="btn-more">>> 더보기</button>
	    	</a>
		</div>
	</div>

	<div class="vote-container">
		<div class="vote-container-wapper">
			<div class="title">영화 투표</div>
			<br>
			
			<div class="title">
				<a href="/votemovie?id=1&movie1id=3&movie2id=4" style="text-decoration: none; color: inherit;">
					[미키 17] vs [콘클라베]
				</a>
			</div>
			
			<div class="title">
				<a href="/votemovie?id=2&movie1id=4&movie2id=5" style="text-decoration: none; color: inherit;">
					[콘클라베] vs [캡틴 아메리카 브레이브 뉴 월드]
				</a>
			</div>
			<div class="title">
				<a href="votemovie?id=3&movie1id=10&movie2id=7" style="text-decoration: none; color: inherit;">
					[백수아파트] vs [보더랜드]
				</a>
			</div>

			<div class="title">
				<a href="/votemovie?id=4&movie1id=6&movie2id=8" style="text-decoration: none; color: inherit;">
					[괜찮아 괜찮아...] vs [패딩턴 페루에 가다!]
				</a>
	    	</div>
			<a href="/votelist">
	        	<button type="button" class="btn-more">>> 더보기</button>
	    	</a>
		</div>
	</div>
	
	<div class="vote-container">
		<div class="vote-container-wapper">
			<div class="title">영화 예매</div>
			<br>
			<div class="title">&emsp;영화 선택</div>
			<div class="title">&emsp;영화관 선택</div>
			<div class="title">&emsp;상영시간 선택</div>
			<div class="title">&emsp;</div>
			<a href="/">
	        	<button type="button" class="btn-more"></button>
	    	</a>
		</div>
	</div>
</div>

<%@ include file="./footer.jsp" %>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const wrapper = document.querySelector(".movie-thumbnail-wrapper");
        const btnPrev = document.querySelector(".btn-prev");
        const btnNext = document.querySelector(".btn-next");

        // 좌우 버튼 클릭 시 이동 거리
        const scrollAmount = 220; 

        btnPrev.addEventListener("click", function() {
            wrapper.scrollBy({ left: -scrollAmount, behavior: "smooth" });
        });

        btnNext.addEventListener("click", function() {
            wrapper.scrollBy({ left: scrollAmount, behavior: "smooth" });
        });
    });
</script>

</body>
</html>
