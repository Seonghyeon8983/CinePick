package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("BoardDto")
@Data
public class BoardDto {
    private int post_id;
    private int user_id;
    private String title;
    private String content;
    private Timestamp created_at;
    private Timestamp updated_at;
}