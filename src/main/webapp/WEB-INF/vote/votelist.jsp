<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CinePick - 영화 투표</title>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
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
        .main-container {
	        width: 1200px;
	        height: 700px;
	        background-color: #d9d9d9;
	        border: 1px solid #838383;
	        border-radius: 5px;
	        display: flex;
	        flex-direction: column;
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
        .container-line {
		    width: 4px;
		    height: 540px;
		    background-color: #f0f0f0;
		    margin: 0 10px;
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
        .content-container {
        	width: 1000px;	
        	height: 600px;
            display: flex;
        }
        .vote-title {
        	display: flex;
        	flex-direction: row;
        	justify-content: space-between;
        }
        .vote-title button {
        	height: 40px;
        }
        
        .vote-section {
            flex: 1;
            padding: 20px;
            background-color: #f0f0f0;
            border-radius: 10px;
            margin: 10px;
        }
        .vote-item {
            background-color: #f9f9f9;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 5px;
        }
        h2 {
            margin-top: 0;
        }
        .new-vote-button-container {
            text-align: right;
            padding: 10px;
        }
        .movie-image {
            max-width: 100px;
            max-height: 150px;
            margin-top: 10px;
        }
        a:link, a:visited {
			color: black;
			text-decoration: none;
		}
		a:hover {
			color: hotpink;
		}
    </style>
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <%@ include file="../main/header.jsp" %> 

    <div class="main-container">
        <!-- 검색 섹션 -->
        <div class="btn-container">
	    	<input class="search-container" placeholder="검색" />
		</div>
        

        <div id="pollList"></div>
        
        <!-- 콘텐츠 섹션 -->
        <div class="content-container">
            <!-- 박스오피스 기반 투표 목록 -->
            <div class="vote-section">
                <h2>박스오피스 투표</h2>
                <div id="boxOfficePolls"></div> <!-- 여기에 API에서 받아온 박스오피스 투표가 출력됩니다 -->
            </div>
            <!-- 사용자 개인 투표 목록 -->
            <div class="vote-section">
            <div class="vote-title">
                <h2>사용자 개인 투표 목록</h2>
		    <!-- "새로운 투표 만들기" 버튼 -->
				<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#newVoteModal">
	            	새로운 투표
	            </button>
            </div>
                <div id="userPolls"></div> <!-- 여기에 사용자 개인 투표 목록이 출력됩니다 -->

                
            </div>
        </div>
        
        
        <div class="modal fade" id="newVoteModal" tabindex="-1" aria-labelledby="newVoteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="newVoteModalLabel">새로운 영화 투표 만들기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- 영화 선택 드롭다운 -->
                    <div class="mb-3">
                        <label for="movie1" class="form-label">영화 1</label>
                        <select id="movie1" class="form-select">
                            <option value="">영화를 선택하세요</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="movie2" class="form-label">영화 2</label>
                        <select id="movie2" class="form-select">
                            <option value="">영화를 선택하세요</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button type="button" id="createVoteButton" class="btn btn-primary">투표 만들기</button>
                </div>
            </div>
        </div>
    </div>
        
        
        

        <script>
            $(document).ready(function() {
                // API 요청하여 데이터 가져오기
                $.ajax({
                    url: './api/comparison-polls', // 실제 API URL로 교체
                    type: 'GET',
                    dataType: 'json',
                    success: function(data) {
                        // 받은 데이터로 pollList 동적으로 채우기
                        var boxOfficePollsHtml = '<ul class="list-group">';
                        var userPollsHtml = '<ul class="list-group">';

                        // 받은 데이터를 boxOfficePolls에 출력
                        $.each(data, function(index, poll) {
                            // 'poll.id'를 이용해 각 항목에 링크 추가
                            if (index < 3) { // 3개까지는 박스오피스 투표
                                boxOfficePollsHtml += '<li class="list-group-item"><a href="/votemovie?id=' + poll.poll_id +'&movie1id='+poll.movie_1_id+'&movie2id='+poll.movie_2_id+ '">' + poll.pollName + '</a></li>';
                            } else { // 4번째부터는 사용자 개인 투표 목록에 추가
                                userPollsHtml += '<li class="list-group-item"><a href="/votemovie?id=' + poll.poll_id +'&movie1id='+poll.movie_1_id+'&movie2id='+poll.movie_2_id+ '">' + poll.pollName + '</a></li>';
                            }
                        });

                        // 박스오피스 투표와 사용자 개인 투표 목록을 각각 html에 추가
                        boxOfficePollsHtml += '</ul>';
                        userPollsHtml += '</ul>';

                        // #boxOfficePolls 영역에 리스트 추가
                        $('#boxOfficePolls').html(boxOfficePollsHtml);
                        $('#userPolls').html(userPollsHtml);
                    },
                    error: function(xhr, status, error) {
                        console.error('AJAX 요청 실패:', status, error);
                    }
                });
            });
            
            
            $(document).ready(function() {
                // 영화 목록을 API에서 받아옴
                $.ajax({
                    url: './api/get-movie-list', // 실제 영화 목록을 가져오는 API URL로 교체
                    type: 'GET',
                    dataType: 'json',
                    success: function(data) {
                        // 영화 목록을 드롭다운에 추가
                        var movie1Select = $('#movie1');
                        var movie2Select = $('#movie2');

                        $.each(data, function(index, movie) {
                            movie1Select.append('<option value="' + movie.movie_id + '">' + movie.title + '</option>');
                            movie2Select.append('<option value="' + movie.movie_id + '">' + movie.title + '</option>');
                        });
                    },
                    error: function(xhr, status, error) {
                        console.error('영화 목록 가져오기 실패:', status, error);
                    }
                });

                // 새로운 투표 만들기 버튼 클릭 시 투표 생성
                $('#createVoteButton').click(function() {
                    var movie1Id = $('#movie1').val();
                    var movie2Id = $('#movie2').val();

                    // 두 영화가 모두 선택되지 않은 경우
                    if (!movie1Id || !movie2Id) {
                        alert('두 영화를 모두 선택해야 합니다!');
                        return;
                    }

                    // 투표 생성 요청
                    $.ajax({
                        url: './api/create-poll', // 실제 투표 생성 API URL로 교체
                        type: 'POST',
                        dataType: "text",
                        data: {
                            "movie1Id": movie1Id,
                            "movie2Id": movie2Id
                        },
                        success: function(response) {
                            alert('투표가 성공적으로 생성되었습니다!');
                            $('#newVoteModal').modal('hide');
                            // 투표 목록을 갱신하는 등의 추가 작업을 여기에 추가할 수 있습니다.
                        },
                        error: function(xhr, status, error) {
                            console.error('투표 생성 실패:', status, error);
                        }
                    });
                });
            });
        </script>
    </div>
    <%@ include file="../main/footer.jsp" %> 
</body>
</html>