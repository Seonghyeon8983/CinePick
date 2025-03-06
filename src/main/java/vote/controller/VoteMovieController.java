package vote.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class VoteMovieController {
	@GetMapping("votemovie")
	public String govoteMovie() {
		return "vote/votemovie";
	}
	
}
