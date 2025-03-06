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
	    height: 5px; /* 세로 길이 조절 */
	    background-color: #f0f0f0; /* 선 색상 */
	    margin: 20px; /* 좌우 여백 */
	}
	
	.post-title {
        width: 800px;
        height: 60px;
        background-color: #f0f0f0;
        border-radius: 10px;
        padding-left: 20px;
        border: none;
        font-size: 32px;
        outline: none;
        resize: none;
        text-align: left; /* 텍스트를 왼쪽으로 정렬 */
    	line-height: 60px; /* 텍스트가 수직 중앙에 오도록 설정 */
	}
	
	.post-content-contianer {
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
	
	.post-content-poster-wapper {
        width: 240px;
        height: 400px;
        background-color: #f0f0f0;
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin: 10px;
	}
	
	.post-content-poster-wapper img {
        width: 168px;
        height: 240px;
	}
	
	.post-content-poster-title {
        font-weight: bold;
        font-size: 24px;
        margin-top: 40px;
	}
	
	.post-content {
        width: 800px;
        height: 400px;
        background-color: #f0f0f0;
        border-radius: 10px;
        padding: 20px;
        border: none;
        font-size: 32px;
        outline: none;
        margin: 10px;
        resize: none;
	}
</style>
</head>
<body>
<%@ include file="../main/header.jsp" %> 

<div class="post-container">
	<div class="post-line"></div>
	
	<textarea class="post-title"></textarea>

	<div class="post-content-contianer">
		<div class="post-content-poster-wapper">
			<img src="images/01.png">
			<div class="post-content-poster-title">[영화제목] </div>
		</div>
		<textarea class="post-content"></textarea>
	</div>
	
	<div class="post-line"></div>
</div>

<%@ include file="../main/footer.jsp" %>

</body>
</html>
