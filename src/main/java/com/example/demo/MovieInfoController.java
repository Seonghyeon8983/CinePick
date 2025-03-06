package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MovieInfoController {
	@GetMapping("/movieinfopage")
	public String goMovieinfo()
	{
		return "movieinfo/movieinfopage";
	}
}
