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

    public List<VoteDto> getVotesByPollId(int poll_id) {
        return voteMapper.getVotesByPollId(poll_id);
    }

    public void updateVote(VoteDto dto) {
        voteMapper.updateVote(dto);
    }

    public void deleteVote(int vote_id) {
        voteMapper.deleteVote(vote_id);
    }
}
