package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("MovieDto")
@Data
public class MovieDto {
    private int movie_id;
    private String title;
    private String description;
    private Timestamp release_date;
    private int duration;
    private String genre;
    private String director;
    private String cast;
    private Timestamp created_at;
    private Timestamp updated_at;
}