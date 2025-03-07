package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("BoardCommentDto")
@Data
public class BoardCommentDto {
    private int comment_id;
    private int post_id;
    private int user_id;
    private String content;
    private Timestamp created_at;
    private Timestamp updated_at;
}