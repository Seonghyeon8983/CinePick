<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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

    /* 썸네일 전체 컨테이너 */
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
        position: relative; /* 버튼 위치 고정 */
        overflow: hidden; /* 넘치는 썸네일 숨김 */
    }

    /* 썸네일들을 감싸는 래퍼 */
    .movie-thumbnail-wrapper {
        display: flex;
        gap: 20px;
        overflow-x: auto;
        scroll-behavior: smooth;
        white-space: nowrap;
        width: 960px; /* 컨테이너 크기에 맞춤 */
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
        flex-shrink: 0; /* 크기 유지 */
    }

    .movie-thumbnail img {
        width: 150px;
        height: 220px;
        border-radius: 5px;
    }

    .movie-thumbnail-title {
        font-weight: bold;
        font-size: 18pt;
        margin-top: 10px;
    }

    /* 좌우 버튼 */
	.btn-prev, .btn-next {
	    position: absolute;
	    top: 50%;
	    transform: translateY(-50%);
	    border: none;
	    background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
	    color: white;
	    font-size: 24pt;
	    cursor: pointer;
	    width: 50px;
	    height: 50px;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    border-radius: 5px;
	    z-index: 10; /* 썸네일 위로 */
	}
	
	/* 버튼 위치 조정 (컨테이너 내부로 조정) */
	.btn-prev { left: 10px; }  
	.btn-next { right: 10px; }
	
	.btn-prev:hover, .btn-next:hover {
	    background-color: rgba(0, 0, 0, 0.7);
	}
	
	.containers_wrapper {
        background-color: #f0f0f0;
        display: flex;
        flex-direction: row;
        justify-content: center;
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
        position: relative; /* 버튼 위치 고정 */
        overflow: hidden; /* 넘치는 썸네일 숨김 */
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
	}
	
	.vote-container-wapper .btn-more, 
	.recommand-container-wapper .btn-more{
	    border: none;
	    background-color: rgba(0, 0, 0, 0); /* 반투명 배경 */
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
</style>
</head>
<body>
<%@ include file="./header.jsp" %> 

<div class="container">
    <div class="movie-thumbnail-container">
        <button class="btn-prev">&lt;</button>
        <div class="movie-thumbnail-wrapper">
            <div class="movie-thumbnail">
                <img src="images/01.png">
                <div class="movie-thumbnail-title">Movie 1</div>
            </div>
            <div class="movie-thumbnail">
                <img src="images/02.png">
                <div class="movie-thumbnail-title">Movie 2</div>
            </div>
            <div class="movie-thumbnail">
                <img src="images/03.png">
                <div class="movie-thumbnail-title">Movie 3</div>
            </div>
            <div class="movie-thumbnail">
                <img src="images/04.png">
                <div class="movie-thumbnail-title">Movie 4</div>
            </div>
            <div class="movie-thumbnail">
                <img src="images/05.png">
                <div class="movie-thumbnail-title">Movie 5</div>
            </div>
            <div class="movie-thumbnail">
                <img src="images/06.png">
                <div class="movie-thumbnail-title">Movie 6</div>
            </div>
        </div>
        <button class="btn-next">&gt;</button>
    </div>
</div>

<div class="containers_wrapper">
	<div class="vote-container">
		<div class="vote-container-wapper">
			<div class="title">aaa</div>
			<div class="title">aaa</div>
			<div class="title">aaa</div>
			<div class="title">aaa</div>
			<div class="title">aaa</div>
			<button class="btn-more">>> 더보기</button>
		</div>
	</div>

	<div class="recommand-container">
		<div class="recommand-container-wapper">
			<div class="title">aaa</div>
			<div class="title">aaa</div>
			<div class="title">aaa</div>
			<div class="title">aaa</div>
			<div class="title">aaa</div>
			<button class="btn-more">>> 더보기</button>
		</div>
	</div>
	
	<div class="vote-container">
		<div class="vote-container-wapper">
			<div class="title">aaa</div>
			<div class="title">aaa</div>
			<div class="title">aaa</div>
			<div class="title">aaa</div>
			<div class="title">aaa</div>
			<button class="btn-more">>> 더보기</button>
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
