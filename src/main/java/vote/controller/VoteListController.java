package vote.controller;

import data.dto.CompDto;
import data.dto.MovieDto;
import data.service.CompService;
import data.service.MovieService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class VoteListController {

    private final CompService compService;
    private final MovieService movieService;

    // 'votelist' 페이지 반환
    @GetMapping("votelist")
    public String govoteMovie() {
        return "vote/votelist";
    }

    // Comparison Polls (투표 목록) API
    @GetMapping("/api/comparison-polls")
    @ResponseBody
    public List<CompDto> getAllCompNames() {
        List<CompDto> polls = compService.getAllCompNames();
        return polls != null ? polls : new ArrayList<>();
    }

    // 영화 목록 API
    @GetMapping("/api/get-movie-list")
    @ResponseBody
    public List<MovieDto> getMovieList() {
        // 영화 목록을 MovieService에서 받아옴
        List<MovieDto> movies = movieService.getAllMovies();
        return movies != null ? movies : new ArrayList<>();
    }

    // 새로운 투표 생성 API
    @PostMapping("/api/create-poll")
    @ResponseBody
    public String createPoll(@RequestParam int movie1Id, @RequestParam int movie2Id) {
//        // request로부터 영화 IDs를 가져옴
//        int movie1Id = request.getMovie1Id();
//        int movie2Id = request.getMovie2Id();

        // 투표를 생성하는 로직
        boolean isCreated = compService.createComparisonPoll(movie1Id, movie2Id);

        if (isCreated) {
            return "투표가 성공적으로 생성되었습니다!";
        } else {
            return "투표 생성에 실패했습니다.";
        }
    }

//    // 투표 생성 시 필요한 정보
//    public class CreatePollRequest {
//        private int movie1Id;  
//        private int movie2Id;  
//
//        // Getter, Setter
//        public int getMovie1Id() {
//            return movie1Id;
//        }
//
//        public void setMovie1Id(int movie1Id) {
//            this.movie1Id = movie1Id;
//        }
//
//        public int getMovie2Id() {
//            return movie2Id;
//        }
//
//        public void setMovie2Id(int movie2Id) {
//            this.movie2Id = movie2Id;
//        }
//    }
}

