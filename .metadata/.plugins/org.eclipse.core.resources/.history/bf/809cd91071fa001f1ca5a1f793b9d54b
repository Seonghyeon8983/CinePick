package data.service;

import java.util.List;
import org.springframework.stereotype.Service;
import data.dto.UserDto;
import data.mapper.UserMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserService {
    private final UserMapper userMapper;

    public void insertUser(UserDto dto) {
        userMapper.insertUser(dto);
    }

    public List<UserDto> getAllUsers() {
        return userMapper.getAllUsers();
    }

    public UserDto getUserById(int userId) {
        return userMapper.getUserById(userId);
    }

    public void updateUser(UserDto dto) {
        userMapper.updateUser(dto);
    }

    public void deleteUser(int userId) {
        userMapper.deleteUser(userId);
    }
}
