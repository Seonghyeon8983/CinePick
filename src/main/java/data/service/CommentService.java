package data.service;

import java.util.List;
import org.springframework.stereotype.Service;
import data.dto.CommentDto;
import data.mapper.CommentMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CommentService {
    private final CommentMapper commentMapper;

    public void insertComment(CommentDto dto) {
        commentMapper.insertComment(dto);
    }

    public List<CommentDto> getCommentsByReviewId(int review_id) {
        return commentMapper.getCommentsByReviewId(review_id);
    }

    public void updateComment(CommentDto dto) {
        commentMapper.updateComment(dto);
    }

    public void deleteComment(int comment_id) {
        commentMapper.deleteComment(comment_id);
    }
}
