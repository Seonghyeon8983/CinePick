package data.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import data.dto.VoteDto;

@Mapper
public interface VoteMapper {
    void insertVote(VoteDto dto);
    List<VoteDto> getVotesByPollId(int pollId);
    void updateVote(VoteDto dto);
    void deleteVote(int voteId);
}
