package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import data.dto.BoardDto;
import data.dto.MovieDto;
import data.service.BoardService;
import data.service.MovieService;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class MovieInfoController {
	private final MovieService movieService;
	
	@GetMapping("/movieinfopage")
	public String goMovieinfo(@RequestParam("id") int id, Model model) {
		MovieDto movie = movieService.getMovieById(id);
		
		if (movie == null) {
			model.addAttribute("error", "해당 영화를 찾을 수 없습니다.");
			return "main/mainpage"; // 오류 페이지로 리디렉트
		}

		model.addAttribute("movie", movie);
		return "movieinfo/movieinfopage";
	}
}
