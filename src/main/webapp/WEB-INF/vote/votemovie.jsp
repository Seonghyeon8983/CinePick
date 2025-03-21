<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Voting</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Jua';
        background-color: #f0f0f0;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        height: 85vh;
    }
.main-container {
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

.content-container {
	display: flex;
	justify-content: space-between;
	padding: 20px;
}

.movies-container, .vote-container {
	flex: 1;
	padding: 20px;
	background-color: #f0f0f0;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin-left: 10px;
	margin-right: 10px;
}

.movie-info {
	display: flex;
	margin-bottom: 20px;
	padding: 10px;
	border: 1px solid #eee;
	border-radius: 5px;
}

.movie-details {
	margin-left: 20px;
}

img {
	width: 150px;
	height: auto;
}

#vote-form {
	display: flex;
	flex-direction: column;
}

.vote-option {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 10px;
}

.vote-option input[type="radio"] {
	margin-right: 10px;
}

button {
	padding: 10px;
	background-color: #828282;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#view-results {
	width: 200px;
	margin-bottom: 5%;
	background-color: #828282;
	width: 100%;
}

.vote-button {
	display: flex;
	justify-content: flex-end;
	margin-top: 10px;
}

.chart-container {
	width: 100%;
	max-width: 400px;
	height:500px;
	margin: auto;
}

#vote-chart {
	width: 100%;
	height: 400px;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>





</head>
<body>

<script>
    // JSP에서 전달된 투표 수 데이터를 JavaScript 변수로 설정
    var movieTitles = ["${movie1.title}", "${movie2.title}"];
    var voteCounts = [${movie1Votes}, ${movie2Votes}];

    console.log("Movie Titles: ", movieTitles);  // movieTitles 값 출력
    console.log("Vote Counts: ", voteCounts);    // voteCounts 값 출력
    
    
    

    window.addEventListener('DOMContentLoaded', function() {
        // JSP에서 전달된 영화 제목과 투표수를 JavaScript 변수로 설정
        var movieTitles = ["${movie1.title}", "${movie2.title}"];
        var voteCounts = [${movie1Votes}, ${movie2Votes}];
        
        // 차트 컨텍스트 가져오기
        const ctx = document.getElementById('vote-chart');
        if (ctx) {
            // Pie 차트 생성
            var myChart = new Chart(ctx, {
                type: 'pie',  // 차트 종류 'pie'로 설정
                data: {
                    labels: movieTitles,  // 영화 제목을 라벨로 설정
                    datasets: [{
                        data: voteCounts,  // 각 영화의 투표 수
                        backgroundColor: ['#FF6384', '#36A2EB'], // 각각의 색상 설정
                    }]
                },
                options: {
                    responsive: true,  // 반응형 설정
                    maintainAspectRatio: false,  // 비율 유지하지 않기
                    plugins: {
                        title: { 
                            display: true,  // 제목 표시
                            text: '영화 투표 결과'  // 제목 텍스트 설정
                        },
                        tooltip: {
                            callbacks: {
                                // tooltip에 비율 표시
                                label: function(tooltipItem) {
                                    var totalVotes = tooltipItem.dataset.data.reduce((a, b) => a + b, 0);
                                    var percentage = ((tooltipItem.raw / totalVotes) * 100).toFixed(2);
                                    return tooltipItem.label + ": " + tooltipItem.raw + "표 (" + percentage + "%)";
                                }
                            }
                        }
                    }
                }
            });
        } else {
            console.error("차트를 그릴 canvas 요소를 찾을 수 없습니다.");
        }
    });


    
    window.addEventListener('DOMContentLoaded', function() {
        const viewResultsButton = document.getElementById("view-results");
        const backToVoteButton = document.getElementById("back-to-vote");

        if (viewResultsButton) {
            viewResultsButton.addEventListener("click", function() {
                document.getElementById("vote-form-container").style.display = "none";
                document.getElementById("results-container").style.display = "block";
            });
        } else {
            console.error("결과 보기 버튼을 찾을 수 없습니다.");
        }

        if (backToVoteButton) {
            backToVoteButton.addEventListener("click", function() {
                document.getElementById("results-container").style.display = "none";
                document.getElementById("vote-form-container").style.display = "block";
            });
        } else {
            console.error("다시 투표하기 버튼을 찾을 수 없습니다.");
        }
    });

</script>



	<%@ include file="../main/header.jsp" %> 

	<div class="main-container">
		<div class="content-container">
			<div class="movies-container">
				<div class="movie-info">
					<img src="/images/${movie1.title}.jpeg" alt="${movie1.title}">
					<div class="movie-details">
						<h2>${movie1.title}</h2>
						<p>${fn:substring(movie1.description,0,100)}...</p>
					</div>
				</div>

				<div class="movie-info">
					<img src="/images/${movie2.title}.jpeg" alt="${movie2.title}">
					<div class="movie-details">
						<h2>${movie2.title}</h2>
						<p>${fn:substring(movie2.description,0,100)}...</p>
					</div>
				</div>
			</div>

			<div class="vote-container">
				<div id="vote-form-container">
					<button id="view-results">결과 먼저 보기</button>
					<form id="vote-form">
						<div class="vote-option">
							<label><input type="radio" name="movie"
								value="${movie1.movie_id}"> <span>${movie1.title}</span></label>
						</div>

						<div class="vote-option">
							<label><input type="radio" name="movie"
								value="${movie2.movie_id}"> <span>${movie2.title}</span></label>
						</div>

						<div class="vote-button">
							<button id="vote-button" type="submit">투표</button>
						</div>
					</form>

					
				</div>

				<div id="results-container" style="display: none;">
					<div class="chart-container">
						<canvas id="vote-chart"></canvas>
					</div>
					<button id="back-to-vote">다시 투표하기</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../main/footer.jsp" %> 
</body>
</html>
