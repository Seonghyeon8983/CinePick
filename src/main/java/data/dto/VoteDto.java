package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("VoteDto")
@Data
public class VoteDto {
    private int vote_id;
    private int poll_id;
    private int user_id;
    private int voted_movie_id;
    private Timestamp created_at;
}