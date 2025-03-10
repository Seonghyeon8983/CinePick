package com.example.demo;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ModelAttribute;
import data.dto.BoardDto;
import data.dto.MovieDto;
import data.service.BoardService;
import data.service.MovieService;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class BoardController {
    
    private final BoardService boardService;
    private final MovieService movieService;  // 영화 서비스 추가
    
	@GetMapping("/boardpage")
	public String goBoard(Model model) {
	    List<BoardDto> boardList = boardService.getAllBoards();
	    model.addAttribute("boardList", boardList);
	    return "board/boardpage";
	}
	
    @GetMapping("/postpage")
	public String goPost(@RequestParam("id") int id, Model model) {
	    BoardDto post = boardService.getBoardById(id);  // 수정된 메서드명 반영
	    if (post == null) {
	        model.addAttribute("error", "해당 게시글을 찾을 수 없습니다.");
	        return "board/postpage";
	    }
	    model.addAttribute("post", post);
	    return "board/postpage";
	}
    
    // 게시글 작성 페이지
    @GetMapping("/postwritepage")
    public String goPostWrite() {
        return "board/postwritepage";
    }

    @PostMapping("/boardpage/insert")
    public String insertBoard(@ModelAttribute BoardDto boardDto) {
        boardService.insertBoard(boardDto);
//        return "board/postwritepage";
        return "redirect:/boardpage";
    }
}
