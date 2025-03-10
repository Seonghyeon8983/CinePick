package data.service;

import java.util.List;
import org.springframework.stereotype.Service;
import data.dto.BoardDto;
import data.mapper.BoardMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardService {
    private final BoardMapper boardMapper;

    public void insertBoard(BoardDto dto) {
        boardMapper.insertBoard(dto);
    }

    public List<BoardDto> getAllBoards() {
        return boardMapper.getAllBoards();
    }

    public BoardDto getBoardById(int postId) {
        return boardMapper.getBoardById(postId);
    }

    public void updateBoard(BoardDto dto) {
        boardMapper.updateBoard(dto);
    }

    public void deleteBoard(int postId) {
        boardMapper.deleteBoard(postId);
    }
}
