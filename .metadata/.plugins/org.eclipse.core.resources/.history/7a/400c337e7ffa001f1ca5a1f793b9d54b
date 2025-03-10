package data.service;

import java.util.List;
import org.springframework.stereotype.Service;
import data.dto.VoteDto;
import data.mapper.VoteMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class VoteService {
    private final VoteMapper voteMapper;

    public void insertVote(VoteDto dto) {
        voteMapper.insertVote(dto);
    }

    public List<VoteDto> getVotesByMovieId(int movieId) {
        return voteMapper.getVotesByMovieId(movieId);
    }

    public void updateVote(VoteDto dto) {
        voteMapper.updateVote(dto);
    }

    public void deleteVote(int voteId) {
        voteMapper.deleteVote(voteId);
    }
}
