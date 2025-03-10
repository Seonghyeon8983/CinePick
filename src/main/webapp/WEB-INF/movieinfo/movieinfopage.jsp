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
        height: 90vh;
    }

	.movie-info-container {
		width: 1200px;
		height: 700px;
        background-color: #d9d9d9;
        border: 1px solid #838383;
        border-radius: 5px;
		display: flex;
		flex-direction: row;
        justify-content: center;
        align-items: center;
	}
	
	.movie-info-container img {
        width: 315px;
        height: 450px;
        border-radius: 10px;
       	margin-right: 20px
	}
	
	.movie-info-wapper {
		width: 420px;
		height: 600px;
        display: flex;
        flex-direction: column;
	}
	
	.movie-info-review-wapper{
		width: 360px;
		height: 600px;
	} 
	
	.movie-info-text-wapper2, .movie-info-text-wapper3 {
		width: 420px;
		height: 600px;
	}
	
	.movie-info-text-wapper2 {
	    overflow-y: auto;
	    overflow-x: hidden;
	}
	
	.movie-review-text-wapper {
		margin-top: 10px;
	    overflow-y: auto;
	    overflow-x: hidden;
	}
	
	.movie-info-text-wapper {
		width: 400px;
        display: flex;
        flex-direction: row;
        margin-left: 10px;
	}
	
	.movie-info-title-korean  {
        font-weight: bold;
        font-size: 40px;
        margin: 0;
	}
	
	.movie-info-title-english {
        font-weight: bold;
        font-size: 16px;
        color: #424242;
        margin-left: 10px;
	}
	
	.movie-info-subtitle {
        font-weight: bold;
        font-size: 28px;
	}
	
	.movie-info-text {
        font-weight: bold;
        font-size: 20px;
	}
	
	.movie-info-category {
        font-weight: bold;
        color: #838383;
        font-size: 20px;
        white-space: nowrap;
	}
	
	.movie-info-line {
	    width: 4px;
	    height: 600px;
	    background-color: #f0f0f0;
	    margin: 0 10px;
	}
	
</style>
</head>
<body>
<%@ include file="../main/header.jsp" %> 

<div class="movie-info-container">
	<img src="/images/${movie.title}.jpeg" onerror="this.onerror=null; this.src='/images/01.png';">
	
	<div class="movie-info-wapper">
		<div class="movie-info-title-korean">${movie.title}</div>
		
		<br>
		
		<div class="movie-info-text-wapper">
			<div class="movie-info-category">감독&emsp;&emsp;</div>
			<div class="movie-info-text">${movie.director}</div>
		</div>
		<div class="movie-info-text-wapper">
			<div class="movie-info-category">배우&emsp;&emsp;</div>
			<div class="movie-info-text">${movie.cast}</div>
		</div>
		<div class="movie-info-text-wapper">
			<div class="movie-info-category">개봉&emsp;&emsp;</div>
			<div class="movie-info-text"><fmt:formatDate value="${movie.release_date}" pattern="yyyy.MM.dd" /></div>
		</div>
		<div class="movie-info-text-wapper">
			<div class="movie-info-category">장르&emsp;&emsp;</div>
			<div class="movie-info-text">${movie.genre}</div>
		</div>
		<div class="movie-info-text-wapper">
			<div class="movie-info-category">러닝타임&nbsp;</div>
			<div class="movie-info-text">${movie.duration}분</div>
		</div>
		<br>
		<div class="movie-info-subtitle">영화 소개</div>
		<div class="movie-info-text-wapper2">
			<div class="movie-info-text">${movie.description}</div>
		</div>
	</div>

	
	<div class="movie-info-line"></div>

	<div class="movie-info-review-wapper">
		<div class="movie-info-subtitle">리뷰</div>
		<div class="movie-review-text-wapper">> 로버튼 패티슨의 1인 2역은 신의 한수다. 호불호는 갈릴 지언정 극장에서 봐야하는 작품이다. 패티슨도 남우조연상 받아야 하는거 아님?</div>
		<div class="movie-review-text-wapper">> 생각치 못한 슬픔과 감동이 공존한 영화. 2시간이 너무 재미있게 지나갔다.</div>
		<div class="movie-review-text-wapper">> 아 너무 기대를 많이 했나ㅠ그냥저냥 쏘쏘,,,크리퍼 콩벌레 닮음 보다보니 쫌 귀여워보임,,</div>
		<div class="movie-review-text-wapper">> 평이 이리 갈릴줄이야? 그간 작품들에 비해 좀 가볍게 느껴지지만 적절한 풍자와 연출로 재미있게 봤습니다. 마구 악플 다시는 분들은 진짜 제대로 보긴 본건지 그간 영화도 보고 평 다는지 모르겠네요. 그간 영화 보다 가볍게 보이지만 생각 거리는 그것 이상입니다.</div>
		<div class="movie-review-text-wapper">> 보면서 누군가가 자꾸 떠올라 묘하게 열받습니다 아마 다른 나라 사람들도 그럴겁니다 기생충처럼 전세계 사람들이 공감대를 이룰 영화..</div>
	</div>
</div>


<%@ include file="../main/footer.jsp" %>

</body>
</html>
