package data.dto;



import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("UserDto")
@Data
public class UserDto {
    private int user_id;
    private String username;
    private String email;
    private String password_hash;
    private Timestamp created_at;
    private Timestamp updated_at;
}