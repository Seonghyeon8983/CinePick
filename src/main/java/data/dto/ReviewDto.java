package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("ReviewDto")
@Data
public class ReviewDto {
    private int review_id;
    private int user_id;
    private int movie_id;
    private int rating;
    private String content;
    private Timestamp created_at;
    private Timestamp updated_at;
}