package com.example.demo;

import java.util.Collections;
import java.util.List;

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
public class MainController {
	private final MovieService movieService;
	private final BoardService boardService;
	
	@GetMapping("/")
    public String getMovieInfo(Model model) {
		List<MovieDto> movieList = movieService.getAllMovies();
		model.addAttribute("movieList", movieList);

	    List<BoardDto> boardList = boardService.getAllBoards();
	    Collections.reverse(boardList); // 리스트를 역순으로 정렬
	    model.addAttribute("boardList", boardList);
        return "main/mainpage";
    }
}
