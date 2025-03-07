package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.UserDto;

@Mapper
public interface UserMapper {
    public void insertUser(UserDto dto);
    public List<UserDto> getAllUsers();
    public UserDto getUserById(int user_id);
    public void updateUser(UserDto dto);
    public void deleteUser(int user_id);
}