package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("CommentDto")
@Data
public class CommentDto {
    private int comment_id;
    private int review_id;
    private int user_id;
    private String content;
    private Timestamp created_at;
    private Timestamp updated_at;
}