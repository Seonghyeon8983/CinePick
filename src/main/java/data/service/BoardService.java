package data.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import data.dto.BoardDto;
import data.dto.MovieDto;
import data.mapper.BoardMapper;
import data.mapper.MovieMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardService {
    private final BoardMapper boardMapper;
    private final MovieMapper movieMapper;
    
    @Transactional
    public void insertBoard(BoardDto dto) {
        boardMapper.insertBoard(dto);
    }

    public List<BoardDto> getAllBoards() {
        List<BoardDto> boardList = boardMapper.getAllBoards();

        for (BoardDto board : boardList) {
        	MovieDto movie = movieMapper.getMovieById(board.getMovie_id());
            if (movie != null) {
                board.setMovieTitle(movie.getTitle());
            } else {
            	board.setMovieTitle("제목 없음");
            }
        }

        return boardList;
    }

    public BoardDto getBoardById(int post_id) {
        BoardDto board = boardMapper.getBoardById(post_id);

        if (board != null && board.getMovie_id() != 0) {
            MovieDto movie = movieMapper.getMovieById(board.getMovie_id());
            if (movie != null) {
                board.setMovieTitle(movie.getTitle());
            }
        } else {
        	board.setMovieTitle("영화 추천 받아요");
        }

        return board;
    }
    
    public void updateBoard(BoardDto dto) {
        boardMapper.updateBoard(dto);
    }

    public void deleteBoard(int post_id) {
        boardMapper.deleteBoard(post_id);
    }
}
