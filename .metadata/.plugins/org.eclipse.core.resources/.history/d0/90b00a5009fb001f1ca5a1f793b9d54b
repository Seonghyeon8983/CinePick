package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.CommentDto;

@Mapper
public interface CommentMapper {
    public void insertComment(CommentDto dto);
    public List<CommentDto> getCommentsByReviewId(int reviewId);
    public void updateComment(CommentDto dto);
    public void deleteComment(int commentId);
}
