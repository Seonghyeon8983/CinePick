package vote.controller;

import data.dto.MovieDto;
import data.dto.VoteDto;
import data.service.MovieService;
import data.service.VoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class VoteMovieController {

    private final MovieService movieService;
    private final VoteService voteService;

    @Autowired
    public VoteMovieController(MovieService movieService, VoteService voteService) {
        this.movieService = movieService;
        this.voteService = voteService;
    }

    @GetMapping("/votemovie")
    public String voteMovie(@RequestParam("id") int id,
                            @RequestParam("movie1id") int movie1id,
                            @RequestParam("movie2id") int movie2id,
                            Model model) {

        MovieDto movie1 = movieService.getMovieById(movie1id);
        MovieDto movie2 = movieService.getMovieById(movie2id);

        List<VoteDto> votes = voteService.getVotesByPollId(id);

        // 각 영화별 투표수 계산
        int movie1Votes = 0;
        int movie2Votes = 0;

        for (VoteDto vote : votes) {
            if (vote.getVoted_movie_id() == movie1id) {
                movie1Votes++;
            } else if (vote.getVoted_movie_id() == movie2id) {
                movie2Votes++;
            }
        }

        // Model에 영화정보 및 투표수 추가
        model.addAttribute("movie1", movie1);
        model.addAttribute("movie2", movie2);
        model.addAttribute("movie1Votes", movie1Votes);
        model.addAttribute("movie2Votes", movie2Votes);

        return "vote/votemovie";
    }
}