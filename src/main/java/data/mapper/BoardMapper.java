package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.BoardDto;
import data.dto.MovieDto;

@Mapper
public interface BoardMapper {
    public void insertBoard(BoardDto dto);
    public List<BoardDto> getAllBoards();
    public BoardDto getBoardById(int post_id);
    public void updateBoard(BoardDto dto);
    public void deleteBoard(int post_id);
    public BoardDto getBoardWithMovieById(int post_id);
    public MovieDto getMovieById(int movieId);
}
