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
        height: 5px;
        background-color: #f0f0f0;
        margin: 20px;
    }

    .post-title {
        width: 800px;
        height: 60px;
        border-bottom: 5px solid #f0f0f0;
        padding-left: 20px;
        font-size: 32px;
        text-align: left;
    }

    .post-content-container {
        width: 800px;
        height: 400px;
        background-color: #d9d9d9;
        border-radius: 10px;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 20px;
    }

    .post-content-poster-wrapper {
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

    .post-content-poster-wrapper img {
        width: 168px;
        height: 240px;
    }

    .post-content-poster-title {
        font-weight: bold;
        font-size: 24px;
        margin-top: 40px;
    }

    .post-content {
        width: 500px;
        height: 400px;
        background-color: #f0f0f0;
        border-radius: 10px;
        padding: 20px;
        font-size: 24px;
        margin: 10px;
        resize: none;
        border: none;
        outline: none;
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
</style>
</head>
<body>

<%@ include file="../main/header.jsp" %> 

<div class="post-container">
    <div class="post-line"></div>

    <div class="post-title">${post.title}</div>

    <div class="post-content-container">
        <div class="post-content-poster-wrapper">
            <img src="/images/${post.movieTitle}.jpeg" onerror="this.onerror=null; this.src='/images/01.png';">
            <div class="post-content-poster-title">${post.movieTitle}</div>
        </div>
        <div class="post-content">${post.content}</div>
    </div>

    <div class="btn-container">
        <a href="/boardpage">
            <button type="button">목록으로</button>
        </a>
    </div>

    <div class="post-line"></div>
</div>

<%@ include file="../main/footer.jsp" %>

</body>
</html>
