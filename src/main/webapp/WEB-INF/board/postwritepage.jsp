<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CinePick - 리뷰 작성</title>
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

        .post-container {
            width: 1200px;
            height: 700px;
            background-color: #d9d9d9;
            border: 1px solid #838383;
            border-radius: 5px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 10px;
        }

        .post-line {
            width: 900px;
            height: 5px;
            background-color: #f0f0f0;
            margin: 20px;
        }

        .post-title {
            width: 800px;
            height: 60px;
            background-color: #f0f0f0;
            border-radius: 10px;
            padding-left: 20px;
            border: none;
            font-size: 24px;
            outline: none;
            resize: none;
            text-align: left;
            line-height: 60px;
        }

        .post-content-container {
            width: 800px;
            height: 400px;
            background-color: #d9d9d9;
            border-radius: 10px;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            margin: 20px;
        }

        .post-content-poster-wrapper {
            width: 280px;
            height: 400px;
            background-color: #f0f0f0;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin: 10px;
        }

        .post-content-poster-wrapper img {
            width: 168px;
            height: 240px;
        }

        .post-content-poster-title {
            font-weight: bold;
            font-size: 24px;
            margin-top: 20px;
        }

        .post-content {
            width: 500px;
            height: 400px;
            background-color: #f0f0f0;
            border-radius: 10px;
            padding: 20px;
            border: none;
            font-size: 18px;
            outline: none;
            margin: 10px;
            resize: none;
        }

        .btn-container {
            width: 800px;
            display: flex;
            justify-content: flex-end;
        }

        .btn-container button {
            width: 100px;
            height: 36px;
            border: none;
            border-radius: 10px;
            margin-left: 10px;
            cursor: pointer;
        }

        .search-container {
            width: 250px;
            margin-top: 20px;
            position: relative;
        }

        .search-container input {
            width: 100%;
            height: 30px;
            background-color: #f0f0f0;
            border: none;
            border-bottom: 4px solid #fff;
            padding: 5px;
            font-weight: bold;
            font-size: 24px;
            outline: none;
        }

        .search-results {
            position: absolute;
            width: 100%;
            background: white;
            border: 1px solid #838383;
            border-radius: 5px;
            display: none;
            z-index: 10;
        }

        .search-results div {
            padding: 5px;
            cursor: pointer;
        }

        .search-results div:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
<%@ include file="../main/header.jsp" %>

<c:set var="userId" value="${sessionScope.userId}" />

<div class="post-container">
    <div class="post-line"></div>

    <form id="reviewForm" action="/boardpage/insert" method="post">
	    <input type="hidden" name="userId" value="${userId}">
	    <input type="hidden" name="movieId" id="movieId" value="">
	    
	    <textarea class="post-title" name="title" placeholder="제목을 입력하세요." required></textarea>
	
	    <div class="post-content-container">
	        <div class="post-content-poster-wrapper">
	            <img id="moviePoster" src="/images/01.png" alt="영화 포스터">
	            <div class="search-container">
	                <input type="text" id="movieSearch" placeholder="영화 제목 검색" autocomplete="off">
	                <div class="search-results" id="searchResults"></div>
	            </div>
	        </div>
	        <textarea class="post-content" name="content" placeholder="내용을 입력하세요." required></textarea>
	    </div>
	
	    <div class="btn-container">
	        <button type="button" onclick="cancelReview()">취소</button>
	        <button type="submit" onclick="return validateForm()">작성</button>
	    </div>
	</form>


    <div class="post-line"></div>
</div>

<%@ include file="../main/footer.jsp" %>

<script>
function cancelReview() {
    if (confirm("작성을 취소하시겠습니까?")) {
        location.href = '/boardpage';
    }
}

function validateForm() {
    const title = document.querySelector('textarea[name="title"]').value;
    const content = document.querySelector('textarea[name="content"]').value;
    const movieTitle = document.querySelector('#movieSearch').value;
	const movieId = 3;
		
    if (!title || !content || !movieId) {
        alert("모든 필드를 입력해주세요.");
        return false;
    }

    return true;
}

$('#movieSearch').on('blur', function() {
    var query = $(this).val();

    if (query.length < 2) {
        alert("2글자 이상 입력해주세요.");
        return;
    }

    var moviePosterPath = '/images/' + query + '.jpeg';
    $('#moviePoster').attr('src', moviePosterPath);

});
</script>

</body>
</html>
