package vote.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class VoteMovieResultcontroller {
	@GetMapping("votemovie")
	public String govoteMovie() {
		return "vote/votemovie";
	}
	
}
