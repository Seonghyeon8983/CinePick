package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
	@GetMapping("/boardpage")
	public String goBoard()
	{
		return "board/boardpage";
	}

	@GetMapping("/postwritepage")
	public String goPostWrite()
	{
		return "board/postwritepage";
	}

	@GetMapping("/postpage")
	public String goPost()
	{
		return "board/postpage";
	}
}
