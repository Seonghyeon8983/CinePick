package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("CompDto")
@Data
public class CompDto {
    private int poll_id;
    private int movie_1_id;
    private int movie_2_id;
    private Timestamp created_at;
    private Timestamp updated_at;
    private String pollName;
    private MovieDto movie1; // 첫 번째 영화 정보
    private MovieDto movie2; // 두 번째 영화 정보
}
