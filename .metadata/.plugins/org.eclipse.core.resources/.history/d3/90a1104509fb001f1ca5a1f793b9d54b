package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.BoardCommentDto;

@Mapper
public interface BoardCommentMapper {
    public void insertBoardComment(BoardCommentDto dto);
    public List<BoardCommentDto> getCommentsByPostId(int postId);
    public void updateBoardComment(BoardCommentDto dto);
    public void deleteBoardComment(int commentId);
}