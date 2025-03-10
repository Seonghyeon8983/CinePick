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

    .board-container {
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

    .search-container {
        width: 900px;
        height: 60px;
        background-color: #f0f0f0;
        border-radius: 10px;
        padding: 10px;
        border: none;
        font-size: 32px;
        outline: none;
        margin-bottom: 30px;
        margin-top: 20px;
    }

    .board-post-list-container {
        width: 840px;
        height: 560px;
        border-radius: 10px;
        padding: 10px;
        display: flex;
        flex-direction: column;
        overflow-y: auto; /* Enable vertical scroll */
        scrollbar-width: none;
    }

    .board-post-title-wrapper {
    	border: none;
        border-bottom: 2px solid #f0f0f0;
        display: flex;
        flex-direction: column;
    }

    .board-post-title {
        font-weight: bold;
        font-size: 20px;
    }

    .board-post-title-header {
        font-weight: bold;
        font-size: 28px;
        color: #383838;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    
	.btn-container {
		width: 800px;
		display: flex;
    	justify-content: flex-end;
	}
	
	.btn-container button {
		width: 100px;
		height: 60px;
		border: none;
		border-radius: 10px;
		margin-left: 10px;
		cursor: pointer;
	}
</style>
</head>
<body>
<%@ include file="../main/header.jsp" %> 

<div class="board-container">
	<div class="btn-container">
    	<input class="search-container" placeholder="검색" />
	    <a href="/postwritepage">
	        <button type="button">글쓰기</button>
	    </a>
	</div>
    
    <div class="board-post-list-container">
        <c:forEach var="board" items="${boardList}">
            <div class="board-post-title-wrapper">
                <div class="board-post-title-header">
                    <a href="/postpage?id=${board.post_id}" style="text-decoration: none; color: inherit;">
                        [${board.movieTitle}]
                    </a>
                </div>
                <div class="board-post-title">
                	<a href="/postpage?id=${board.post_id}" style="text-decoration: none; color: inherit;">
                        ${board.title}
                    </a>
                 </div>
            </div>
        </c:forEach>
    </div>

</div>

<%@ include file="../main/footer.jsp" %>

</body>
</html>
