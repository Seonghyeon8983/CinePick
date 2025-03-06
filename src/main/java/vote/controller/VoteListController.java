package vote.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class VoteListController {
	@GetMapping("/votelist")
	public String goVote() {
		return "vote/votelist";
	}
	
	
}
