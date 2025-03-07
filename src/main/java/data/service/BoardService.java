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

    public BoardDto getBoardById(int post_id) {
        return boardMapper.getBoardById(post_id);
    }

    public void updateBoard(BoardDto dto) {
        boardMapper.updateBoard(dto);
    }

    public void deleteBoard(int post_id) {
        boardMapper.deleteBoard(post_id);
    }
}
